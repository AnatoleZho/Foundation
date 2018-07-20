//
//  AZBGColorDemoViewController.m
//  Foundation
//
//  Created by AnatoleZhou on 2018/7/17.
//  Copyright © 2018年 AnatoleZhou. All rights reserved.
//

#import "AZBGColorDemoViewController.h"

#define NAVBAR_CHANGE_POINT 50

@interface AZBGColorDemoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIImageView *headerImgView;

@end

@implementation AZBGColorDemoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = self.view.backgroundColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
}

- (void)viewWillLayoutSubviews {
    CGFloat naviHeight = 64.0f;
    if (self.view.frame.size.height == 812) {
        naviHeight = 88.0f;
    }
    self.tableView.frame = CGRectMake(0, - naviHeight, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView.contentInset = UIEdgeInsetsMake(- naviHeight, 0, 0, 0);
//    self.header.frame = CGRectMake(0, 0, self.view.frame.size.width, self.headerImgView.frame.size.height);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat naviHeight = 64.0f;
    if (self.view.frame.size.height == 812) {
        naviHeight = 88.0f;
    }
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + naviHeight - offsetY) / naviHeight));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}

#pragma mark UITableViewDatasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"text";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
