#import "FeHourGlassViewController.h"
#import "FeHourGlass.h"

@interface FeHourGlassViewController ()
@property (strong, nonatomic) FeHourGlass *hourGlass;

@end

@implementation FeHourGlassViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _hourGlass = [[FeHourGlass alloc] initWithView:self.view];
    [self.view addSubview:_hourGlass];
    
    [_hourGlass showWhileExecutingBlock:^{
        [self myTask];
    } completion:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}
- (void)myTask
{
    // Do something usefull in here instead of sleeping ...
    sleep(12);
}
@end
