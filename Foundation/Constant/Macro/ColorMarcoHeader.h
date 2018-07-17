

//
//  ColorMarcoHeader.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#ifndef ColorMarcoHeader_h
#define ColorMarcoHeader_h



///生成颜色对象
#define HexRGBString(rgbStr)        [UIColor colorWithHexString:rgbStr]
#define HexRGB(rgbValue)            [UIColor colorWithHex:rgbValue alpha:1.0]
#define HexRGBAlpha(rgbValue,a)     [UIColor colorWithHex:rgbValue alpha:a]
#define RGB(r, g, b)                [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)        [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]




#endif /* ColorMarcoHeader_h */
