#import "UIStoryboard+CrossStoryboardSegues.h"

@implementation UIStoryboard (CrossStoryboardSegues)
- (instancetype)crossstoryboardsegues_storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil {
    return [[self class] storyboardWithName:name bundle:storyboardBundleOrNil];
}
@end
