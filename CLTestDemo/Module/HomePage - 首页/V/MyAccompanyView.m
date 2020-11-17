/**
 *********************************************************************************
 *
 * 用户名:     HongChangLong
 * 文件名:     MyAccompanyView.m
 * 工程名:     MiYuApp
 * 父类:       CLBaseView
 * 创建时间:    2020/11/18
 *
 *********************************************************************************
 **/

#import "MyAccompanyView.h"
#import "MyAccompanyCell.h"



@interface MyAccompanyView ()

@property (nonatomic , strong) CLTableView *listView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation MyAccompanyView


#pragma mark - LifeCycle
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // UI
        [self setupViews];
        // view data
        [self loadDataWithRequest];
    }
    return self;
}

#pragma mark - Methods

#pragma mark - Delegate

#pragma mark - Private
//TODO: >UI<
- (void)setupViews
{
    [self addSubview:self.listView];
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

//TODO: >ViewData<
- (void)loadDataWithRequest
{
    CLWEAKSELF;
    self.listView.cellForRowAtIndexPathBlock = ^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        
        
        static NSString *identify = @"cell";
        MyAccompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (cell == nil) {
            cell = [[MyAccompanyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        }
//        [cell clLoadDataWithModel:<#(id)#>]
        return cell;
    };
    
    self.listView.numberOfRowsInSectionBlock = ^NSInteger(UITableView *tableView, NSInteger section) {
        return 10;
    };
    
    self.listView.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView *tableView) {
        return 1;
    };
    
    self.listView.didSelectRowAtIndexPathBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        
    };
    
    self.listView.heightForRowAtIndexPathBlock = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return weakSelf.frame.size.height;
    };
}


#pragma mark - Object
- (CLTableView *)listView
{
    if (!_listView) {
        _listView = [CLTableView new];
        _listView.rowHeight = UITableViewAutomaticDimension;
        _listView.pagingEnabled = YES;
    }
    return _listView;
}


- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        for (int i = 0; i < 10; i ++) {
            MyAccompanyModel *model = [MyAccompanyModel new];
            model.icon = i %2?@"":@"";
        }
    }
    return _dataArray;
}

@end
