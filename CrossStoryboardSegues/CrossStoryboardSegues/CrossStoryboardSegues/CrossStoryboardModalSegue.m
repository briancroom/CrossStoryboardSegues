#import "CrossStoryboardModalSegue.h"
#import "CrossStoryboardSegueDestination.h"

@implementation CrossStoryboardModalSegue

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController<CrossStoryboardSegueDestination> *destinationPlaceholderViewController = self.destinationViewController;

    if (![destinationPlaceholderViewController conformsToProtocol:@protocol(CrossStoryboardSegueDestination)]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"Can't perform a cross-storyboard presentation with view controller %@ that does not conform to CrossStoryboardSegueDestination", destinationPlaceholderViewController] userInfo:nil];
    }

    UIStoryboard *destinationStoryboard = [[sourceViewController.storyboard class] storyboardWithName:destinationPlaceholderViewController.destinationStoryboardName bundle:nil];
    UIViewController *destinationViewController;

    if (destinationPlaceholderViewController.destinationViewControllerIdentifier) {
        destinationViewController = [destinationStoryboard instantiateViewControllerWithIdentifier:destinationPlaceholderViewController.destinationViewControllerIdentifier];
    }
    else {
        destinationViewController = [destinationStoryboard instantiateInitialViewController];
    }

    [sourceViewController presentViewController:destinationViewController animated:YES completion:NULL];
}

@end
