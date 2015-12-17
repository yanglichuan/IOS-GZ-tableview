//
//  ViewController.m
//  B01-汽车分组升级
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZCar.h"
#import "CZCarGroup.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *carGroups;
@end

@implementation ViewController

//1 懒加载
- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        _carGroups = [CZCarGroup carGroupsList];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //2 测试数据
    
    //3 连线设置数据源
    //4 让controller遵守数据源协议
}

//5 实现数据源的方法
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //共多少组
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //
    CZCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建可重用cell对象
    static NSString *reuseId = @"car";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    //2 给cell内部的子控件赋值
    //
    CZCarGroup *carGroup = self.carGroups[indexPath.section];

    cell.textLabel.text = [carGroup.cars[indexPath.row] name];
    cell.imageView.image = [UIImage imageNamed:[carGroup.cars[indexPath.row] icon]];
    
    
    //3 返回cell
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    CZCarGroup *carGroup = self.carGroups[section];
//    return carGroup.title;
    return [self.carGroups[section] title];
}
//返回组的索引标题
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //kvc
    return [self.carGroups valueForKeyPath:@"title"];

}


@end
