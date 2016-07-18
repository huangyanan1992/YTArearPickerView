//
//  YTCityModel.h
//  YiTong
//
//  Created by Huang Yanan on 16/7/15.
//  Copyright © 2016年 YiTong. All rights reserved.
//

#import "YTArearBaseModel.h"
#import "YTTownModel.h"

@interface YTCityModel : YTArearBaseModel

@property (nonatomic,strong)NSArray<YTTownModel,Optional> *district;

@end

@protocol YTCityModel <NSObject>

@end
