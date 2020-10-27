/***

    当前的文件名
    MeHeaderView.m

    不带后缀的文件名
    MeHeaderView

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

#import "MeHeaderView.h"
#import "AdverCell.h"

@implementation MeFansButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.title];
        [self addSubview:self.deatil];

        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.centerX.equalTo(self);
            make.bottom.equalTo(self.deatil.mas_top).offset(-2);
        }];

        [self.deatil mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom);
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(self.title);
        }];
    }
    return self;
}

- (UILabel *)title
{
    if (!_title) {
        _title = [UILabel clKitCreateWithFrame:CGRectZero text:nil font:CLFont(13) color:CLRGBAColor(175, 177, 188, 1) alignment:NSTextAlignmentCenter lines:1];
        [_title sizeToFit];
    }
    return _title;
}

- (UILabel *)deatil
{
    if (!_deatil) {
        _deatil = [UILabel clKitCreateWithFrame:CGRectZero text:nil font:CLFont(10) color:CLRGBAColor(17, 17, 45, 1) alignment:NSTextAlignmentCenter lines:1];
    }
    return _deatil;
}

@end

@interface MeHeaderView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) UIImageView *iconImage;

@property (nonatomic, strong) UILabel *nameLab;

@property (nonatomic, strong) UILabel *identifyLab;

@property (nonatomic, strong) UIButton *payBtn;

@property (nonatomic, strong) MeFansButton *focusView;

@property (nonatomic, strong) MeFansButton *fansView;

@property (nonatomic, strong) MeFansButton *currencyView;

@property (nonatomic, strong) MeFansButton *starView;

@property (nonatomic , strong) SDCycleScrollView *adverView;

@property (nonatomic , strong) NSMutableArray *adverArray;

@end

@implementation MeHeaderView

#pragma mark ================Initialize-初始化=================
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)clSetupViews
{
    [self clKitAddSubViews:@[
         self.iconImage,
         self.nameLab,
         self.identifyLab,
         self.payBtn,
         self.focusView,
         self.fansView,
         self.currencyView,
         self.starView,
         self.adverView
    ]];
}

- (void)clLayoutViews
{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(80);
        make.left.equalTo(self).offset(15);
        make.width.equalTo(self).multipliedBy(0.15);
        make.height.equalTo(self.iconImage.mas_width);
    }];

    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImage.mas_right).offset(10);
        make.bottom.equalTo(self.iconImage.mas_centerY).offset(-2);
        make.right.equalTo(self.payBtn.mas_left).offset(-15);
        make.top.equalTo(self.iconImage).offset(5);
    }];

    [self.identifyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nameLab);
        make.top.equalTo(self.iconImage.mas_centerY).offset(2);
        make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
    }];

    [self.payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImage);
        make.right.equalTo(self.mas_right).offset(4);
        make.width.equalTo(@61);
        make.height.equalTo(@38);
    }];

    [self.focusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.iconImage.mas_bottom).offset(20);
        make.height.equalTo(@32);
        make.right.equalTo(self.fansView.mas_left);
    }];

    [self.fansView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.focusView.mas_right).offset(0);
        make.top.height.equalTo(self.focusView);
        make.right.equalTo(self.currencyView.mas_left);
    }];

    [self.currencyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fansView.mas_right).offset(0);
        make.top.height.equalTo(self.focusView);
        make.right.equalTo(self.starView.mas_left);
    }];

    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.left.equalTo(self.currencyView.mas_right);
        make.top.equalTo(self.currencyView);
        make.height.equalTo(self.currencyView);
        make.width.equalTo(@[self.focusView, self.fansView, self.currencyView]);
    }];
    
    [self.adverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.focusView.mas_bottom).offset(20);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(-0);
        make.height.equalTo(@100);
    }];
}

#pragma mark ================Delegate - 代理=================
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    
}
/*
-(Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view
{
    if (view != self.adverView) {
        return nil;
    }
    return [AdverCell class];
}
- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view
{
    AdverCell *myCell = (AdverCell *)cell;
    [myCell.icon sd_setImageWithURL:[NSURL URLWithString:self.adverArray[index]] placeholderImage:CLGetImage(@"占位图")];
}
*/
#pragma mark ================Methods - 方法=================
- (CGFloat)getHeaderViewHeight
{
    CLLogFrame(self.starView);
    CGFloat height = self.adverView.clKitY + self.adverView.clKitHeight + 10;
    return height;
}

