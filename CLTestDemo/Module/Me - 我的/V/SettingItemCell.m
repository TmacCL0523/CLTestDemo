//
//  SettingItemCell.m
//  CLTestDemo
//
//  Created by QiYue on 2020/10/22.
//

#import "SettingItemCell.h"

@implementation SettingItemModel

@end

@interface SettingItemCell ()
@property (nonatomic , strong) UIButton *button;
@end

@implementation SettingItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.button = [UIButton new];
        [self.button clKit_SetImagePoint:ButtonImageLocationTop andPadding:5];
        self.button.userInteractionEnabled = NO;
        
        [self.contentView addSubview:self.button];
        self.button.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));

//        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self.contentView);
//        }];
    }
    return self;
}

-(void)clLoadDataWithModel:(id)model
{
    SettingItemModel *dataModel  = (SettingItemModel *)model;
    [self.button setTitle:@"功能" forState:UIControlStateNormal];
    [self.button setImage:CLGetImage(dataModel.icon) forState:UIControlStateNormal];
    [self.button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    self.button.titleLabel.font = CLFont(12);
    
}

@end
