//
//  UIAlertController+Package.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "UIAlertController+Package.h"

@implementation UIAlertController (Package)
// 只有确认
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg conformTitle:(NSString *)conformTitle conformAction:(ConformAction)conformAction {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cencelAlert = [UIAlertController actionWithTitle:conformTitle Action:conformAction];
    [alert addAction:cencelAlert];
    
    [controller presentViewController:alert animated:YES completion:nil];
    return alert;
}
// 确认和取消
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg conformTitle:(NSString *)conformTitle conformAction:(ConformAction)conformAction cancelAction:(ConformAction)cancelAction {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cencelAlert = [UIAlertController actionWithTitle:@"取消" Action:cancelAction];
    [alert addAction:cencelAlert];
    
    UIAlertAction *confirmAlert = [UIAlertController actionWithTitle:conformTitle Action:conformAction];
    [alert addAction:confirmAlert];
    
    [controller presentViewController:alert animated:YES completion:nil];
    
    return alert;
}
// TextFiled Alert
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg placeHolder:(NSString *)placeHolder conformTitle:(NSString *)conformTitle conformAction:(TextConformAction)conformAction cancelAction:(ConformAction)cancelAction {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeHolder;
    }];
    
    UIAlertAction *cencelAlert = [UIAlertController actionWithTitle:@"取消" Action:cancelAction];
    [alert addAction:cencelAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:conformTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = alert.textFields.firstObject;
        if (conformAction) {
            conformAction(textField.text);
        }
    }];
    
    [alert addAction:action];
    
    
    [controller presentViewController:alert animated:YES completion:nil];
    
    return alert;
}
// 两个确认按钮
+ (UIAlertController *)showInController:(UIViewController *)controller title:(NSString *)title msg:(NSString *)msg conformFTitle:(NSString *)conformFTitle conformSTitle:(NSString *)conformSTitle conformFirstAction:(ConformAction)conformFAction conformSecondAction:(ConformAction)conformSAction cancelAction:(ConformAction)cancelAction {
    
    UIAlertController *alert =  [UIAlertController showInController:controller title:title msg:msg conformTitle:conformFTitle conformAction:conformFAction];
    
    UIAlertAction *secondAction = [UIAlertController actionWithTitle:conformSTitle Action:cancelAction];
    [alert addAction:secondAction];
    
    UIAlertAction *cencelAlert = [UIAlertController actionWithTitle:@"取消" Action:cancelAction];
    [alert addAction:cencelAlert];
    return alert;
}

+ (UIAlertAction *)actionWithTitle:(NSString *)title Action:(ConformAction)conformction {
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (conformction) {
            conformction();
        }
    }];
    return alertAction;
}
@end
