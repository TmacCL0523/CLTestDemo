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

@interface MeHeaderView ()

@property (nonatomic , strong) UIImageView *iconImage;

@property (nonatomic , strong) UILabel *nameLab;

@property (nonatomic , strong) UILabel *identifyLab;

@property (nonatomic , strong) UIButton *payBtn;

@property (nonatomic , strong) UIView *fansView;

@end

@implementation MeHeaderView

#pragma mark ================Object - 对象=================

#pragma mark ================Initialize-初始化=================
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

#pragma mark ================Delegate - 代理=================

#pragma mark ================Methods - 方法=================

#pragma mark ================Private - 私有=================

@end
