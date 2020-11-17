/**
 *********************************************************************************
 *
 * 用户名:     HongChangLong
 * 文件名:     MyAccompanyCell.m
 * 工程名:     CLTestDemo
 * 父类:       CLBaseTableViewCell
 * 创建时间:    2020/11/18
 *
 *********************************************************************************
 **/

#import "MyAccompanyCell.h"


@implementation MyAccompanyModel

@end


@interface MyAccompanyCell ()

@property (nonatomic , strong) UIImageView *bgImage;

@property (nonatomic , strong) UIImageView *headerImage;

@property (nonatomic , strong) UIButton *likeBtn;

@property (nonatomic , strong) UIButton *contentBtn;

@property (nonatomic , strong) UIButton *gifBtn;

@property (nonatomic , strong) UIButton *shareBtn;

@end

@implementation MyAccompanyCell

#pragma mark - LifeCycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置view
        [self setupViews];
    }
    
    return self;
}

#pragma mark - Private
-(void)setupViews
{
    [self.contentView clKitAddSubViews:@[
        self.bgImage,
        self.headerImage,
        self.likeBtn,
        self.contentBtn,
        self.gifBtn,
        self.shareBtn]];
    
    [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@40);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImage.mas_bottom).offset(5);
        make.width.equalTo(@40);
        make.width.equalTo(self.likeBtn).multipliedBy(1);
        make.right.equalTo(self.headerImage.mas_right);
    }];
    
    [self.contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.likeBtn.mas_bottom).offset(5);
        make.right.width.height.equalTo(self.likeBtn);
    }];
    
    [self.gifBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentBtn.mas_bottom).offset(5);
        make.right.width.height.equalTo(self.likeBtn);
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-80);
        make.width.equalTo(self.likeBtn);
        make.top.equalTo(self.gifBtn.mas_bottom).offset(5);
        make.right.equalTo(self.likeBtn);
        make.height.equalTo(@[self.likeBtn,self.contentBtn,self.gifBtn]);
    }];
}

-(void)loadDataWithRequest
{
    
}

#pragma mark - Methods 

#pragma mark - Event

#pragma mark - Delegate

#pragma mark - Public

#pragma mark - Setter/Getter
- (UIImageView *)bgImage
{
    if (!_bgImage) {
        _bgImage = [UIImageView new];
        _bgImage.image = [UIImage clKitImageCreateWithColor:CLRandomColor];
    }
    return _bgImage;
}

- (UIImageView *)headerImage
{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
    }
    return _headerImage;
}

- (UIButton *)likeBtn
{
    if (!_likeBtn) {
        _likeBtn = [UIButton clKitButtonWithTitle:@"收藏" backColor:UIColor.clearColor nonarlImage:CLGetImage(@"") selectImage:nil titleColor:UIColor.whiteColor font:CLFont(12) cornerRadius:0];
        [_likeBtn clKit_SetImagePoint:ButtonImageLocationTop andPadding:5];
    }
    return _likeBtn;
}

- (UIButton *)contentBtn
{
    if (!_contentBtn) {
        _contentBtn = [UIButton clKitButtonWithTitle:@"聊天" backColor:UIColor.clearColor nonarlImage:CLGetImage(@"") selectImage:nil titleColor:UIColor.whiteColor font:CLFont(12) cornerRadius:0];
        [_contentBtn clKit_SetImagePoint:ButtonImageLocationTop andPadding:5];
        
    }
    return _contentBtn;
}

- (UIButton *)gifBtn
{
    if (!_gifBtn) {
        _gifBtn = [UIButton clKitButtonWithTitle:@"礼物" backColor:UIColor.clearColor nonarlImage:CLGetImage(@"") selectImage:nil titleColor:UIColor.whiteColor font:CLFont(12) cornerRadius:0];
        [_gifBtn clKit_SetImagePoint:ButtonImageLocationTop andPadding:5];
        
    }
    return _gifBtn;
}

- (UIButton *)shareBtn
{
    if (!_shareBtn) {
        _shareBtn = [UIButton clKitButtonWithTitle:@"转发" backColor:UIColor.clearColor nonarlImage:CLGetImage(@"") selectImage:nil titleColor:UIColor.whiteColor font:CLFont(12) cornerRadius:0];
        [_shareBtn clKit_SetImagePoint:ButtonImageLocationTop andPadding:5];
        
    }
    return _shareBtn;
}


@end
