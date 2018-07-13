//
//  NSString+Base64After3DES.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CommonCrypto/CommonCryptor.h>


@interface NSString (Base64After3DES)
/**
 *  3DES加密并转Base64
 *
 *  @param plainText        要加密的字符串
 *  @param encryptOrDecrypt 系统固定参数: kCCEncrypt
 *  @param key              自己设定的秘钥
 *
 *  @return 3DES加密后并转Base64的字符串
 */
+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString*)key; // 这个分类需要注意-fno-objc-arc的问题(需要给这个分类的.m和GTMBase64.m添加)
@end
