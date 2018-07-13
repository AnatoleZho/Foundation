//
//  UIAlertController+Package.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ConformAction)(void);

typedef void(^TextConformAction)(NSString *text);

@interface UIAlertController (Package)

// 只有确认
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg conformTitle:(NSString *)conformTitle conformAction:(ConformAction)conformAction;
// 确认和取消
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg conformTitle:(NSString *)conformTitle conformAction:(ConformAction)conformAction cancelAction:(ConformAction)cancelAction;
// TextFiled Alert
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg placeHolder:(NSString *)placeHolder conformTitle:(NSString *)conformTitle conformAction:(TextConformAction)conformAction cancelAction:(ConformAction)cancelAction;
// 两个确认按钮
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg conformFTitle:(NSString *)conformFTitle conformSTitle:(NSString *)conformSTitle conformFirstAction:(ConformAction)conformFAction conformSecondAction:(ConformAction)conformSAction cancelAction:(ConformAction)cancelAction;

@end
