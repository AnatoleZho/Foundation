//
//  AZBlankView.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AZBlankView : UIView
//图片
@property (nonatomic,strong)NSString *imageName;
//文字
@property (nonatomic,strong)NSString *text;
//设置背景色 文字颜色
@property (nonatomic,assign)BOOL isBlue;
// block
@property (nonatomic, copy) void(^btnAction)(void);

+(void)showBlankViewWithFrame:(CGRect)frame imageName:(NSString *)imageName blankText:(NSString *)text  superView:(UIView *)superView action:(void(^)(void))action;

@end
