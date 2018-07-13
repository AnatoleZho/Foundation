//
//  main.m
//  3DES研究
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface JKEncrypt : NSObject

/**字符串加密 */
-(NSDictionary *)doEncrypt:(NSDictionary *)originalDic;
/**字符串解密 */
-(NSDictionary *)doDecEncrypt:(NSDictionary *)encryptDic;

@end
