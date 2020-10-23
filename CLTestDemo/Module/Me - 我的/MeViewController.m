/***

    当前的文件名
    MeViewController.m

    不带后缀的文件名
    MeViewController
     
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

#import "MeViewController.h"
#import "MeHeaderView.h"
#import "MeView.h"
#import "SettingItemCell.h"


@interface MeViewController ()

@property (nonatomic , strong) MeView *meView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation MeViewController

#pragma mark ================Object - 对象=================
- (MeView *)meView
{
    if (!_meView) {
        _meView = [MeView new];
    }
    return _meView;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
#pragma mark ================Initialize-初始化=================

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = CLRandomColor;
    
    [self.view addSubview:self.meView];
    [self.meView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark ================Methods - 方法=================

#pragma mark ================Delegate - 代理=================

#pragma mark ================Private - 私有=================
#pragma 即将显示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createModel];

}

#pragma 已显示
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma 即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma 已经消失
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(void)createModel
{
    [self.dataArray removeAllObjects];
    NSInteger count = arc4random_uniform(10);
    for (int i = 0; i < count; i ++) {
        SettingItemModel *model = [SettingItemModel new];
        model.title = [NSString clkitRandomString];
        if (i%2 == 0) {
            model.icon = @"礼物柜";
        }else{
            model.icon = @"我的动态";
        }
        [self.dataArray addObject:model];
    }
    CLLogObj(self.dataArray);
    [self.meView clLoadDataWithModel:self.dataArray];
}

@end
