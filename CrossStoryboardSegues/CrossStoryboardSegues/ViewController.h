#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *pushToInitialButton;
@property (weak, nonatomic) IBOutlet UIButton *presentInitialButton;
@property (weak, nonatomic) IBOutlet UIButton *pushToOtherButton;
@property (weak, nonatomic) IBOutlet UIButton *presentOtherButton;
@property (weak, nonatomic) IBOutlet UIButton *pushToDifferentBundleButton;
@property (weak, nonatomic) IBOutlet UIButton *presentDifferentBundleButton;

@property (weak, nonatomic) IBOutlet UIButton *brokenPushButton;
@property (weak, nonatomic) IBOutlet UIButton *brokenPresentButton;
@end

@interface InitialViewController : UIViewController
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *valueFromStoryboard;

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueFromStoryboardLabel;

@end

@interface OtherViewController : UIViewController @end
