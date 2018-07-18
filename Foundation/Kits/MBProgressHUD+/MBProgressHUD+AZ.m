
//
//  MBProgressHUD+AZ.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/17.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "MBProgressHUD+AZ.h"

@implementation MBProgressHUD (AZ)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    if (text == nil || [text isEqual:[NSNull null]]) text = @"哎呦,出错了~";
    if ([text isEqualToString:@"您无权访问该接口!"]) text = @"您的账号已在其他设备上登录，请重新登录。";
    // 快速显示一个提示信息,提示信息可换行
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.font = [UIFont systemFontOfSize:16];
    // 字体颜色为#333333
    label.textColor = [UIColor colorWithRed:0.1992 green:0.1992 blue:0.1992 alpha:1];
    label.numberOfLines = 0;
    label.text = text;
    [label sizeToFit];
    hud.customView = label;
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

+ (MBProgressHUD *)showMessages:(NSString *)messages toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor colorWithHex:(0x000000) alpha:1.0];
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = messages;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
    
}

@end
