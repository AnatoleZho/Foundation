//
//  UIColor+Category.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

const NSInteger MAX_RGB_COLOR_VALUE = 0xff;
const NSInteger MAX_RGB_COLOR_VALUE_FLOAT = 255.0f;

+ (UIColor *)colorFromString:(NSString *)stringToConvert{
    
    return [self colorWithHexString:stringToConvert];
}

+ (UIColor *)colorWithRGBA:(uint)hex{
    return [UIColor colorWithRed:(CGFloat)((hex>>24)& MAX_RGB_COLOR_VALUE)/ MAX_RGB_COLOR_VALUE_FLOAT
                           green:(CGFloat)((hex>>16)& MAX_RGB_COLOR_VALUE)/ MAX_RGB_COLOR_VALUE_FLOAT
                            blue:(CGFloat)((hex>>8)& MAX_RGB_COLOR_VALUE)/ MAX_RGB_COLOR_VALUE_FLOAT
                           alpha:(CGFloat)((hex)& MAX_RGB_COLOR_VALUE)/ MAX_RGB_COLOR_VALUE_FLOAT];
}


+ (UIColor *)colorWithRGB:(uint)hex{
    return [UIColor colorWithRed:(CGFloat)((hex>>16)& MAX_RGB_COLOR_VALUE)/ MAX_RGB_COLOR_VALUE_FLOAT
                           green:(CGFloat)((hex>>8)& MAX_RGB_COLOR_VALUE)/ MAX_RGB_COLOR_VALUE_FLOAT
                            blue:(CGFloat)(hex & MAX_RGB_COLOR_VALUE)/ MAX_RGB_COLOR_VALUE_FLOAT
                           alpha:1.0];
}


+ (UIColor *)colorWithHexString:(NSString *)hexString{
    uint hex;
    
    // chop off hash
    if ([hexString characterAtIndex:0] == '#'){
        hexString = [hexString substringFromIndex:1];
    }
    
    // depending on character count, generate a color
    NSInteger hexStringLength = hexString.length;
    
    if (hexStringLength == 3){
        // RGB, once character each (each should be repeated)
        hexString = [NSString stringWithFormat:@"%c%c%c%c%c%c", [hexString characterAtIndex:0], [hexString characterAtIndex:0], [hexString characterAtIndex:1], [hexString characterAtIndex:1], [hexString characterAtIndex:2], [hexString characterAtIndex:2]];
        hex = (uint)strtoul([hexString UTF8String], NULL, 16);
        
        return [self colorWithRGB:hex];
    } else if (hexStringLength == 4){
        // RGBA, once character each (each should be repeated)
        hexString = [NSString stringWithFormat:@"%c%c%c%c%c%c%c%c", [hexString characterAtIndex:0], [hexString characterAtIndex:0], [hexString characterAtIndex:1], [hexString characterAtIndex:1], [hexString characterAtIndex:2], [hexString characterAtIndex:2], [hexString characterAtIndex:3], [hexString characterAtIndex:3]];
        hex = (uint)strtoul([hexString UTF8String], NULL, 16);
        
        return [self colorWithRGBA:hex];
    } else if (hexStringLength == 6){
        // RGB
        hex = (uint)strtoul([hexString UTF8String], NULL, 16);
        
        return [self colorWithRGB:hex];
    } else if (hexStringLength == 8){
        // RGBA
        hex =(uint)strtoul([hexString UTF8String], NULL, 16);
        
        return [self colorWithRGBA:hex];
    }
    
    // illegal
    [NSException raise:@"Invalid Hex String" format:@"Hex string invalid: %@", hexString];
    
    return nil;
}

+ (UIColor *)random{
    CGFloat hue = ( arc4random()% 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random()% 128 / 256.0 )+ 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random()% 128 / 256.0 )+ 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (UIColor *)colorWithHex:(int)hex alpha:(CGFloat)alpha{
    //    CGFloat red = ((hex & 0xFF0000) >> 16)/255.0; 或
    
    int r = (hex >> 16)& 255;
    int g = (hex >> 8)& 255;
    int b = hex & 255;
    
    float rf = (float)r / 255.0f;
    float gf = (float)g / 255.0f;
    float bf = (float)b / 255.0f;
    
    return [UIColor colorWithRed:rf green:gf blue:bf alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hex{
    return [self colorWithHex:hex alpha:1];
}

- (NSString *)hexString{
    
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    int red = (int)(components[0] * MAX_RGB_COLOR_VALUE);
    int green = (int)(components[1] * MAX_RGB_COLOR_VALUE);
    int blue = (int)(components[2] * MAX_RGB_COLOR_VALUE);
    int alpha = (int)(components[3] * MAX_RGB_COLOR_VALUE);
    
    if (alpha < 255){
        return [NSString stringWithFormat:@"#%02x%02x%02x%02x", red, green, blue, alpha];
    }
    return [NSString stringWithFormat:@"#%02x%02x%02x", red, green, blue];
}

@end
