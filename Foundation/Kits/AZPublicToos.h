//
//  AZPublicToos.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^BtnActionBlock)(UIButton * btn);

typedef void(^HandleBlock)(void);

@interface AZPublicToos : NSObject

+ (void)deleteFile;
///获取当前APP名字
+ (NSString *)bundleDisplayName;
///获取当前APP版本号
+ (NSString *)bundleShortVersionString;
///获取当前APPbuild号
+ (NSString *)bundleVersion;
// 手机系统版本号
+ (NSString *)systemVersion;
///获取bundle id
+ (NSString *)bundleIdentifier;

+(NSString *)getUUID;

+(NSString *)getDeviceInfo;

+ (UIAlertController *)showAlertWithViewController:(UIViewController *)vc title:(NSString *)title defaultText:(NSString *)defaultText completeTitle:(NSString *)btnTitle handle:(void(^)(NSString *))handleBlock;

+ (void)startTimeWithBtn:(UIButton *)btn timeout:(int)time;
+ (void)encodeObject:(id)obj withKey:(NSString *)key;
+ (id)decodeObjectWithKey:(NSString *)key;
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;
+ (void)startTimeWithLabel:(UILabel *)label timeout:(int)time;
+ (NSString *)currentTime;
+ (NSString *)uuidString;
+ (NSString *)chineseFormat:(int)num;
+ (NSString *)translationArebicStr:(NSString *)chineseStr;

@end
