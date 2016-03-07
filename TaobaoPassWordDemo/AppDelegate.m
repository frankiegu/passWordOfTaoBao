//
//  AppDelegate.m
//  TaobaoPassWordDemo
//
//  Created by yindongbo on 16/3/7.
//  Copyright © 2016年 ydb. All rights reserved.
//

#import "AppDelegate.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "SecondViewController.h"
#import "ViewController.h"
@interface AppDelegate ()<
UIAlertViewDelegate
>{
    ViewController * _vc;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    
    _vc = [[ViewController alloc] init];
    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:_vc];
    [self.window setRootViewController:nav];
    
    [self pasteboard];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"%s",__FUNCTION__);

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [self pasteboard];
}

-(void)pasteboard{
    //淘宝口令 黑科技
    /**
     淘口令就是一段字符串在粘贴板上, 每次回到应用的时候都检查一下这个字符串是否存在。只要这个字符串满足淘宝自己制定的一套规则，就会去识别咯
     粘贴板都是全局的
     是系统全局的
     每个app 共享的
     */
    UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
    id result = [pasteBoard valuesForPasteboardType:(NSString*)kUTTypePlainText inItemSet:nil];
    for (NSString * str in result) {
        NSLog(@"接收到的字符串：%@",str);
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"进入", nil];
        view.delegate = self;
        [view show];
        if ([str containsString:@"Yeallow"]) {
            view.tag = 1;
        }else if ([str containsString:@"Orange"]){
            view.tag = 2;
        }
        NSLog(@"监测到粘贴板中的内容符合条件，就进行相关操作");
    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        
    }else{
        
        SecondViewController * vc = [SecondViewController new];
        if (alertView.tag == 1) {
            vc.view.backgroundColor = [UIColor yellowColor];
            vc.string = @"Yeallow";
        }else if (alertView.tag ==2){
            vc.view.backgroundColor = [UIColor orangeColor];
            vc.string = @"Orange";
        }
        UIPasteboard *pboard = [UIPasteboard generalPasteboard];
        pboard.string = @"";
        [_vc.navigationController pushViewController:vc animated:YES];
        NSLog(@"进入对应控制器");
    }
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
