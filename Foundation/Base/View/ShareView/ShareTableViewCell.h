//
//  ShareTableViewCell.h
//  ShareAlertDemo
//
//  Created by dev on 2018/5/23.
//  Copyright © 2018年 nys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSActionSheetButton.h"


@interface ShareTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *btnArr;

@property (nonatomic, copy) void(^clickAction)(NSInteger index);

@end
