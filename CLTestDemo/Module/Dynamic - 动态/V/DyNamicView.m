//
//  DyNamicView.m
//  CLTestDemo
//
//  Created by QiYue on 2020/10/22.
//

#import "DyNamicView.h"

@interface DyNamicView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation DyNamicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)clSetupViews
{
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
//TODO: ----------行数----------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

//TODO: ----------点击方法----------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark ================Object - 对象=================

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView clKitCreateTableViewWithFrame:CGRectZero style:UITableViewStyleGrouped cellSeparatorStyle:UITableViewCellSeparatorStyleNone dataSource:self delegate:self];
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CLScreenWidth, 120)];
        head.backgroundColor = CLRandomColor;
        _tableView.tableHeaderView = head;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

@end
