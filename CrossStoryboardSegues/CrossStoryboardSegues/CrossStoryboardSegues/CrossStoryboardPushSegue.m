#import "CrossStoryboardPushSegue.h"
#import "CrossStoryboardSegueDestination.h"

@implementation CrossStoryboardPushSegue

- (void)perform {
    if (![self.destinationViewController conformsToProtocol:@protocol(CrossStoryboardSegueDestination)]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"Can't perform a cross-storyboard push with view controller %@ that does not conform to CrossStoryboardSegueDestination", self.destinationViewController] userInfo:nil];
    }

    UIViewController *destinationViewController = [self.destinationViewController realDestinationViewController];
    [[self.sourceViewController navigationController] pushViewController:destinationViewController animated:YES];
}

@end
