#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *pushToInitialButton;
@property (weak, nonatomic) IBOutlet UIButton *presentInitialButton;
@property (weak, nonatomic) IBOutlet UIButton *pushToOtherButton;
@property (weak, nonatomic) IBOutlet UIButton *presentOtherButton;

@property (weak, nonatomic) IBOutlet UIButton *brokenPushButton;
@property (weak, nonatomic) IBOutlet UIButton *brokenPresentButton;
@end

@interface InitialViewController : UIViewController
@end
@interface OtherViewController : UIViewController
@end