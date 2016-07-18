//
//  ViewController.m
//  YTArearPickerView
//
//  Created by Huang Yanan on 16/7/18.
//  Copyright © 2016年 Huang Yanan. All rights reserved.
//

#import "ViewController.h"
#import "YTArearPickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)buttonAction:(UIButton *)sender {
    YTArearPickerView *arearPickerView = [YTArearPickerView arearPickerView];
    [arearPickerView showArearPickerView];
    [arearPickerView setArearBlock:^(NSString *arearStr,NSString *zipCode) {
        NSLog(@"address:%@,zipCode:%@",arearStr,zipCode);
        [sender setTitle:arearStr forState:UIControlStateNormal];
    }];
}

@end
