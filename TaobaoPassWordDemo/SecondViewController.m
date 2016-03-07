//
//  SecondViewController.m
//  TaobaoPassWordDemo
//
//  Created by yindongbo on 16/3/7.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end


@implementation SecondViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label setText:self.string];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label.layer setBorderWidth:1];
    [self.view addSubview:label];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:longPress];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)copy:(id)sender {
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.string;
    NSLog(@"%@",pboard.string);
}

- (void)close:(id)sender {
 
}




- (void)longPress:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
    UIMenuItem *close = [[UIMenuItem alloc]initWithTitle:@"关闭" action:@selector(close:)];
    UIMenuController * menuController =[UIMenuController sharedMenuController];
    [menuController setMenuItems:[NSArray arrayWithObjects:close, nil]];
    [menuController setTargetRect:CGRectMake(100, 100, 100, 100) inView:self.view];
    [menuController setMenuVisible:YES animated:YES];
    }
}

- (BOOL)canBecomeFirstResponder{
    return YES;
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
