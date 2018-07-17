//
//  ViewController.m
//  AlertAction
//
//  Created by M了个C on 2018/6/13.
//  Copyright © 2018年 M了个C. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "AZBGColorDemoViewController.h"

@interface ViewController ()
{
    
    UICustomBarBtnItem *_leftItem;
    __weak IBOutlet UILabel *_label;
}
@property (weak, nonatomic) IBOutlet UIButton *imgTitleBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = @" ";
    if ([str isEmpty]) {
        NSLog(@"isEmpty");
    } else {
        NSLog(@"NO ");

    }
    
    Log(@"%@", HttpBaseURL);
    Log(@"%@", kAppPacket);
    Log(@"%@", kCode);
    Log(@"%.2f", FONT_SCALE_SIZE(15.0));
    _leftItem = [UICustomBarBtnItem itemWithTarget:self action:@selector(leftAction) image:@"" title:@"左按钮"];
//    _leftItem.backgroundColor = [UIColor redColor];
    _leftItem.itemTextColor = [UIColor cyanColor];
    self.navigationItem.leftBarButtonItem = _leftItem;
    
    _label.text = NSLocalizedString(@"click", nil);
    
    // 改变按钮文字图片位置
    // 左右
//    [self.imgTitleBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
//    self.imgTitleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, self.imgTitleBtn.titleLabel.intrinsicContentSize.width, 0, -self.imgTitleBtn.titleLabel.intrinsicContentSize.width);
//    self.imgTitleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imgTitleBtn.currentImage.size.width, 0, self.imgTitleBtn.currentImage.size.width);
    
    // 上下
    [self.imgTitleBtn setImageEdgeInsets:UIEdgeInsetsMake(-self.imgTitleBtn.titleLabel.intrinsicContentSize.height, 0, 0, -self.imgTitleBtn.titleLabel.intrinsicContentSize.width)];
    [self.imgTitleBtn setTitleEdgeInsets:UIEdgeInsetsMake(self.imgTitleBtn.currentImage.size.height + 20, -self.imgTitleBtn.currentImage.size.width, 0, 0)];
    // 设置 title 两行
    [self.imgTitleBtn setTitle:@"编辑\n信息" forState:UIControlStateNormal];
    self.imgTitleBtn.titleLabel.numberOfLines = 0;

}

- (void)leftAction {
    if (!_leftItem.isSelected) {
        _leftItem.itemText = @"按下";
        _leftItem.selected = YES;
    } else {
        _leftItem.itemText = @"左按钮";

        _leftItem.selected = NO;
    }
    NSLog(@"%d", _leftItem.isSelected );
}


- (IBAction)conformAction:(UIButton *)sender {
    [UIAlertController showInController:self title:@"Title" msg:@"Message" conformTitle:@"Conform" conformAction:^{
        NSLog(@"Conform Action");
    }];
}

- (IBAction)conformCancelAction:(UIButton *)sender {
    [UIAlertController showInController:self title:@"Title" msg:@"Message" conformTitle:@"Conform" conformAction:^{
        NSLog(@"Conform Action");
    } cancelAction:^{
        NSLog(@"Cancel Action");
    }];
}

- (IBAction)textAlertAction:(UIButton *)sender {
    [UIAlertController showInController:self title:@"Title" msg:@"Message" placeHolder:@"Place Holder" conformTitle:@"Conform" conformAction:^(NSString *text) {
        NSLog(@"Conform Action Text: %@", text);
    } cancelAction:^{
        NSLog(@"Cancel Action");
    }];
}

- (IBAction)sheetAction:(UIButton *)sender {
    [UIAlertController showInController:self title:@"Title" msg:@"Message" conformFTitle:@"FirstAction" conformSTitle:@"SecondAction" conformFirstAction:^{
        NSLog(@"Conform First Action");
    } conformSecondAction:^{
        NSLog(@"Conform Second Action");
    } cancelAction:^{
        NSLog(@"Cancel Action");
    }];
}

- (IBAction)pushAction:(UIButton *)sender {
    AViewController *aVC = [[AViewController alloc] init];
    [self.navigationController pushViewController:aVC animated:YES];
}

- (IBAction)pushStoryBoard:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([AZBGColorDemoViewController class]) bundle:nil];
    AZBGColorDemoViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AZBGColorDemoViewController class])];
    [self.navigationController pushViewController:vc animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
