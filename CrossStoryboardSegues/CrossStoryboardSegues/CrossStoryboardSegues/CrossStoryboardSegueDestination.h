#import <Foundation/Foundation.h>

@protocol CrossStoryboardSegueDestination <NSObject>
- (UIViewController *)realDestinationViewController;
@end
