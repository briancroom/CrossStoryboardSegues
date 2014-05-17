#import "ViewController.h"

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"InitialViewControllerPush"]) {
        [(InitialViewController *)segue.destinationViewController setValue:@"Pushed"];
    }
    else if ([segue.identifier isEqualToString:@"InitialViewControllerPresent"]) {
        [(InitialViewController *)segue.destinationViewController setValue:@"Presented"];
    }
    else {
        [super prepareForSegue:segue sender:segue];
    }
}

@end

@implementation InitialViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.valueLabel.text = [@"Value: " stringByAppendingString:self.value ?: @"<none>"];
    self.valueFromStoryboardLabel.text = [@"Value From Storyboard: " stringByAppendingString:self.valueFromStoryboard ?: @"<none>"];
}
@end

@implementation OtherViewController @end
