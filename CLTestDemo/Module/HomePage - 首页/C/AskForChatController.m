/***

    当前的文件名
    AskForChatController.m

    不带后缀的文件名
    AskForChatController

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

#import "AskForChatController.h"

@interface AskForChatController ()

/// 底层
@property (nonatomic, strong) UIView *bgView;

/// 标题
@property (nonatomic, strong) UILabel *titleLab;

/// 视频图片
@property (nonatomic, strong) UIImageView *videoImage;

/// 语音图片
@property (nonatomic, strong) UIImageView *voiceImage;

/// 视频标题
@property (nonatomic, strong) UILabel *videoLab;

/// 语音标题
@property (nonatomic, strong) UILabel *voiceLab;

/// 价格
@property (nonatomic, strong) UILabel *priceLab;

/// 精选BTN
@property (nonatomic, strong) UIButton *featuredBtn;

/// 匹配BTN
@property (nonatomic, strong) UIImageView *beginBtn;
@end

@implementation AskForChatController

#pragma mark ================Initialize-初始化=================

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    CLWEAKSELF;
    [self.voiceImage clKitAddTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {
        CLLogString(@"语音聊天");
    }];
    
    [self.videoImage clKitAddTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {
        CLLogString(@"视频聊天");
    }];
    
    [self.featuredBtn clKitAddActionHandler:^{
        weakSelf.featuredBtn.selected = !weakSelf.featuredBtn.selected;
    }];
    
    [self.beginBtn clKitAddTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {
        CLLogString(@"开始匹配");
    }];
}

#pragma mark ================Methods - 方法=================

#pragma mark ================Delegate - 代理=================

#pragma mark ================Private - 私有=================
- (void)clSetupViews
{
    [self.view addSubview:self.bgView];
    [self.bgView clKitAddSubViews:@[
         self.titleLab,
         self.voiceImage,
         self.videoImage,
         self.voiceLab,
         self.videoLab,
         self.priceLab,
         self.featuredBtn,
         self.beginBtn
    ]];
    

}

- (void)clLayoutViews
{
    self.bgView.
    sd_layout.
    topSpaceToView(self.view, 30).
    leftSpaceToView(self.view, 30).
    rightSpaceToView(self.view, 30).
    bottomSpaceToView(self.view, 30);

    self.titleLab.
    sd_layout.
    topSpaceToView(self.bgView, 40).
    leftEqualToView(self.bgView).
    rightEqualToView(self.bgView).
    heightIs(15);
    
    self.voiceImage.
    sd_layout.
    topSpaceToView(self.titleLab, 40).
    leftSpaceToView(self.bgView, 57).
    widthIs(60).
    heightIs(60);
    
    self.videoImage.
    sd_layout.
    topSpaceToView(self.titleLab, 40).
    rightSpaceToView(self.bgView, 57).
    widthIs(60).
    heightIs(60);
    
    self.voiceLab.
    sd_layout.
    topSpaceToView(self.voiceImage, 12).
    leftEqualToView(self.voiceImage).
    rightEqualToView(self.voiceImage).
    heightIs(15);
    
    self.videoLab.
    sd_layout.
    topSpaceToView(self.videoImage, 12).
    leftEqualToView(self.videoImage).
    rightEqualToView(self.videoImage).
    heightIs(15);
    
    self.priceLab.
    sd_layout.
    centerYEqualToView(self.bgView).
    leftSpaceToView(self.bgView, 38).
    rightSpaceToView(self.bgView, 38).
    heightIs(40);
    
    self.featuredBtn.
    sd_layout.
    topSpaceToView(self.priceLab, 20).
    leftEqualToView(self.priceLab).
    rightEqualToView(self.priceLab).
    heightIs(20);
    
    self.beginBtn.
    sd_layout.
    bottomSpaceToView(self.bgView, 23).
    centerXEqualToView(self.bgView).
    widthIs(90).
    heightIs(90);
}



#pragma mark ================Object - 对象=================

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = CLRGBAColor(237, 224, 254, 1);
        _bgView.clKitCornerRadius = 20;
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"求聊类型" font:CLFont(14) color:CLRGBAColor(50, 50, 50, 1) alignment:NSTextAlignmentCenter lines:1];
    }
    return _titleLab;
}

- (UIImageView *)videoImage
{
    if (!_videoImage) {
        _videoImage = [UIImageView new];
        _videoImage.image = CLGetImage(@"AskChatVoide");
    }
    return _videoImage;
}

- (UIImageView *)voiceImage
{
    if (!_voiceImage) {
        _voiceImage = [UIImageView new];
        _voiceImage.image = CLGetImage(@"AskChatVoice");
    }
    return _voiceImage;
}

- (UILabel *)videoLab
{
    if (!_videoLab) {
        _videoLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"视频聊天" font:CLFont(13) color:CLRGBAColor(50, 50, 50, 1) alignment:NSTextAlignmentCenter lines:1];
    }
    return _videoLab;
}

- (UILabel *)voiceLab
{
    if (!_voiceLab) {
        _voiceLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"语音聊天" font:CLFont(13) color:CLRGBAColor(50, 50, 50, 1) alignment:NSTextAlignmentCenter lines:1];
    }
    return _voiceLab;
}

- (UILabel *)priceLab
{
    if (!_priceLab) {
        _priceLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"20悦豆/分钟" font:CLFont(13) color:CLRGBAColor(114, 0, 255, 1) alignment:NSTextAlignmentCenter lines:1];
        [_priceLab clKitSetBordersWithColor:CLRGBAColor(114, 255, 255, 1) andCornerRadius:20 andWidth:1];
        _priceLab.backgroundColor = UIColor.whiteColor;
    }
    return _priceLab;
}

- (UIButton *)featuredBtn
{
    if (!_featuredBtn) {
//        _featuredBtn = [UIButton clKitButtonWithTitle:@"精选高颜值" backColor:UIColor.clearColor nonarlImage:CLGetImage(@"AskChatUnSelectBtn") selectImage:CLGetImage(@"AskChatSelectBtn") titleColor:UIColor.blackColor font:CLFont(14) cornerRadius:0];
        
        _featuredBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_featuredBtn setTitle:@"精选高颜值" forState:UIControlStateNormal];
        [_featuredBtn setImage:CLGetImage(@"AskChatUnSelectBtn") forState:UIControlStateNormal];
        [_featuredBtn setImage:CLGetImage(@"AskChatSelectBtn") forState:UIControlStateSelected];
        [_featuredBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_featuredBtn.titleLabel setFont:CLFont(14)];
        [_featuredBtn sizeToFit];
        _featuredBtn.selected = YES;
        [_featuredBtn clKit_SetImagePoint:ButtonImageLocationLeft andPadding:15];
    }
    return _featuredBtn;
}

- (UIImageView *)beginBtn
{
    if (!_beginBtn) {
        _beginBtn = [UIImageView new];
        _beginBtn.userInteractionEnabled = YES;
        _beginBtn.image = CLGetImage(@"AskChatBeginChat");
    }
    return _beginBtn;
}

@end
