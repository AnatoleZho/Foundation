//
//  UICustomBarBtnItem.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "UICustomBarBtnItem.h"

@interface UICustomBarBtnItem ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@end

@implementation UICustomBarBtnItem

+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIImage *img = [UIImage imageNamed:image inBundle:bundle compatibleWithTraitCollection:nil];
    [btn setImage:img forState:UIControlStateNormal];
    UIImage *highImg = [UIImage imageNamed:highImage inBundle:bundle compatibleWithTraitCollection:nil];
    [btn setImage:highImg forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
    
    UICustomBarBtnItem *item = [[UICustomBarBtnItem alloc] initWithCustomView:btn];
    item.button = btn;
    item.selected = btn.isSelected;
    return item;
    
}

+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image title:(NSString *)title {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIImage *img = [UIImage imageNamed:image inBundle:bundle compatibleWithTraitCollection:nil];
    
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    
    CGRect imgRect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kNaviItemFontSize]}];
    if (imgRect.size.width == 0 && titleSize.width == 0) {
        imgRect = CGRectMake(0, 0, 60, 44);
    } else if (imgRect.size.width < titleSize.width) {
        imgRect = CGRectMake(0, 0, titleSize.width, 44);
    } else {
        imgRect = CGRectMake(0, 0, imgRect.size.width, 44);
    }
    btn.frame = imgRect;
    btn.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:imgRect];
    titleLabel.font = [UIFont systemFontOfSize:kNaviItemFontSize];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = title;
    [btn addSubview:titleLabel];
    
    UICustomBarBtnItem *item = [[UICustomBarBtnItem alloc] initWithCustomView:btn];
    
    item.button = btn;
    item.label = titleLabel;
    
    return item;
}

- (void)setImgName:(NSString *)imgName {
    _imgName = imgName;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIImage *img = [UIImage imageNamed:imgName inBundle:bundle compatibleWithTraitCollection:nil];
    [self.button setImage:img forState:UIControlStateNormal];
}

- (void)setHighlightedImgName:(NSString *)highlightedImgName {
    _highlightedImgName = highlightedImgName;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIImage *img = [UIImage imageNamed:highlightedImgName inBundle:bundle compatibleWithTraitCollection:nil];
    [self.button setImage:img forState:UIControlStateHighlighted];
}

- (void)setBackImgName:(NSString *)backImgName {
    _backImgName = backImgName;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIImage *img = [UIImage imageNamed:backImgName inBundle:bundle compatibleWithTraitCollection:nil];
    [self.button setBackgroundImage:img forState:UIControlStateHighlighted];
}

- (void)setItemText:(NSString *)itemText {
    _itemText = itemText;
    self.label.text = itemText;
}

- (void)setItemTextColor:(UIColor *)itemTextColor {
    _itemTextColor = itemTextColor;
    self.label.textColor = itemTextColor;
}


- (void)setSelected:(BOOL)selected {
    _selected = selected;
    self.button.selected = selected;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    self.button.backgroundColor = backgroundColor;
}
@end
