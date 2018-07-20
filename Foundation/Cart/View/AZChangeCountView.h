//
//  AZChangeCountView.h
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/18.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AZChangeCountView : UIView

@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UIButton *subBtn;

@property (nonatomic, copy) BtnActionBlock btnAction;

// 数据输入框
@property (nonatomic, strong) UITextField *countTF;

@property (nonatomic, assign) NSUInteger chooseCount;
@property (nonatomic, assign) NSUInteger totalCount;

- (instancetype)initWithFrame:(CGRect)frame chooseCount:(NSUInteger)chooseCount totalCount:(NSUInteger)totalCount;



@end
