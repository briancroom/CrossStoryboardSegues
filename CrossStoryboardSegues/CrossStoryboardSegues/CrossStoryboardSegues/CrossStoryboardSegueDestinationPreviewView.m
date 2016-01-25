#import "CrossStoryboardSegueDestinationPreviewView.h"

IB_DESIGNABLE @implementation CrossStoryboardSegueDestinationPreviewView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSString *output;
    output = [NSString stringWithFormat:@"%@ %@ %@", self.destinationStoryboardName, self.destinationViewControllerIdentifier, self.destinationStoryboardBundleIdentifier];
//    if (self.superview) {
//        [[UIColor blueColor] set];
//    }
    if (self.nextResponder) {
        [[UIColor greenColor] set];
        [[self.nextResponder debugDescription] writeToFile:@"/Users/devfloater106-xl/Desktop/IB-test.txt" atomically:NO encoding:NSUTF8StringEncoding error:NULL];
    }
    else {
        [[UIColor redColor] set];
    }
    [[UIBezierPath bezierPathWithRect:rect] fill];

    [output writeToFile:@"/Users/devfloater106-xl/Desktop/IB-test.txt" atomically:NO encoding:NSUTF8StringEncoding error:NULL];
}

@end
