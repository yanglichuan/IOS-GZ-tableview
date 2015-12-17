//
//  ViewController.m
//  A02-汽车品牌
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZCarGroup.h"
@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tabeView;

@property (nonatomic, strong) NSArray *carGroups;
@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

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
//    NSLog(@"%@",self.carGroups);
    
    //3 设置数据源
    self.tabeView.dataSource = self;
}

//4 实现数据源的方法
#pragma mark - 数据源的方法
// 返回多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}
//返回每一组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CZCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}
//返回每一行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建cell
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    //2 给cell内部的子控件赋值
    CZCarGroup *carGroup = self.carGroups[indexPath.section];
    
    cell.textLabel.text = carGroup.cars[indexPath.row];
    
    //3 返回cell
    return cell;
}
//分组的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CZCarGroup *carGroup = self.carGroups[section];
    return carGroup.title;
}

//分组的尾部描述
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    CZCarGroup *carGroup = self.carGroups[section];
//    return carGroup.desc;
//}

@end
