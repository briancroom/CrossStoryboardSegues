#import <UIKit/UIKit.h>

@interface CrossStoryboardSegueDestinationPreviewView : UIView

@property (nonatomic, strong) IBInspectable NSString *storyboardName;
@property (nonatomic, strong) IBInspectable NSString *storyboardBundleIdentifier;
@property (nonatomic, strong) IBInspectable NSString *viewControllerIdentifier;

@end
