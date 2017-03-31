//
//  BMFileDownloadManager.m
//  DownloadFile
//
//  Created by __liangdahong on 2016/12/4.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMFileDownloadManager.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonHMAC.h>

typedef void(^BMDownloadProgress)(NSProgress *downloadProgress);
typedef void(^BMFileSuccess)(NSString *filePath, NSError *error);

#pragma mark - BMFileDownloadModel

@interface BMFileDownloadModel : NSObject

@property (nonatomic, copy) BMDownloadProgress downloadProgress;
@property (nonatomic, copy) BMFileSuccess fileSuccess;
@property (nonatomic, strong) NSProgress *latestProgress;

@end

@interface BMFileDownloadManager ()
@property (strong, nonatomic) NSFileManager *fileManager;
@property (copy, nonatomic) NSString *cachePath;
@property (nonatomic, strong) NSMutableDictionary <NSString *, BMFileDownloadModel *>* fileDownloadManagerDictionary;
@end

@implementation BMFileDownloadModel
@end

#pragma mark - _MD5

@implementation NSString (_MD5)

- (NSString *)bm_md5String {
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)stringFromBytes:(unsigned char *)bytes length:(unsigned long)length {
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}
@end

#pragma mark - BMFileDownloadManager

@implementation BMFileDownloadManager

#pragma mark - getters setters

- (NSFileManager *)fileManager {
    if (!_fileManager) {
        _fileManager = [NSFileManager defaultManager];
    }
    return _fileManager;
}

- (NSString *)cachePath {
    if (!_cachePath || _cachePath.length == 0) {
        _cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"BMFileDownloadManager/BMFile"];
    }
    return _cachePath;
}

- (NSMutableDictionary<NSString *,BMFileDownloadModel *> *)fileDownloadManagerDictionary {
    if (!_fileDownloadManagerDictionary) {
        _fileDownloadManagerDictionary = [@{} mutableCopy];
    }
    return _fileDownloadManagerDictionary;
}

#pragma mark - 公有方法

+ (void)clearAllCache {
    [[[self sharedFileDownloadManager] fileManager] removeItemAtPath:[[self sharedFileDownloadManager] cachePath] error:nil];
}

+ (void)clearCacheWithURLString:(NSString *)url {
    NSString *path = [[[self sharedFileDownloadManager] cachePath] stringByAppendingPathComponent:[url bm_md5String]];
    [[[self sharedFileDownloadManager] fileManager] removeItemAtPath:path error:nil];
}

+ (uint64_t)totalCount {
    return [[self sharedFileDownloadManager] folderSizeAtPath:[[self sharedFileDownloadManager] cachePath]];
}

+ (void)downloadFileWithURLString:(NSString *)url
                         fileName:(NSString *)fileName
                         fileType:(NSString *)fileType
                 downloadProgress:(BMFileDownloadManagerProgressBlock)downloadProgress
                     successBlock:(BMFileSuccessBlock)successBlock {
    [[self sharedFileDownloadManager] _downloadFileWithURLString:url fileName:fileName fileType:fileType downloadProgress:downloadProgress successBlock:successBlock];
}

#pragma mark - 私有方法

+ (instancetype)sharedFileDownloadManager {
    static BMFileDownloadManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [self new];
    });
    return shared;
}

- (void)_downloadFileWithURLString:(NSString *)url
                          fileName:(NSString *)fileName
                          fileType:(NSString *)fileType
                  downloadProgress:(BMFileDownloadManagerProgressBlock)downloadProgress
                      successBlock:(BMFileSuccessBlock)successBlock {

    if (!url.length || !fileName.length || !fileType.length || ![NSURL URLWithString:url]) {
        printf("%s:参数错误", __func__);
        return;
    }

    // 文件所在的文件夹路径
    NSString *path = [self.cachePath stringByAppendingPathComponent:[url bm_md5String]];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.%@", path, fileName, fileType];
    
    // 如果已经下载过
    if([self.fileManager fileExistsAtPath:path] && [self.fileManager fileExistsAtPath:filePath]) {
        if (successBlock) {
            successBlock(filePath, nil);
        }
        return;
    }
    
    // 如果在下载 更新block return
    BMFileDownloadModel *obj = self.fileDownloadManagerDictionary[[url bm_md5String]];
    if (obj) {
        obj.downloadProgress = downloadProgress;
        obj.fileSuccess = successBlock;
        if (obj.downloadProgress) {
            obj.downloadProgress(obj.latestProgress);
        }
        return;
    }
    
    // 如果文件操作错误 return
    NSError *error = nil;
    BOOL sel = [self.fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    if (!sel || error) {
        if (successBlock) {
            printf("文件操作错误");
            successBlock(nil, [NSError errorWithDomain:@"文件操作错误" code:-20111 userInfo:nil]);
        }
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    obj = [BMFileDownloadModel new];
    obj.latestProgress = nil;
    obj.downloadProgress = downloadProgress;
    obj.fileSuccess = successBlock;
    self.fileDownloadManagerDictionary[[url bm_md5String]] = obj;
    
    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            BMFileDownloadModel *model = self.fileDownloadManagerDictionary[[url bm_md5String]];
            model.latestProgress = downloadProgress;
            if (model.downloadProgress) {
                model.downloadProgress(downloadProgress);
            }
        });
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:filePath isDirectory:YES];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable tempFilePath, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            BMFileDownloadModel *model = self.fileDownloadManagerDictionary[[url bm_md5String]];
            self.fileDownloadManagerDictionary[[url bm_md5String]] = nil;;
            if (error) {
                if (model.fileSuccess) {
                    model.fileSuccess(nil, error);
                }
            }else {
                if (model.fileSuccess) {
                    model.fileSuccess(filePath, nil);
                }
            }
        });
    }];
    [download resume];
}

- (uint64_t) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

- (uint64_t) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}
@end
