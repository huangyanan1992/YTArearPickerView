//
//  YTProvinceModel.h
//  YiTong
//
//  Created by Huang Yanan on 16/7/15.
//  Copyright © 2016年 YiTong. All rights reserved.
//

#import "YTArearBaseModel.h"
#import "YTCityModel.h"

@interface YTProvinceModel : YTArearBaseModel

@property (nonatomic,strong)NSArray<YTCityModel,Optional> *city;

@end

@protocol YTProvinceModel <NSObject>

@end
