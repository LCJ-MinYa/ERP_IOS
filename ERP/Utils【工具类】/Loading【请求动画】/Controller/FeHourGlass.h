#import <UIKit/UIKit.h>

@interface FeHourGlass : UIView

// is running
@property (assign, readonly, nonatomic) BOOL isShowing;

-(instancetype) initWithView:(UIView *) view;

-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;

@end
