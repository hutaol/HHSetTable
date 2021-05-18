//
//  HHViewController.m
//  HHSetTable
//
//  Created by 1325049637@qq.com on 05/17/2021.
//  Copyright (c) 2021 1325049637@qq.com. All rights reserved.
//

#import "HHViewController.h"
#import "HHDemoTableViewController.h"
#import "HHCategoryViewController.h"

@interface HHViewController ()

@end

@implementation HHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClick:(UIButton *)sender {
    HHDemoTableViewController *vc = [[HHDemoTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onClick2:(UIButton *)sender {
    HHCategoryViewController *vc = [[HHCategoryViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
