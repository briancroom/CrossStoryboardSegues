#import <Foundation/Foundation.h>

@protocol CrossStoryboardSegueDestination <NSObject>
@property (nonatomic, strong) NSString *destinationStoryboardName;
@property (nonatomic, strong) NSString *destinationViewControllerIdentifier;
@end
