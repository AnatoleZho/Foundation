
//
//  AZBlankView.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/11.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "AZBlankView.h"

@interface AZBlankView ()

@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIButton *titleBtn;

@end

@implementation AZBlankView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:FONT_SCALE_SIZE(15)];
        [btn addTarget:self action:@selector(refreshBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self addSubview:btn];
        self.titleBtn = btn;
    }
    return self;
}

- (void)layoutSubviews {
    CGSize imgSize = self.imageView.image.size;
    self.imageView.frame = CGRectMake((self.bounds.size.width - imgSize.width)/ 2, (self.bounds.size.height - imgSize.height )/ 2, imgSize.width, imgSize.height);
    self.titleBtn.frame = CGRectMake(20, CGRectGetMaxY(self.imageView.frame) + 15, self.frame.size.width - 40, 20);
}

-(void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}

-(void)setText:(NSString *)text{
    _text = text;
    [self.titleBtn setTitle:text forState:UIControlStateNormal];
}


-(void)refreshBtnDidClicked{
    if (_btnAction) {
        _btnAction();
    }
}

//显示空白界面
+(void)showBlankViewWithFrame:(CGRect)frame imageName:(NSString *)imageName blankText:(NSString *)text  superView:(UIView *)superView action:(void(^)(void))action{
    AZBlankView *blankView = [[AZBlankView alloc] initWithFrame:frame];
    blankView.text = text;
    blankView.imageName = imageName;
    
    blankView.hidden = NO;
    blankView.btnAction = action;
    for (UIView *view in superView.subviews) {
        if ([view isKindOfClass:[AZBlankView class]]) {
            return;
        }
    }
    [superView addSubview:blankView];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
