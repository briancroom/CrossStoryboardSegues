#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"DifferentBundle" withExtension:@"bundle"]] load];
    return YES;
}

@end
