//
//  AZNavigationController.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "AZNavigationController.h"
#import "UICustomBarBtnItem.h"
@interface AZNavigationController ()

@end

@implementation AZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // title 颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: kNaviTextClolor, NSFontAttributeName: [UIFont systemFontOfSize:18.0]};
    //  To tint the bar's background, please use -barTintColor.
    self.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green: 247.0/255.0 blue:247.0/255.0 alpha:1.0];
   // 设置返回按钮的颜色 只需要设置tintColor属性即可
    self.navigationBar.tintColor = kNaviTextClolor;
   // 设置导航栏底部线条颜色
    [self.navigationBar setShadowImage:[self imageWithColor:[UIColor grayColor]]];
    // 设置背景色
    [self.navigationBar setBackgroundImage:[self imageWithColor:[UIColor brownColor]] forBarMetrics:UIBarMetricsDefault];

}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UINavigationBar appearance] setTintColor:HexRGB(0xFCE7B3)];///导航金色字 返回按钮颜色
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    return [super popToViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    return [super popToRootViewControllerAnimated:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
