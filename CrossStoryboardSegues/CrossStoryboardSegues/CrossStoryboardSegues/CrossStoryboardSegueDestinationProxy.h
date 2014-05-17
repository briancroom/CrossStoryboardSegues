#import <Foundation/Foundation.h>
#import "CrossStoryboardSegueDestination.h"

@interface CrossStoryboardSegueDestinationProxy : NSProxy <CrossStoryboardSegueDestination>

@property (nonatomic, strong) NSString *destinationStoryboardName;
@property (nonatomic, strong) NSString *destinationViewControllerIdentifier;

@property (nonatomic, strong, readonly) UIViewController *realDestinationViewController;

+ (instancetype)proxy;

@end
