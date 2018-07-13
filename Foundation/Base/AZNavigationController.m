//
//  AZNavigationController.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "AZNavigationController.h"

@interface AZNavigationController ()

@end

@implementation AZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // title 颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: WHMainClolor, NSFontAttributeName: [UIFont systemFontOfSize:18.0]};
    self.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green: 247.0/255.0 blue:247.0/255.0 alpha:1.0];
    self.navigationBar.tintColor = WHMainClolor;
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
