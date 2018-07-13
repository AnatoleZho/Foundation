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


#define kNaviTitleFontSize FONT_SCALE_SIZE(17)
#define kNaviItemFontSize FONT_SCALE_SIZE(15)









#endif /* MarcoHeader_h */
