//
//  ViewControllerProxy.m
//  CrossStoryboardSegues
//
//  Created by DEVFLOATER106-XL on 2014-09-16.
//
//

#import "ViewControllerProxy.h"

@interface ViewControllerProxy ()
@property (nonatomic, strong) UIViewController *viewController;
@end

@implementation ViewControllerProxy

- (instancetype)initWithViewController:(UIViewController *)viewController {
    _viewController = viewController;
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.viewController;
}

@end
