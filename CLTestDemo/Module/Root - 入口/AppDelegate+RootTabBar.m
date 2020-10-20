//
//  AppDelegate+RootTabBar.m
//  CLTestDemo
//
//  Created by QiYue on 2020/10/20.
//

#import "AppDelegate+RootTabBar.h"
#import "HomePageViewController.h"
#import "DynamicViewController.h"
#import "MatchingViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"
#import "CYLTabBarController.h"



@interface AppDelegate ()<CYLTabBarControllerDelegate, UITabBarControllerDelegate>

@end

@implementation AppDelegate (RootTabBar)

-(void)rootViewController
{
    // 设置主窗口，并设置根视图控制器
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    // 初始化 CYLTabBarController 对象
    CYLTabBarController *tabBarController =
        [CYLTabBarController tabBarControllerWithViewControllers:[self getViewControllers]
                                           tabBarItemsAttributes:[self getTabBarItems]];
    // 设置遵守委托协议
    tabBarController.delegate = self;
    
    
    // 将 CYLTabBarController 设置为 window 的 RootViewController
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    [self customizeTabBarInterface];

}

-(NSArray *)getViewControllers
{
    HomePageViewController *homeVc = [HomePageViewController new];
//    CYLBaseNavigationController *homeNC = [[CYLBaseNavigationController alloc] initWithRootViewController:homeVc];
    
    DynamicViewController *friendVc = [DynamicViewController new];
//    CYLBaseNavigationController *friendNC = [[CYLBaseNavigationController alloc] initWithRootViewController:friendVc];
    
    MatchingViewController *msgVc = [MatchingViewController new];
//    CYLBaseNavigationController *msgNC = [[CYLBaseNavigationController alloc] initWithRootViewController:msgVc];
    
    MessageViewController *settingVc = [MessageViewController new];
//    CYLBaseNavigationController *settingNC = [[CYLBaseNavigationController alloc] initWithRootViewController:settingVc];
    
    MeViewController *meVc = [MeViewController new];
//    CYLBaseNavigationController *meNav = [[CYLBaseNavigationController alloc] initWithRootViewController:meVc];
    
//    homeVc.cyl_navigationBarHidden = YES;
//    friendVc.cyl_navigationBarHidden = YES;
//    msgVc.cyl_navigationBarHidden = YES;
//    settingVc.cyl_navigationBarHidden = YES;
//    meVc.cyl_navigationBarHidden = NO;

    NSArray *viewControllersArray = @[homeVc, friendVc, msgVc, settingVc,meVc];

    return viewControllersArray;
}

-(NSArray *)getTabBarItems
{
    NSDictionary *homeTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"首页",
        CYLTabBarItemImage: @"home_gray",
        CYLTabBarItemSelectedImage: @"home_sel",
    };
    NSDictionary *myCityTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"动态",
        CYLTabBarItemImage: @"find_nor",
        CYLTabBarItemSelectedImage: @"find_sel",
    };
    NSDictionary *pipeiTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"匹配",
        CYLTabBarItemImage: @"center_heart",
        CYLTabBarItemSelectedImage: @"tabbarCenter",
    };
    
    NSDictionary *messageTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"消息",
        CYLTabBarItemImage: @"msg_nor",
        CYLTabBarItemSelectedImage: @"msg_sel",
    };
    NSDictionary *accountTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"我的",
        CYLTabBarItemImage: @"mine_nor",
        CYLTabBarItemSelectedImage: @"mine_sel",
    };
    
    

    NSArray *tabBarItemsAttributes = @[
        homeTabBarItemsAttributes,
        myCityTabBarItemsAttributes,
        pipeiTabBarItemsAttributes,
        messageTabBarItemsAttributes,
        accountTabBarItemsAttributes
    ];
    return tabBarItemsAttributes;
}

/// 自定义 TabBar 字体、背景、阴影
- (void)customizeTabBarInterface
{
    // 设置文字属性
    if (@available(iOS 10.0, *)) {
        [self cyl_tabBarController].tabBar.unselectedItemTintColor = [UIColor lightGrayColor];
        [self cyl_tabBarController].tabBar.tintColor = [UIColor blackColor];
    } else {
        UITabBarItem *tabBar = [UITabBarItem appearance];
        // 普通状态下的文字属性
        [tabBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}
                              forState:UIControlStateNormal];
        // 选中状态下的文字属性
        [tabBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}
                              forState:UIControlStateSelected];
    }

    // 设置 TabBar 背景颜色：白色
    // 💡[UIImage imageWithColor] 表示根据指定颜色生成图片，该方法来自 <YYKit> 框架
    [[UITabBar appearance] setBackgroundImage:[UIImage clKitImageCreateWithColor:[UIColor whiteColor]]];
    
    // 去除 TabBar 自带的顶部阴影
    [[self cyl_tabBarController] hideTabBarShadowImageView];
    
    // 设置 TabBar 阴影，无效
    // [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tabBar_background_shadow"]];
    
    // 设置 TabBar 阴影
    CYLTabBarController *tabBarController = [self cyl_tabBarController];
    tabBarController.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
    tabBarController.tabBar.layer.shadowRadius = 15.0;
    tabBarController.tabBar.layer.shadowOpacity = 0.2;
    tabBarController.tabBar.layer.shadowOffset = CGSizeMake(0, 3);
    tabBarController.tabBar.layer.masksToBounds = NO;
    tabBarController.tabBar.clipsToBounds = NO;
}

#pragma mark  -  ===================delegate===================
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    // 确保 PlusButton 的选中状态
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control
{
    UIView *animationView;
    // 即使 PlusButton 也添加了点击事件，点击 PlusButton 后也会触发该代理方法。
    if ([control cyl_isPlusButton]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
        // 为加号按钮添加「缩放动画」
        [self addScaleAnimationOnView:animationView repeatCount:1];
    } else if ([control isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        for (UIView *subView in control.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                animationView = subView;
                // 为其他按钮添加「旋转动画」
                [self addRotateAnimationOnView:animationView];
            }
        }
    }
}

/// 缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount
{
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
     animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 0.5;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

/// 旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView
{
   [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
       animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
   } completion:nil];
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
           animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
       } completion:nil];
   });
}
@end
