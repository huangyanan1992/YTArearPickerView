//
//  YTArearPickerView.m
//  SelectCity
//
//  Created by Huang Yanan on 16/7/14.
//  Copyright © 2016年 Huang Yanan. All rights reserved.
//

#import "YTArearPickerView.h"
#import "YTArearModel.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface YTArearPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
//data
@property (strong, nonatomic) NSArray<YTProvinceModel *> *provinceArray;
@property (strong, nonatomic) NSArray<YTCityModel *> *cityArray;
@property (strong, nonatomic) NSArray<YTTownModel *> *townArray;

@property (strong,nonatomic) NSMutableArray *dataArray;


@end

@implementation YTArearPickerView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self loadData];
}

+ (YTArearPickerView *)arearPickerView {
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    for (id obj in array) {
        if ([obj isKindOfClass:[YTArearPickerView class]]) {
            return obj;
        }
    }
    return nil;
}

- (void)showArearPickerView {
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight);
    }];
}

- (void)loadData {
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"province" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    NSDictionary *pickerDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSError *error = nil;
    YTArearModel *arearModel = [[YTArearModel alloc] initWithDictionary:pickerDic error:&error];
    NSLog(@"%@",error);
    
    self.provinceArray = arearModel.province;
    YTProvinceModel *province = self.provinceArray[0];
    self.cityArray = province.city;
    
    YTCityModel *city = self.cityArray[0];
    self.townArray = city.district;
    
    self.dataArray = [NSArray arrayWithObjects:self.provinceArray,self.cityArray,self.townArray, nil].mutableCopy;
    [self.pickerView reloadAllComponents];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.dataArray.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return ((NSArray *)(self.dataArray[component])).count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return ((YTArearBaseModel *)self.dataArray[component][row]).name;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.cityArray = self.provinceArray[row].city;
        self.dataArray[1] = self.cityArray;
        
        self.townArray = self.cityArray[0].district;
        self.dataArray[2] = self.townArray;
        
        [self.pickerView reloadComponent:1];
        [self.pickerView reloadComponent:2];
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        [self.pickerView selectRow:0 inComponent:2 animated:YES];
    }
    else if (component == 1) {
        self.townArray = self.cityArray[row].district;
        self.dataArray[2] = self.townArray;
        
        [self.pickerView reloadComponent:2];
        [self.pickerView selectRow:0 inComponent:2 animated:YES];
    }
    
    
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    [self dismiss];
}

- (IBAction)cancleAction:(UIButton *)sender {
    [self dismiss];
}

- (IBAction)ensureAction:(UIButton *)sender {
    NSInteger provinceRow = [self.pickerView selectedRowInComponent:0];
    NSInteger cityRow = [self.pickerView selectedRowInComponent:1];
    NSInteger townRow = [self.pickerView selectedRowInComponent:2];
    
    NSString *arearStr = [NSString stringWithFormat:@"%@%@%@",self.provinceArray[provinceRow].name,self.cityArray[cityRow].name,self.townArray[townRow].name];
    if (self.ArearBlock) {
        self.ArearBlock(arearStr,self.townArray[townRow].zipcode);
    }
    [self dismiss];
    
}





@end
