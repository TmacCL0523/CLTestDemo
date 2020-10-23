//
//  AdverCell.m
//  CLTestDemo
//
//  Created by QiYue on 2020/10/21.
//

#import "AdverCell.h"

@implementation AdverCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    _icon = [UIImageView new];
    [self.contentView addSubview:_icon];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _icon.frame = CGRectMake(15, 0, self.clKitWidth - 30, self.clKitHeight - 10);
}

@end
