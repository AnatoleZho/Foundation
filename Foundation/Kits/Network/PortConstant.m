//
//  PortConstant.m
//  AlertAction
//
//  Created by M了个C on 2018/6/20.
//  Copyright © 2018年 M了个C. All rights reserved.
//

#import "PortConstant.h"

@implementation PortConstant

#ifdef PUBLISH
  #define kServiceIP @"http://39.105.36.26/PUB"
#else
  #define kServiceIP @"http://39.105.36.26/DEV"
#endif

NSString * const HttpBaseURL                   = @""kServiceIP"";///HttpBaseURL

NSString * const kAppPacket                   = @""kServiceIP"/appPacket";

@end
