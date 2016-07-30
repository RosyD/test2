//
//  ViewController.m
//  030GCD调度组
//
//  Created by 李朝霞 on 16/7/30.
//  Copyright © 2016年 李朝霞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"下载电影1: xxx.avi");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载电影2: xxx.avi");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:4];
        NSLog(@"下载电影3: xxx.avi");
        dispatch_group_leave(group);
    });
 
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"都下载完成 --> 可以弹出提示提示用户 %@", [NSThread currentThread]);

    });
}

- (void)demo2
{
    
}

- (void)demo1{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        
        NSLog(@"下载电影1: xxx.avi");
        
    });
    
    dispatch_group_async(group, queue, ^{
        
        NSLog(@"下载电影1: xxx.avi");
        
    });
    dispatch_group_async(group, queue, ^{
        
        NSLog(@"下载电影2: xxx.avi");
        
    });
    
    dispatch_group_async(group, queue, ^{
        
        NSLog(@"下载电影3: xxx.avi");
        
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"都下载完成 --> 可以弹出提示提示用户 %@", [NSThread currentThread]);
        
    });
    
    NSLog(@"end");
}

@end
