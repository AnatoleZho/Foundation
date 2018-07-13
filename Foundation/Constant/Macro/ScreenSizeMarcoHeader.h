//
//  ScreenSizeMarcoHeader.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#ifndef ScreenSizeMarcoHeader_h
#define ScreenSizeMarcoHeader_h

///屏幕宽高
#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

///iphone 系列尺寸
#define IPHONE_4         CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size)
#define IPHONE_5         CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size)
#define IPHONE_6         CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size)
#define IPHONE_P         CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size)
#define IPHONE_X         CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size)
///UI机型尺寸比例（以iphone6为基准）
#define UI_H_SCALE                  (CGFloat)kScreenWidth/375.f
#define UI_V_SCALE                  kScreenHeight/667.f

//  底部安全区域高
#define kBottomSafeAreaHeight (kScreenHeight == 812.0 ? 34.f : 0)
//  导航栏高度
#define kNavbarHeight       (kScreenHeight == 812.0 ? 88.f : 64.f)
//  状态栏高度
#define kStatusbarHeight    (kScreenHeight == 812.0 ? 44.f : 20.f)
//  tabbar高度
#define kTabbarHeight       (kScreenHeight == 812.0 ? (49.f+34.f) : 49.f)

///判断是否是iphone设备
#define IS_PHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

///字体大小,宏名以iphone6P下的字号为准
#define FONT(x)             [UIFont systemFontOfSize:FONT_SCALE_SIZE(x)]
#define FONT_Name(name,x)   [UIFont fontWithName:name size:FONT_SCALE_SIZE(x)]
#define BOLD_FONT(x)        [UIFont boldSystemFontOfSize:FONT_SCALE_SIZE(x)]
#define FONT_SCALE_SIZE(x)  (UI_H_SCALE * x)


#endif /* ScreenSizeMarcoHeader_h */
