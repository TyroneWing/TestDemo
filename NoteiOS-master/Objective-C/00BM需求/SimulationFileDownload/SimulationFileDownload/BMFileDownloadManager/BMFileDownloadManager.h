//
//  BMFileDownloadManager.h
//  DownloadFile
//
//  Created by __liangdahong on 2016/12/4.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 下载进度
 @param downloadProgress NSProgress
 */
typedef void(^BMFileDownloadManagerProgressBlock)(NSProgress *downloadProgress);

/**
 下载完成
 @param filePath 下载后文件保存的沙盒路径
 @param error 错误信息
 */
typedef void(^BMFileSuccessBlock)(NSString *filePath, NSError *error);

/**
 文件下载管理者
 */
@interface BMFileDownloadManager : NSObject

/**
 清除 BMFileDownloadManager 所有的缓存
 */
+ (void)clearAllCache;

/**
 清除 BMFileDownloadManager 对 url 的缓存
 @param url url
 */
+ (void)clearCacheWithURLString:(NSString *)url;

/**
 获取 BMFileDownloadManager 的所有缓存 单位 B
 @return 缓存大小
 */
+ (uint64_t)totalCount;

/**
 下载文件
 @param url 文件url
 @param fileName 文件名称
 @param fileType 文件类型
 @param downloadProgress 下载进度
 @param successBlock     下载完成
*/
+ (void)downloadFileWithURLString:(NSString *)url
                         fileName:(NSString *)fileName
                         fileType:(NSString *)fileType
                 downloadProgress:(BMFileDownloadManagerProgressBlock)downloadProgress
                     successBlock:(BMFileSuccessBlock)successBlock;

@end


