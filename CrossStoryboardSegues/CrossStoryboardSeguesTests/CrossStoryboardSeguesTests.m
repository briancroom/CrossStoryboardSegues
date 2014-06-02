#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "UIStoryboard+CrossStoryboardSegues.h"

@interface SubclassedStoryboard : UIStoryboard
@property (nonatomic) NSString *value;
@end

@implementation SubclassedStoryboard
- (instancetype)crossstoryboardsegues_storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil {
    SubclassedStoryboard *storyboard = [super crossstoryboardsegues_storyboardWithName:name bundle:storyboardBundleOrNil];
    storyboard.value = self.value;
    return storyboard;
}
@end

@interface CrossStoryboardSeguesTests : XCTestCase
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) ViewController *startingViewController;
@property (nonatomic, strong) SubclassedStoryboard *startingStoryboard;
@end

static void tapButton(UIButton *button) {
    [button sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@implementation CrossStoryboardSeguesTests

- (void)setUp {
    [super setUp];
    self.window = [[[UIApplication sharedApplication] delegate] window];

    self.startingStoryboard = (SubclassedStoryboard *)[SubclassedStoryboard storyboardWithName:@"Main" bundle:nil];
    self.startingStoryboard.value = @"My Storyboard";

    self.navController = [self.startingStoryboard instantiateInitialViewController];
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

- (void)testPushesToStoryboardInDifferentBundle {
    tapButton(self.startingViewController.pushToDifferentBundleButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:NSClassFromString(@"DifferentBundleViewController")], @"Didn't push to DifferentBundleViewController");
}

- (void)testPushDestinationUsesSameStoryboardClassAsSource {
    tapButton(self.startingViewController.pushToInitialButton);
    XCTAssertEqual([self.startingViewController.storyboard class], [self.navController.visibleViewController.storyboard class], @"Used wrong storyboard class");
}

- (void)testPushThrowsExceptionIfNotUsedWithDestinationPlaceholder {
    XCTAssertThrowsSpecificNamed(tapButton(self.startingViewController.brokenPushButton), NSException, NSInternalInconsistencyException, @"Didn't throw an exception when pushing");
}

- (void)testAllowsPassingValuesToThePushedStoryboard {
    tapButton(self.startingViewController.pushToInitialButton);
    UIViewController *pushedViewController = self.navController.visibleViewController;
    XCTAssertEqual(self.startingStoryboard.value, ((SubclassedStoryboard *)pushedViewController.storyboard).value, @"Didn't pass value from first storyboard to second");
}

- (void)testAllowsPassingValuesToTheDestinationViewControllerFromPrepareForSegue {
    tapButton(self.startingViewController.pushToInitialButton);
    InitialViewController *pushedViewController = (InitialViewController *)self.navController.visibleViewController;
    XCTAssertNotNil(pushedViewController.value, @"Didn't pass value to the destination view controller");
}

- (void)testAllowsPassingValuesToTheDestinationViewControllerFromStoryboardRuntimeAttributes {
    tapButton(self.startingViewController.pushToInitialButton);
    InitialViewController *pushedViewController = (InitialViewController *)self.navController.visibleViewController;
    XCTAssertNotNil(pushedViewController.valueFromStoryboard, @"Didn't pass value to the destination view controller");
}

- (void)testPresentsInitialViewControllerOfNextStoryboard {
    tapButton(self.startingViewController.presentInitialButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:[InitialViewController class]], @"Didn't present InitialViewController");
}

- (void)testPresentsOtherViewControllerOfNextStoryboard {
    tapButton(self.startingViewController.presentOtherButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:[OtherViewController class]], @"Didn't present OtherViewController");
}

- (void)testPresentsStoryboardInDifferentBundle {
    tapButton(self.startingViewController.presentDifferentBundleButton);

    XCTAssertTrue([self.navController.visibleViewController isKindOfClass:NSClassFromString(@"DifferentBundleViewController")], @"Didn't present DifferentBundleViewController");
}

- (void)testPresentDestinationUsesSameStoryboardClassAsSource {
    tapButton(self.startingViewController.presentInitialButton);
    XCTAssertEqual([self.startingViewController.storyboard class], [self.navController.visibleViewController.storyboard class], @"Used wrong storyboard class");
}

- (void)testPresentThrowsExceptionIfNotUsedWithDestinationPlaceholder {
    XCTAssertThrowsSpecificNamed(tapButton(self.startingViewController.brokenPresentButton), NSException, NSInternalInconsistencyException, @"Didn't throw an exception when presenting");
}

- (void)testAllowsPassingValuesToThePresentedStoryboard {
    tapButton(self.startingViewController.presentInitialButton);
    UIViewController *presentedViewController = self.navController.visibleViewController;
    XCTAssertEqual(self.startingStoryboard.value, ((SubclassedStoryboard *)presentedViewController.storyboard).value, @"Didn't pass value from first storyboard to second");
}

@end
