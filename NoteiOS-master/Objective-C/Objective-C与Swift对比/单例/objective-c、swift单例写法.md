# Objective-C、Swift单例写法

## Objective-C写法
<pre>
<code>
+ (instancetype)sharedInstance {
    static IHUserManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
</code>
</pre>

## Swift写法
<pre>
<code>
class IHUserManager{
    class sharedInstance {
        static let sharedInstance = IHUserManager()
    }
}
</code>
</pre>
