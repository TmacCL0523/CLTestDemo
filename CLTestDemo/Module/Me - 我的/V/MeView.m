/***

    当前的文件名
    MeView.m

    不带后缀的文件名
    MeView

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

#import "MeView.h"
#import "MeHeaderView.h"
#import "MeSettingCell.h"

@interface MeView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *listView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation MeView

#pragma mark ================Object - 对象=================

#pragma mark ================Initialize-初始化=================
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self clSetupViews];
        [self clLayoutViews];
    }
    return self;
}


#pragma mark ================Methods - 方法=================

#pragma mark ================Private - 私有=================
-(void)clSetupViews
{
    [self addSubview:self.listView];
}

-(void)clLayoutViews
{
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
-(void)clLoadDataWithModel:(id)model
{
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:[(NSMutableArray *)model copy]];
    [self.listView reloadData];
    CLLogObj(self.dataArray);
}
#pragma mark ================Delegate - 代理=================

//TODO: ----------行数----------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


//TODO: ----------cell方法----------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"CellIdentify";
    
    MeSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[MeSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell clLoadDataWithModel:[self.dataArray copy]];
    
    return cell;
}

//TODO: ----------点击方法----------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(UIView *)createTableViewHeader
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CLScreenWidth, 350)];
    MeHeaderView *headerView = [MeHeaderView new];
    [view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
    [headerView setAdverDataWithArray:@[
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576744105022&di=f4aadd0b85f93309a4629c998773ae83&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1206%2F07%2Fc0%2F11909864_1339034191111.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576744105022&di=f06819b43c8032d203642874d1893f3d&imgtype=0&src=http%3A%2F%2Fi2.sinaimg.cn%2Fent%2Fs%2Fm%2Fp%2F2009-06-25%2FU1326P28T3D2580888F326DT20090625072056.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577338893&di=189401ebacb9704d18f6ab02b7336923&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201308%2F05%2F20130805105309_5E2zE.jpeg",
        @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3425860897,3737508983&fm=26&gp=0.jpg"
        ]];


    
    return view;
}
#pragma mark ================Object - 对象=================

- (UITableView *)listView
{
    if (!_listView) {
        _listView = [UITableView clKitCreateTableViewWithFrame:CGRectZero style:UITableViewStyleGrouped cellSeparatorStyle:UITableViewCellSeparatorStyleNone dataSource:self delegate:self];
        _listView.tableHeaderView = [self createTableViewHeader];
        _listView.backgroundColor = UIColor.whiteColor;
//        _listView.estimatedRowHeight = 44;
        _listView.rowHeight = UITableViewAutomaticDimension;
    }
    return _listView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

@end
