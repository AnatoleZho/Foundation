//
//  ShareTableViewCell.m
//  ShareAlertDemo
//
//  Created by dev on 2018/5/23.
//  Copyright © 2018年 nys. All rights reserved.
//

#import "ShareTableViewCell.h"

#define SCREENWIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREENHEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ShareTableViewCell ()


@end

@implementation ShareTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //分享到
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"分 享 ";
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor =[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        titleLabel.frame = CGRectMake(0, 10, SCREENWIDTH-20, 30);
        [self addSubview:titleLabel];
        
        CGFloat btnW = 75;
        CGFloat btnH = 80;
        NSArray *contentArray = @[
                                  @{@"name":@"微信好友",@"icon":@"share_weixin_icon"},
                                  @{@"name":@"朋友圈",@"icon":@"share_friends_icon"},
                                  ];
   
        NSMutableArray *arrM = [NSMutableArray array];
        for (int i = 0; i < 2; i++) {
            NSDictionary *dic = [contentArray objectAtIndex:i];
            NSString *name = dic[@"name"];
            NSString *icon = dic[@"icon"];
            YSActionSheetButton *btn = [YSActionSheetButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            [btn setTitle:name forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            CGFloat marginX = (SCREENWIDTH-20 - 2 * btnW) / (2 + 1);
            int col = i % 2;
            CGFloat btnX = marginX + (marginX + btnW) * col;
            btn.frame = CGRectMake(btnX, 45, btnW, btnH);
            btn.transform = CGAffineTransformMakeTranslation(0, 100);
            
            [self addSubview:btn];
            [arrM addObject:btn];
        }
        self.btnArr = [arrM copy];
    }
    return self;
    
}

- (void)btnAction:(UIButton *)sender {
    if (self.clickAction) {
        _clickAction(sender.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