-(void)setAdverDataWithArray:(NSArray *)data
{
    [self.adverArray removeAllObjects];
    [self.adverArray addObjectsFromArray:data];
    self.adverView.imageURLStringsGroup = self.adverArray;
}

#pragma mark ================Private - 私有=================

#pragma mark ================Object - 对象=================
- (UIImageView *)iconImage
{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        CLWEAKSELF;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 耗时的操作
            UIImage *image = [CLGetImage(@"启动动画") clKitRoundImagewithImage];

            dispatch_async(dispatch_get_main_queue(), ^{
                // 更新界面
                weakSelf.iconImage.image = image;
            });
        });
    }
    return _iconImage;
}

- (UILabel *)nameLab
{
    if (!_nameLab) {
        _nameLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"小镇姑娘" font:CLFont(16) color:CLRGBAColor(7, 22, 46, 1) alignment:NSTextAlignmentLeft lines:1];
    }
    return _nameLab;
}

- (UILabel *)identifyLab
{
    if (!_identifyLab) {
        _identifyLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"ID 12345678" font:CLFont(15) color:CLRGBAColor(161, 163, 176, 1) alignment:NSTextAlignmentLeft lines:1];
    }
    return _identifyLab;
}

- (UIButton *)payBtn
{
    if (!_payBtn) {
        _payBtn = [UIButton clKitButtonWithTitle:@"充值" backColor:UIColor.clearColor nonarlImage:CLGetImage(@"充值") selectImage:nil titleColor:CLRGBAColor(255, 255, 255, 1) font:CLFont(11) cornerRadius:0];
        [_payBtn setBackgroundImage:CLGetImage(@"充值背景") forState:UIControlStateNormal];
        [_payBtn clKit_SetImagePoint:ButtonImageLocationLeft andPadding:10];
    }
    return _payBtn;
}

- (MeFansButton *)focusView
{
    if (!_focusView) {
        _focusView = [MeFansButton new];
        _focusView.title.text = @"关注";
        _focusView.deatil.text = @"1.3K";
    }
    return _focusView;
}

- (MeFansButton *)fansView
{
    if (!_fansView) {
        _fansView = [MeFansButton new];
        _fansView.title.text = @"粉丝";
        _fansView.deatil.text = @"1.3K";
    }
    return _fansView;
}

- (MeFansButton *)currencyView
{
    if (!_currencyView) {
        _currencyView = [MeFansButton new];
        _currencyView.title.text = @"云币";
        _currencyView.deatil.text = @"1.3K";
    }
    return _currencyView;
}

- (MeFansButton *)starView
{
    if (!_starView) {
        _starView = [MeFansButton new];
        _starView.title.text = @"点赞";
        _starView.deatil.text = @"1.3K";
        [_starView.title pp_addBadgeWithText:@"99+"];
    }
    return _starView;
}

- (SDCycleScrollView *)adverView
{
    if (!_adverView) {
        _adverView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:CLGetImage(@"占位图")];
        _adverView.showPageControl = YES;
        _adverView.hidesForSinglePage = NO;
        _adverView.pageControlAliment = SDCycleScrollViewPageContolStyleAnimated;
        _adverView.pageControlStyle = SDCycleScrollViewPageContolAlimentCenter;
        _adverView.pageDotColor = UIColor.lightGrayColor;
        _adverView.currentPageDotColor = UIColor.blackColor;
        _adverView.imageURLStringsGroup = self.adverArray;
    }
    return _adverView;
}

- (NSMutableArray *)adverArray
{
    if (!_adverArray) {
        _adverArray = [NSMutableArray new];
    }
    return _adverArray;
}

@end
