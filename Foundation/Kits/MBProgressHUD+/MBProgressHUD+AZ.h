//
//  MBProgressHUD+AZ.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/17.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (AZ)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessages:(NSString *)messages toView:(UIView *)view;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
