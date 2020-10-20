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

#pragma mark ================Delegate - 代理=================

//TODO: ----------行数----------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
//TODO: ----------行高----------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

//TODO: ----------cell方法----------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"CellIdentify";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    [cell configDataWithModel:self.dataArray[indexPath.row]];
    
    return cell;
}

//TODO: ----------点击方法----------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark ================Object - 对象=================

- (UITableView *)listView
{
    if (!_listView) {
        _listView = [UITableView clKitCreateTableViewWithFrame:CGRectZero style:UITableViewStyleGrouped cellSeparatorStyle:UITableViewCellSeparatorStyleNone dataSource:self delegate:self];
        _listView.tableHeaderView = [UIView new];
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
