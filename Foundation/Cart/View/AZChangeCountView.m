//
//  AZChangeCountView.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/18.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "AZChangeCountView.h"

@interface AZChangeCountView ()
{
    UIImage *_normalSubImg;
    UIImage *_normalAddImg;
}
@end

@implementation AZChangeCountView

- (instancetype)initWithFrame:(CGRect)frame chooseCount:(NSUInteger)chooseCount totalCount:(NSUInteger)totalCount {
    self = [super initWithFrame:frame];
    if (self) {
        self.chooseCount = chooseCount;
        self.totalCount = totalCount;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    _subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_subBtn];
    _subBtn.tag = 1;
    [_subBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
   _normalSubImg = [UIImage imageNamed:@"product_detail_sub_normal"];
    [_subBtn setImage:_normalSubImg forState:UIControlStateNormal];
    UIImage *noSubImg = [UIImage imageNamed:@"product_detail_sub_no"];
    [_subBtn setImage:noSubImg forState:UIControlStateDisabled];
    _subBtn.backgroundColor = [UIColor clearColor];
    if (self.chooseCount <= 1) {
        _subBtn.enabled = NO;
    } else {
        _subBtn.enabled = YES;
    }
    
    _countTF = [[UITextField alloc] init];
    [self addSubview:_countTF];
    
    _countTF.textAlignment = NSTextAlignmentCenter;
    _countTF.keyboardType = UIKeyboardTypeNumberPad;
    _countTF.clipsToBounds = YES;
    _countTF.layer.borderColor = k_Color_ddd.CGColor;
    _countTF.layer.borderWidth = k_SINGLE_LINE;
    _countTF.textColor = k_Color_333;
    _countTF.font = [UIFont systemFontOfSize: k_FontSize_13];
    _countTF.backgroundColor = [UIColor whiteColor];
    _countTF.text = [NSString stringWithFormat:@"%ld", self.chooseCount];
    
    _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_addBtn];
    _addBtn.tag = 2;
    [_addBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    _normalAddImg = [UIImage imageNamed:@"product_detail_sub_normal"];
    [_addBtn setImage:_normalAddImg forState:UIControlStateNormal];
    UIImage *noAddImg = [UIImage imageNamed:@"product_detail_add_no"];
    [_addBtn setImage:noAddImg forState:UIControlStateDisabled];
    _addBtn.backgroundColor = [UIColor clearColor];
    
    if (self.chooseCount >= self.totalCount) {
        _addBtn.enabled = NO;
    } else {
        _addBtn.enabled = YES;
    }
}


- (void)layoutSubviews {
    
    [_subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self.mas_centerY);
        make.height.with.equalTo(self->_normalSubImg);
    }];
    
   
    
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.centerY.equalTo(self.mas_centerY);
        make.height.with.equalTo(self->_normalAddImg);
    }];
    
    [_countTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.subBtn.mas_right);
        make.right.equalTo(self.addBtn.mas_left);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

- (void)btnAction:(UIButton *)sender {
    if (_btnAction) {
        _btnAction(sender);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
