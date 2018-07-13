//
//  YSActionSheetView.m
//  ShareAlertDemo
//
//  Created by dev on 2018/5/23.
//  Copyright © 2018年 nys. All rights reserved.
//

#import "YSActionSheetView.h"

#import "ShareTableViewCell.h"

#import "YSActionSheetButton.h"


#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height
#define SafeAreaHeight (([[UIScreen mainScreen] bounds].size.height-812)?0:34)

#define SPACE 10



@interface YSActionSheetView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,   copy) NSString *cancelTitle;

@end


@implementation YSActionSheetView

-(instancetype)initShareActionView {
    if (self = [super init]) {
        [self craetUI];
    }
    return self;
}



- (void)craetUI {
    self.frame = [UIScreen mainScreen].bounds;
    [self addSubview:self.maskView];
    [self addSubview:self.tableView];
    
}

- (UIView*)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = .0;
        _maskView.userInteractionEnabled = YES;
    }
    return _maskView;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 10;
        _tableView.clipsToBounds = YES;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}
#pragma mark TableViewDel
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        return 140;
    } else {
        return 44;
    }
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ShareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"top_Cell"];
        if (!cell) {
            cell=[[ShareTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"top_Cell"];
        }
        cell.backgroundColor=[UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.layer.cornerRadius = 10;
        __weak typeof(self) weakSelf = self;
        [cell setClickAction:^(NSInteger index) {
            [weakSelf shareBtnClick:index];
        }];
       
        
        [cell.btnArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [UIView animateWithDuration:1.1 delay:0.05 * (idx +1) usingSpringWithDamping:0.7 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                obj.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                
            }];
        }];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bottom_Cell"];
        if (!cell) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bottom_Cell"];
        }
        cell.backgroundColor=[UIColor whiteColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"取消";
        cell.layer.cornerRadius = 10;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismiss];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        return SPACE;
    } else {
        return 15;
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    CGFloat selfHeight ;
    if (section==0) {
        selfHeight = SPACE ;
    } else {
        selfHeight = 15 ;
    }
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, selfHeight)];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self show];
}


-(void)shareBtnClick:(NSInteger )index {
    if (index == 0 || index == 1) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            if (_customActionSheetButtonAction) {
                _customActionSheetButtonAction(index);
            }
        } else {
            //[Dialog simpleToast:@"请安装微信"];
            UIAlertAction * confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请安装微信" preferredStyle:UIAlertControllerStyleAlert];
            [alertView addAction:confirmAction];
            [[self appRootViewController] presentViewController:alertView animated:YES completion:nil];
        }
    } else if (index == 2 || index == 3) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
            if (_customActionSheetButtonAction) {
                _customActionSheetButtonAction(index);
            }
        } else {
           // [Dialog simpleToast:@"请安装QQ"];
            UIAlertAction * confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                
            }];

            UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请安装QQ" preferredStyle:UIAlertControllerStyleAlert];
            [alertView addAction:confirmAction];
            [[self appRootViewController] presentViewController:alertView animated:YES completion:nil];
        }
    }
    [self dismiss];
    
    
}

- (void)show {
    _tableView.frame = CGRectMake(SPACE, Screen_height, Screen_Width - (SPACE * 2), 140+44 +(SPACE * 2));
    [UIView animateWithDuration:.35 animations:^{
        _maskView.alpha = .3;
        CGRect rect = _tableView.frame;
        rect.origin.y -= _tableView.bounds.size.height;
        //适配iPhone X
        rect.origin.y -= SafeAreaHeight;
        _tableView.frame = rect;
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:.15 animations:^{
        _maskView.alpha = .0;
        CGRect rect = _tableView.frame;
        rect.origin.y += _tableView.bounds.size.height;
        //适配iPhone X
        rect.origin.y += SafeAreaHeight;
        _tableView.frame = rect;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}

- (UIViewController *)appRootViewController {
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC =appRootVC;
        while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}



@end
