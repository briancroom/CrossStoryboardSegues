#import "CrossStoryboardSegueDestinationPlaceholderViewController.h"
#import "CrossStoryboardSegueDestinationProxy.h"

@implementation CrossStoryboardSegueDestinationPlaceholderViewController

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
    return [CrossStoryboardSegueDestinationProxy proxy];
}

@end
