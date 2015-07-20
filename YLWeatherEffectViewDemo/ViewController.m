//
//  ViewController.m
//  YLWeatherEffectViewDemo
//
//  Created by 肖 玉龙 on 15/3/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "ViewController.h"
#import "YLWeatherEffectView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    YLWeatherEffectView *weatherView = [[YLWeatherEffectView alloc] initWithFrame:self.view.bounds weatherType:YLWeatherEffectViewTypeRainy NightTime:NO];
    [self.view addSubview:weatherView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
