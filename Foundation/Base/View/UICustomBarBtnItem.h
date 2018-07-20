//
//  UICustomBarBtnItem.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UICustomBarBtnItem : UIBarButtonItem

@property (nonatomic, strong) NSString *imgName;
@property (nonatomic, strong) NSString *highlightedImgName;

@property (nonatomic, strong) NSString *backImgName;
@property (nonatomic, strong) NSString *itemText;
@property (nonatomic, strong) UIColor *itemTextColor;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign, getter = isSelected) BOOL selected;

+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image title:(NSString *)title;

@end
