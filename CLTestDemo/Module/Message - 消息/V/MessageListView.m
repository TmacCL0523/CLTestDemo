/***

    当前的文件名
    MessageListView.m

    不带后缀的文件名
    MessageListView

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

#import "MessageListView.h"
#import "MessageListCell.h"

@interface MessageListView ()
@property (nonatomic , strong) CLTableView *tableView;
@end

@implementation MessageListView


#pragma mark ================Initialize-初始化=================
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createTableViewDelegate];
    }
    return self;
}
-(void)clSetupViews
{
    [self addSubview:self.tableView];
    self.tableView.sd_layout.
    topEqualToView(self).
    leftEqualToView(self).
    rightEqualToView(self).
    bottomEqualToView(self);
}

#pragma mark ================Delegate - 代理=================

#pragma mark ================Methods - 方法=================

#pragma mark ================Private - 私有=================
-(void)createTableViewDelegate
{
    _tableView.cellForRowAtIndexPathBlock = ^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        
        
        static NSString *identify = @"cell";
        MessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (cell == nil) {
            cell = [[MessageListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        
        return cell;
    };
    
    _tableView.numberOfRowsInSectionBlock = ^NSInteger(UITableView *tableView, NSInteger section) {
        return 10;
    };
    
    _tableView.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView *tableView) {
        return 1;
    };
    
    _tableView.didSelectRowAtIndexPathBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        
    };
    
    
    
}
#pragma mark ================Object - 对象=================
- (CLTableView *)tableView
{
    if (!_tableView) {
        _tableView = [CLTableView new];
    }
    return _tableView;
}
@end
