//
//  UIColor+Category.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorFromString:(NSString *)stringToConvert;


+ (UIColor *)colorWithHexString:(NSString *)hexString;


+ (UIColor *)random;
+ (UIColor *)colorWithHex:(int)hex;
+ (UIColor *)colorWithHex:(int)hex alpha:(CGFloat)alpha;


/**
 * @brief 颜色对象返回字符串
 * @return 颜色字符串
 */
- (NSString *)hexString;

@end
