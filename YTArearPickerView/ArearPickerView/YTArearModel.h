//
//  YTArearModel.h
//  YiTong
//
//  Created by Huang Yanan on 16/7/15.
//  Copyright © 2016年 YiTong. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "YTProvinceModel.h"

@interface YTArearModel : JSONModel

@property (nonatomic,strong)NSArray<YTProvinceModel,Optional> *province;

@end
