//
//  MarcoHeader.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#ifndef MarcoHeader_h
#define MarcoHeader_h

#import "ColorMarcoHeader.h"
#import "ScreenSizeMarcoHeader.h"




// 定义发布环境,若注释掉则为开发环境
#define PUBLISH

// 定义 Debug 时输出, Release 时不输出
#ifdef DEBUG // 调试
#define Log(...) NSLog(__VA_ARGS__);
#else // 发布
#define Log(...)
#endif



#define kNaviTitleFontSize FONT_SCALE_SIZE(17.0f)
#define kNaviItemFontSize FONT_SCALE_SIZE(15.0f)

#define k_FontSize_11 FONT_SCALE_SIZE(11.0f)
#define k_FontSize_12 FONT_SCALE_SIZE(12.0f)
#define k_FontSize_13 FONT_SCALE_SIZE(13.0f)
#define k_FontSize_14 FONT_SCALE_SIZE(14.0f)
#define k_FontSize_15 FONT_SCALE_SIZE(15.0f)
#define k_FontSize_16 FONT_SCALE_SIZE(16.0f)
#define k_FontSize_17 FONT_SCALE_SIZE(17.0f)
#define k_FontSize_18 FONT_SCALE_SIZE(18.0f)


#define kNaviTextClolor     RGB(0.0, 138.0, 255.0)
#define kBackGroundColor [UIColor colorWithHexString:@"#ededee"]

#define kLineColor [UIColor colorWithHexString:@"#dddddd"]


#define k_Color_ddd [UIColor colorWithHexString:@"#dddddd"]
#define k_Color_333 [UIColor colorWithHexString:@"#333333"]
#define k_Color_666 [UIColor colorWithHexString:@"#666666"]



#endif /* MarcoHeader_h */
