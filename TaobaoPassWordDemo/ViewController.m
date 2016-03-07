//
//  ViewController.m
//  TaobaoPassWordDemo
//
//  Created by yindongbo on 16/3/7.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor =[UIColor  whiteColor];
    
    
    UIButton * YeallowBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:YeallowBtn];
    YeallowBtn.backgroundColor =[UIColor yellowColor];
    YeallowBtn.frame = CGRectMake(50, 100, 100, 100);
    [YeallowBtn setTitle:@"yeallow" forState:UIControlStateNormal];
    [YeallowBtn addTarget:self action:@selector(clickYeallow:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * orangeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:orangeBtn];
    orangeBtn.backgroundColor = [UIColor orangeColor];
    orangeBtn.frame = CGRectMake(50, 250, 100, 100);
    [orangeBtn setTitle:@"orange" forState:UIControlStateNormal];
    [orangeBtn addTarget:self action:@selector(clickOrange:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickYeallow:(UIButton *)sender {
    SecondViewController * vc = [[SecondViewController alloc] init];
    vc.string = @"Yeallow";
    vc.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickOrange:(UIButton *)sender {
    SecondViewController * vc = [[SecondViewController alloc] init];
    vc.string = @"Orange";
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
