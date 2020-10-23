//
//  MeSettingCell.m
//  CLTestDemo
//
//  Created by QiYue on 2020/10/21.
//

#import "MeSettingCell.h"
#import "SettingItemCell.h"

@interface MeSettingCell ()<CLCollectionLayoutDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MeSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}
-(void)clSetupViews
{
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.collectionView];
}

-(void)clLayoutViews
{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
}
-(void)clLoadDataWithModel:(id)model
{
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:(NSArray *)model];
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
    [self.bgView layoutIfNeeded];
    CLLogObj([self.dataArray yy_modelToJSONString]);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    CLLogSize(targetSize);
    // 先对bgview进行布局,这里需对bgView布局后collectionView宽度才会准确
    self.bgView.frame = CGRectMake(0, 0, targetSize.width, 44);
    [self.bgView layoutIfNeeded];
    
    // 在对collectionView进行布局
    self.collectionView.frame = CGRectMake(0, 0, targetSize.width, 44);
    [self.collectionView layoutIfNeeded];
    
    // 由于这里collection的高度是动态的，这里cell的高度我们根据collection来计算
    CGSize collectionSize = self.collectionView.collectionViewLayout.collectionViewContentSize;
    CGFloat cotentViewH = collectionSize.height;
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, cotentViewH);
}


#pragma mark ===================delegate===================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SettingItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identify" forIndexPath:indexPath];
    SettingItemModel *model = (SettingItemModel *)self.dataArray[indexPath.row];
    CLLogObj([model yy_modelToJSONString]);
    [cell clLoadDataWithModel:model];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CLLogObj(indexPath);
}
/// 设置每个item的高度
/// @param collectionLayout 当前layout
/// @param indexPath 下标
/// @param itemWidth 宽度
- (CGFloat)collectionViewLayout:(CLCollectionLayout *)collectionLayout
       heightForItemAtIndexPath:(NSUInteger)indexPath
                       itemWith:(CGFloat)itemWidth
{
    CLLogFrame(self.collectionView);
    return itemWidth;
}

-(NSUInteger)numberOfItemWithColumnForCollectionLayout:(CLCollectionLayout *)layout
{
    return 5;
}


-(UIEdgeInsets)edgeInsetInCollectionLayout:(CLCollectionLayout *)layout
{
    return UIEdgeInsetsMake(10, 30, 10, 30);
}

#pragma mark ===================object===================
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = UIColor.whiteColor;
    }
    return _bgView;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CLCollectionLayout *layout = [CLCollectionLayout new];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[SettingItemCell class] forCellWithReuseIdentifier:@"identify"];
        _collectionView.backgroundColor = UIColor.whiteColor;
    }
    return _collectionView;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
