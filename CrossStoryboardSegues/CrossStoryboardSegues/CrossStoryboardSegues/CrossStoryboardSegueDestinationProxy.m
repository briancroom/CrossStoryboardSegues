#import "CrossStoryboardSegueDestinationProxy.h"
#import "UIStoryboard+CrossStoryboardSegues.h"

@interface CrossStoryboardSegueDestinationProxy ()
@property (nonatomic, strong, readwrite) UIViewController *realDestinationViewController;
@property (nonatomic, strong) NSMutableDictionary *keyValueCodingEntriesToForward;
@end

@implementation CrossStoryboardSegueDestinationProxy

+ (instancetype)proxy {
    return [[self alloc] init];
}

- (instancetype)init {
    self.keyValueCodingEntriesToForward = [[NSMutableDictionary alloc] init];
    return self;
}

- (BOOL)respondsToSelector:(SEL)selector {
    return [self.realDestinationViewController respondsToSelector:selector];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [self.realDestinationViewController isKindOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return (aProtocol == @protocol(CrossStoryboardSegueDestination)) || [self.realDestinationViewController conformsToProtocol:aProtocol];
}

- (Class)class {
    return [self.realDestinationViewController class];
}

- (void)awakeFromNib {}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.realDestinationViewController;
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([keyPath isEqualToString:@"destinationStoryboardName"]) {
        self.destinationStoryboardName = value;
    }
    else if ([keyPath isEqualToString:@"destinationStoryboardBundleIdentifier"]) {
        self.destinationStoryboardBundleIdentifier = value;
    }
    else if ([keyPath isEqualToString:@"destinationViewControllerIdentifier"]) {
        self.destinationViewControllerIdentifier = value;
    }
    else if ([keyPath isEqualToString:@"storyboard"]) {
        [self instantiateDestinationViewControllerWithSourceStoryboard:value];
    }
    else {
        if (self.realDestinationViewController) {
            [self.realDestinationViewController setValue:value forKeyPath:keyPath];
        }
        else {
            self.keyValueCodingEntriesToForward[keyPath] = value;
        }
    }
}

- (void)instantiateDestinationViewControllerWithSourceStoryboard:(UIStoryboard *)sourceStoryboard {
    NSBundle *bundle = self.destinationStoryboardBundleIdentifier ? [NSBundle bundleWithIdentifier:self.destinationStoryboardBundleIdentifier] : nil;
    UIStoryboard *storyboard = [sourceStoryboard crossstoryboardsegues_storyboardWithName:self.destinationStoryboardName bundle:bundle];

    if (self.destinationViewControllerIdentifier) {
        self.realDestinationViewController = [storyboard instantiateViewControllerWithIdentifier:self.destinationViewControllerIdentifier];
    }
    else {
        self.realDestinationViewController = [storyboard instantiateInitialViewController];
    }

    [self.keyValueCodingEntriesToForward enumerateKeysAndObjectsUsingBlock:^(NSString *keyPath, id value, BOOL *stop) {
        [self.realDestinationViewController setValue:value forKeyPath:keyPath];
    }];
}

@end
