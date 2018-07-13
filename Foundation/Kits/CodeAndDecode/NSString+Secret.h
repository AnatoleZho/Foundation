//
//  NSString+Secret.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Secret)

- (BOOL)isEmpty;

@end

@interface NSString (MD5)

+(NSString *)md5String:(NSString *)sourceString;//md5字符串加密

+(NSString *)md5Data:(NSData *)sourceData;//md5data加密

@end


@interface NSString (Base64)

+(NSString *)base64EncodingWithData:(NSData *)sourceData;//base64加密

+(id)base64EncodingWithString:(NSString *)sourceString;//base64解密

@end
