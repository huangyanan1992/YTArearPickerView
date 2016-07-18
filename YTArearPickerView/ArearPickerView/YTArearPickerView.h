//
//  YTArearPickerView.h
//  SelectCity
//
//  Created by Huang Yanan on 16/7/14.
//  Copyright © 2016年 Huang Yanan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTArearPickerView : UIView

@property (nonatomic,copy)void (^ArearBlock)(NSString *arearStr,NSString *zipCode);

+ (YTArearPickerView *)arearPickerView;

- (void)showArearPickerView;
@end
