//
//  YSActionSheetView.h
//  ShareAlertDemo
//
//  Created by dev on 2018/5/23.
//  Copyright © 2018年 nys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSActionSheetView : UIView

-(instancetype)initShareActionView;

@property (nonatomic, copy) void(^customActionSheetButtonAction)(NSInteger index);

@end
