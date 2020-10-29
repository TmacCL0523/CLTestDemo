/***

    当前的文件名
    ChooseChatView.m

    不带后缀的文件名
    ChooseChatView

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

#import "ChooseChatView.h"

#pragma mark ===================在线===================
//TODO: ----------在线人数----------
@interface ChooseItemView ()

@property (nonatomic, strong) UIImageView *bgImage;

@property (nonatomic, strong) UIButton *reportBtn;

@property (nonatomic, strong) UIButton *followBtn;

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UIButton *privateLetterBtn;

@property (nonatomic, strong) UIButton *startVideoBtn;

@end
@implementation ChooseItemView
//TODO: ----------在线人数 - 初始化----------
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sd_addSubviews:@[self.bgImage, self.privateLetterBtn, self.startVideoBtn]];
        [self.bgImage sd_addSubviews:@[self.reportBtn, self.followBtn, self.priceLab]];

        self.bgImage.sd_layout
        .topEqualToView(self)
        .leftEqualToView(self)
        .rightEqualToView(self)
        .bottomSpaceToView(self.reportBtn, 6);

        self.privateLetterBtn.sd_layout
        .bottomSpaceToView(self, 6)
        .leftSpaceToView(self, 5)
        .rightSpaceToView(self.startVideoBtn, 6)
        .topSpaceToView(self.bgImage, 6);

        self.startVideoBtn.sd_layout
        .bottomEqualToView(self.privateLetterBtn)
        .leftSpaceToView(self.privateLetterBtn, 5)
        .rightSpaceToView(self, 6)
        .widthRatioToView(self.privateLetterBtn, 1)
        .topSpaceToView(self.bgImage, 6);

        self.reportBtn.sd_layout
        .topSpaceToView(self.bgImage, 5)
        .leftSpaceToView(self.bgImage, 2)
        .widthIs(17)
        .heightIs(17);

        self.followBtn.sd_layout
        .topEqualToView(self.reportBtn)
        .rightSpaceToView(self.bgImage, 5)
        .widthIs(40)
        .heightIs(17);

        self.priceLab.sd_layout
        .bottomEqualToView(self.bgImage)
        .leftEqualToView(self.bgImage)
        .rightEqualToView(self.bgImage)
        .heightIs(20);
    }
    return self;
}

//TODO: ----------成员变量----------
- (UIImageView *)bgImage
{
    if (!_bgImage) {
        _bgImage = [UIImageView new];
    }
    return _bgImage;
}

- (UIButton *)reportBtn
{
    if (!_reportBtn) {
        _reportBtn = [UIButton new];
    }
    return _reportBtn;
}

- (UIButton *)followBtn
{
    if (!_followBtn) {
        _followBtn = [UIButton new];
    }
    return _followBtn;
}

- (UILabel *)priceLab
{
    if (!_priceLab) {
        _priceLab = [UILabel new];
    }
    return _priceLab;
}

- (UIButton *)privateLetterBtn
{
    if (!_privateLetterBtn) {
        _privateLetterBtn = [UIButton new];
    }
    return _privateLetterBtn;
}

- (UIButton *)startVideoBtn
{
    if (!_startVideoBtn) {
        _startVideoBtn = [UIButton new];
    }
    return _startVideoBtn;
}

@end

#pragma mark ===================选聊===================
//TODO: ----------选聊View----------
@interface ChooseChatView ()

@property (nonatomic, strong) UIImageView *captureVideoImage;

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *deatilLab;

@property (nonatomic, strong) UIImageView *videoImage;

@property (nonatomic, strong) UILabel *onlineLab;

@property (nonatomic, strong) UIButton *changeBatchBtn;

@property (nonatomic, strong) UILabel *tipLab;

@end

@implementation ChooseChatView

#pragma mark ================Initialize-初始化=================
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        [self addSubview:self.captureVideoImage];
        [self clKitAddSubViews:@[
             self.captureVideoImage,
             self.titleLab,
             self.deatilLab,
             self.videoImage,
             self.onlineLab,
             self.changeBatchBtn,
             self.tipLab
        ]];


        
        

        self.captureVideoImage.sd_layout
        .topSpaceToView(self, 15)
        .leftSpaceToView(self, 15)
        .widthRatioToView(self, 0.3)
        .heightRatioToView(self, 0.2);

        self.titleLab.sd_layout
        .topSpaceToView(self, 65)
        .leftSpaceToView(self.captureVideoImage, 20)
        .widthRatioToView(self.captureVideoImage, 1)
        .heightIs(20);

        self.deatilLab.sd_layout
        .topSpaceToView(self.titleLab, 10)
        .leftEqualToView(self.titleLab)
        .widthRatioToView(self.titleLab, 1)
        .autoHeightRatio(0);

        self.videoImage.sd_layout
        .topSpaceToView(self.captureVideoImage, 13)
        .leftEqualToView(self.captureVideoImage)
        .widthIs(18)
        .heightIs(12);

        self.onlineLab.sd_layout
        .topEqualToView(self.videoImage)
        .leftSpaceToView(self.videoImage, 2)
        .rightSpaceToView(self, 15)
        .heightRatioToView(self.videoImage, 1);
        self.changeBatchBtn.sd_layout
        .bottomSpaceToView(self.tipLab, 18)
        .widthRatioToView(self, 0.3)
        .heightIs(43)
        .centerXEqualToView(self);

        self.tipLab.sd_layout
        .bottomSpaceToView(self, 46)
        .leftEqualToView(self)
        .rightEqualToView(self)
        .heightIs(12);
         
    }
    return self;
}

#pragma mark ================Delegate - 代理=================

#pragma mark ================Methods - 方法=================

#pragma mark ================Private - 私有=================

#pragma mark ================Object - 对象=================
- (UIImageView *)captureVideoImage
{
    if (!_captureVideoImage) {
        _captureVideoImage = [UIImageView new];
        _captureVideoImage.image = CLGetImage(@"ChooseBackImage");
    }
    return _captureVideoImage;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"视频选聊" font:CLFont(15) color:CLRGBAColor(50, 50, 50, 1) alignment:NSTextAlignmentLeft lines:1];
    }
    return _titleLab;
}

- (UILabel *)deatilLab
{
    if (!_deatilLab) {
        _deatilLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"随时随地想连就 连..." font:CLFont(12) color:CLRGBAColor(50, 50, 50, 1) alignment:NSTextAlignmentLeft lines:2];
    }
    return _deatilLab;
}

- (UIImageView *)videoImage
{
    if (!_videoImage) {
        _videoImage = [UIImageView new];
        _videoImage.image = CLGetImage(@"ChooseVideo");
    }
    return _videoImage;
}

- (UILabel *)onlineLab
{
    if (!_onlineLab) {
        _onlineLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"选聊视频在线 ( 603人）" font:CLFont(14) color:CLRGBAColor(50, 50, 50, 1) alignment:NSTextAlignmentLeft lines:1];
    }
    return _onlineLab;
}

- (UIButton *)changeBatchBtn
{
    if (!_changeBatchBtn) {
        _changeBatchBtn = [UIButton clKitButtonWithTitle:@"换一批" backColor:UIColor.whiteColor titleColor:CLRGBAColor(162, 0, 255, 1) font:CLFont(18) cornerRadius:20];
        [_changeBatchBtn clKitSetBordersWithColor:CLRGBAColor(162, 0, 255, 1) andCornerRadius:20 andWidth:1];
    }
    return _changeBatchBtn;
}

- (UILabel *)tipLab
{
    if (!_tipLab) {
        _tipLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"视频中如有裸露、涉黄、涉政或其他违法行为，请举报，谢谢" font:CLFont(11) color:CLRGBAColor(153, 153, 153, 1) alignment:NSTextAlignmentCenter lines:1];
    }
    return _tipLab;
}

@end
