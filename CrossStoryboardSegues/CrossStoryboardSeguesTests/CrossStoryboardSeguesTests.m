#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface SubclassedStoryboard : UIStoryboard @end
@implementation SubclassedStoryboard @end

@interface CrossStoryboardSeguesTests : XCTestCase
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) ViewController *startingViewController;
@end

static void tapButton(UIButton *button) {
    [button sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@implementation CrossStoryboardSeguesTests

- (void)setUp {
    [super setUp];
    self.window = [[[UIApplication sharedApplication] delegate] window];
    self.navController = [[SubclassedStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    self.startingViewController = [self.navController.viewControllers firstObject];
    self.window.rootViewController = self.navController;
}

- (void)testPushesToInitialViewControllerOfNextStoryboard {
    tapButton(self.startingViewController.pushToInitialButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:[InitialViewController class]], @"Didn't push to InitialViewController");
}

- (void)testPushesToOtherViewControllerOfNextStoryboard {
    tapButton(self.startingViewController.pushToOtherButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:[OtherViewController class]], @"Didn't push to OtherViewController");
}

- (void)testPushDestinationHasUsesSameStoryboardClassAsSource {
    tapButton(self.startingViewController.pushToInitialButton);
    XCTAssertEqual([self.startingViewController.storyboard class], [self.navController.visibleViewController.storyboard class], @"Used wrong storyboard class");
}

- (void)testPushThrowsExceptionIfNotUsedWithDestinationPlaceholder {
    XCTAssertThrowsSpecificNamed(tapButton(self.startingViewController.brokenPushButton), NSException, NSInternalInconsistencyException, @"Didn't throw an exception when pushing");
}


- (void)testPresentsInitialViewControllerOfNextStoryboard {
    tapButton(self.startingViewController.presentInitialButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:[InitialViewController class]], @"Didn't present InitialViewController");
}

- (void)testPresentsOtherViewControllerOfNextStoryboard {
    tapButton(self.startingViewController.presentOtherButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:[OtherViewController class]], @"Didn't present to OtherViewController");
}

- (void)testPresentDestinationHasUsesSameStoryboardClassAsSource {
    tapButton(self.startingViewController.presentInitialButton);
    XCTAssertEqual([self.startingViewController.storyboard class], [self.navController.visibleViewController.storyboard class], @"Used wrong storyboard class");
}

- (void)testPresentThrowsExceptionIfNotUsedWithDestinationPlaceholder {
    XCTAssertThrowsSpecificNamed(tapButton(self.startingViewController.brokenPresentButton), NSException, NSInternalInconsistencyException, @"Didn't throw an exception when presenting");
}

@end
