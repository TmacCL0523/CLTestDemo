/***

    当前的文件名
    HomePageViewController.m

    不带后缀的文件名
    HomePageViewController

     　　　　　　　 ┏┓       ┏┓+ +
     　　　　　　　┏┛┻━━━━━━━┛┻┓ + +
     　　　　　　　┃　　　　　　 ┃
     　　　　　　　┃　　　━　　　┃ ++ + + +
     　　　　　　 █████━█████  ┃+
     　　　　　　　┃　　　　　　 ┃ +
     　　　　　　　┃　　　┻　　　┃
     　　　　　　　┃　　　　　　 ┃ + +
     　　　　　　　┗━━┓　　　 ┏━┛
                    ┃　　  ┃
     　　　　　　　　　┃　　  ┃ + + + +
     　　　　　　　　　┃　　　┃　Code is far away from     bug with the animal protecting
     　　　　　　　　　┃　　　┃ + 　　　　         神兽保佑,代码无bug
     　　　　　　　　　┃　　　┃
     　　　　　　　　　┃　　　┃　　+
     　　　　　　　　　┃　 　 ┗━━━┓ + +
     　　　　　　　　　┃ 　　　　　┣┓
     　　　　　　　　　┃ 　　　　　┏┛
     　　　　　　　　　┗┓┓┏━━━┳┓┏┛ + + + +
     　　　　　　　　　 ┃┫┫　 ┃┫┫
     　　　　　　　　　 ┗┻┛　 ┗┻┛+ + + +

**/

#import "HomePageViewController.h"
#import "ChooseChatController.h"///陪聊
#import "AccompanyChatController.h"///选聊
#import "AskForChatController.h"///求聊

@interface HomePageViewController ()<UIScrollViewDelegate>

/// 滚动式图
@property (nonatomic , strong) UIScrollView *bgView;

@property (nonatomic , strong) UISegmentedControl *titleControl;

@property (nonatomic, strong) NSMutableArray <UIViewController *> *vcArray;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UIViewController *currentChildVc;

@end

@implementation HomePageViewController

#pragma mark ================Object - 对象=================
- (NSMutableArray *)vcArray
{
    if (!_vcArray) {
        _vcArray = [NSMutableArray new];
    }
    return _vcArray;
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"求聊", @"陪聊", @"选聊"];
    }
    return _titleArray;
}

- (UISegmentedControl *)titleControl
{
    if (!_titleControl) {
        _titleControl = [[UISegmentedControl alloc] initWithItems:self.titleArray];
        _titleControl.selectedSegmentIndex = 0;
        _titleControl.backgroundColor = UIColor.whiteColor;
        if (@available(iOS 13.0, *)) {
            [_titleControl setSelectedSegmentTintColor:CLRGBAColor(114, 0, 255, 1)];
        } else {
            [_titleControl setTintColor:CLRGBAColor(114, 0, 255, 1)];
        }
        [_titleControl addTarget:self action:@selector(itemChange) forControlEvents:UIControlEventValueChanged];
        [_titleControl setBackgroundImage:[UIImage clKitImageCreateWithColor:UIColor.whiteColor] forState:UIControlStateNormal barMetrics:UIBarMetricsCompactPrompt];
    }
    return _titleControl;
}

- (UIScrollView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _bgView.contentSize = CGSizeMake(self.view.frame.size.width * self.titleArray.count, 0);
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.pagingEnabled = YES;
        _bgView.showsHorizontalScrollIndicator = NO;
        _bgView.delegate = self;
        _bgView.bounces=NO; //反弹效果

    }
    return _bgView;
}

#pragma mark ================Initialize-初始化=================

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

}

- (void)viewWillAppear:(BOOL)animated
{
    CLLogFrame(self.bgView);
}

#pragma mark ================Methods - 方法=================
- (void)itemChange
{
    CLLogInteger(self.titleControl.selectedSegmentIndex);
    CGFloat xValue;
    switch (self.titleControl.selectedSegmentIndex) {
        case 0:
            xValue = 0;
            break;
        case 1:
            xValue = CLScreenWidth;
            break;
        default:
            xValue = CLScreenWidth *2;
            break;
    }
    CLLogPoint(self.bgView.contentOffset);
    [self.bgView setContentOffset:CGPointMake(xValue, 0) animated:YES];
}

#pragma mark ================Delegate - 代理=================
#pragma mark - scrollViewDelegae
//执行动画结束跳转到这里
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVC];
}

//人为手动滚动结束到这里
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger n = self.bgView.contentOffset.x / self.bgView.width;
    self.titleControl.selectedSegmentIndex = n;
    CLLogInteger(n);
    [self addChildVC];
}
#pragma mark ================Private - 私有=================
- (void)clSetupViews
{
    [self.view addSubview:self.titleControl];
    [self.view addSubview:self.bgView];
    
    [self.titleControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(CLStatusBarHeight);
        make.left.equalTo(self.view).offset(82);
        make.right.equalTo(self.view).offset(-82);
        make.height.mas_equalTo(40);
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleControl.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [self createChildView];
    [self addChildVC];
}

-(void)createChildView
{

    AskForChatController * all = [[AskForChatController alloc]init];
    [self addChildViewController:all];
    
    AccompanyChatController * vedio = [[AccompanyChatController alloc]init];
    [self addChildViewController:vedio];
    
    ChooseChatController * sound = [[ChooseChatController alloc]init];
    [self addChildViewController:sound];
    [self.vcArray addObject:all];
    [self.vcArray addObject:vedio];
    [self.vcArray addObject:sound];
    
}

-(void)addChildVC
{
    CLLogFloat(self.bgView.contentOffset.x);
    CLLogFloat(self.bgView.clKitWidth);
    NSInteger n = self.bgView.contentOffset.x / self.bgView.clKitWidth;
    if (n < 0) {
        n = 0;
    }
    UIViewController * ChildVC = (UIViewController * )self.vcArray[n];
    ChildVC.view.frame = self.bgView.bounds;
    if (ChildVC.view.superview) {
        return;
    }
    [self.bgView addSubview:ChildVC.view];
}


@end
