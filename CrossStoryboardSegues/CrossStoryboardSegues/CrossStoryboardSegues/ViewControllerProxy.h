//
//  ViewControllerProxy.h
//  CrossStoryboardSegues
//
//  Created by DEVFLOATER106-XL on 2014-09-16.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerProxy : NSProxy
- (instancetype)initWithViewController:(UIViewController *)viewController;
@end
