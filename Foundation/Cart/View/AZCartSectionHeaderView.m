

//
//  AZCartSectionHeaderView.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/19.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "AZCartSectionHeaderView.h"

@interface AZCartSectionHeaderView ()
{
    UIImage *_unSelectedImg;
    UIButton *_selectBtn;
    UILabel *_nameLabel;
    UIView *_lineView;

}

@end

@implementation AZCartSectionHeaderView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    _unSelectedImg = [UIImage imageNamed:@"Unselected.png"];
    UIImage *selectedImg = [UIImage imageNamed:@"Selected.png"];
    _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_selectBtn];
    [_selectBtn setImage:_unSelectedImg forState:UIControlStateNormal];
    [_selectBtn setImage:selectedImg forState:UIControlStateSelected];
    [_selectBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    _nameLabel.textColor = k_Color_666;
    _nameLabel.font = [UIFont systemFontOfSize:k_FontSize_16];
    
    _lineView = [[UIView alloc] init];
    [self addSubview:_lineView];
    _lineView.backgroundColor = kLineColor;
}

- (void)layoutSubviews {
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(self->_unSelectedImg.size.width + 12);
        make.height.mas_equalTo(self->_unSelectedImg.size.height + 10);

    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_selectBtn.mas_right).offset(15);
        make.right.equalTo(self).offset(-15);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(40);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(k_SINGLE_LINE);
    }];
}

- (void)selectAction:(UIButton *)sender {
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
