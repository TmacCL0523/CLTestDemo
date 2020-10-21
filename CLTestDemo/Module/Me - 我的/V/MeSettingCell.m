//
//  MeSettingCell.m
//  CLTestDemo
//
//  Created by QiYue on 2020/10/21.
//

#import "MeSettingCell.h"

@interface MeSettingCell ()

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
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
    [self.bgView layoutIfNeeded];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    // 先对bgview进行布局,这里需对bgView布局后collectionView宽度才会准确
    self.bgView.frame = CGRectMake(0, 0, targetSize.width, 44);
    [self.bgView layoutIfNeeded];
    
    // 在对collectionView进行布局
    self.collectionView.frame = CGRectMake(0, 0, targetSize.width, 44);
    [self.collectionView layoutIfNeeded];
    
    // 由于这里collection的高度是动态的，这里cell的高度我们根据collection来计算
    CGSize collectionSize = self.collectionView.collectionViewLayout.collectionViewContentSize;
    CGFloat cotentViewH = collectionSize.height;
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, cotentViewH + 30);
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
