/***

    当前的文件名
    MessageListCell.m

    不带后缀的文件名
    MessageListCell

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

#import "MessageListCell.h"

@interface MessageListCell ()

@property (nonatomic, strong) UIImageView *iconImage;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *msgDeatilLab;

@property (nonatomic, strong) UILabel *dateLab;

@property (nonatomic, strong) UILabel *numberLab;

@property (nonatomic, strong) UIImageView *ignoreImage;
@end

@implementation MessageListCell

#pragma mark ================Initialize-初始化=================
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createViews];
        [self createLayoutViews];
    }

    return self;
}

- (void)createViews
{
    [self.contentView clKitAddSubViews:@[
         self.iconImage,
         self.nameLabel,
         self.msgDeatilLab,
         self.dateLab,
         self.numberLab,
         self.ignoreImage]];
}

- (void)createLayoutViews
{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.width.height.equalTo(@60);
        make.bottom.equalTo(self.contentView).offset(-15);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImage);
        make.left.equalTo(self.iconImage.mas_right).offset(15);
        make.right.equalTo(self.dateLab.mas_left).offset(-15);
//        make.width.greaterThanOrEqualTo
        make.bottom.equalTo(self.iconImage.mas_centerY);
    }];
    
    
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImage);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.width.mas_equalTo(60);
        make.height.equalTo(self.nameLabel);
    }];
    
    [self.msgDeatilLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImage.mas_centerY);
        make.left.right.equalTo(self.nameLabel);
        make.bottom.equalTo(self.iconImage.mas_bottom);
    }];
    
    
}

#pragma mark ================Methods - 方法=================
-(void)clLoadDataWithModel:(id)model
{
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerX.equalTo(self.dateLab);
        make.top.equalTo(self.msgDeatilLab);
    }];
    
    [self.ignoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.msgDeatilLab);
        make.width.height.mas_equalTo(25);
        make.right.equalTo(self.dateLab);
    }];
}
#pragma mark ================Delegate - 代理=================

#pragma mark ================Private - 私有=================

#pragma mark ================Object - 对象=================
- (UIImageView *)iconImage
{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.image = CLGetImage(@"启动动画");
    }
    return _iconImage;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel clKitCreateWithFrame:CGRectZero text:@"名称" font:CLFont(14) color:UIColor.blackColor alignment:NSTextAlignmentLeft lines:1];
    }
    return _nameLabel;
}
- (UILabel *)msgDeatilLab
{
    if (!_msgDeatilLab) {
        _msgDeatilLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"这是一条消息，你看到就好了。" font:CLFont(12) color:UIColor.lightGrayColor alignment:NSTextAlignmentLeft lines:1];
    }
    return _msgDeatilLab;
}
- (UILabel *)dateLab
{
    if (!_dateLab) {
        _dateLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"18:37" font:CLFont(12) color:UIColor.lightGrayColor alignment:NSTextAlignmentRight lines:1];
    }
    return _dateLab;
}
- (UILabel *)numberLab
{
    if (!_numberLab) {
        _numberLab = [UILabel clKitCreateWithFrame:CGRectZero text:@"1" font:CLFont(12) color:UIColor.whiteColor alignment:NSTextAlignmentCenter lines:1];
    }
    return _numberLab;
}
- (UIImageView *)ignoreImage
{
    if (!_ignoreImage) {
        _ignoreImage = [UIImageView new];
        _ignoreImage.image = CLGetImage(@"免打扰");
    }
    return _ignoreImage;
}


@end
