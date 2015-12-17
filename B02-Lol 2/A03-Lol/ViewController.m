//
//  ViewController.m
//  A03-Lol
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZHero.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (nonatomic, strong) NSArray *heroes;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

//1 懒加载
- (NSArray *)heroes
{
    if (_heroes == nil) {
        _heroes = [CZHero herosList];
    }
    return _heroes;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //2 测试数据
    
    //通过连线设置数据源
//    self.tableView.dataSource = self;
    
    //设置行高
//    self.tableView.rowHeight = 60;
    
    //设置分割线
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.tableView.separatorColor = [UIColor redColor];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //自定义tableView的头和尾
//    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    //
//    self.tableView.backgroundColor = [UIColor redColor];
    
    
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor yellowColor];
//    self.tableView.backgroundView = view;
    
}

//3 实现数据源的方法
#pragma mark - 数据源方法
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建cell
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //从缓存池中取可用的cell
    static NSString *reuseId = @"hero";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    
  
    //2 给cell内部的子控件赋值
    //获取数据
    CZHero *hero = self.heroes[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    
    
    //设置cell背景透明
//    cell.backgroundColor = [UIColor clearColor];
    
    
    
    //设置cell的附属物
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //自定义cell的附属物
    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    //设置详细内容label的属性
//    cell.detailTextLabel.numberOfLines = 0;
    
    
    //3 返回cell
    return cell;
}

#pragma mark - tableView的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row % 2 == 0) {
//        return 60;
//    }else{
//        return 100;
//    }
    return 60;
}

//当选中cell的时候执行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选中行对应的数据
    CZHero *hero = self.heroes[indexPath.row];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    //给alertView中得文本框赋值
    [alertView textFieldAtIndex:0].text = hero.name;
    
    //记录当前行号
    alertView.tag = indexPath.row;
    
    //
    [alertView show];
    
}

#pragma mark - alertView的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //点击了确定按钮
    if (buttonIndex == 1) {
        //获取到修改后的名称
        NSString *name = [alertView textFieldAtIndex:0].text;
        
        CZHero *hero = self.heroes[alertView.tag];
        hero.name = name;
        
        
        //重新加载tableView
//        [self.tableView reloadData];
        
        //重新加载指定行
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
        
        
        //[self.tableView.reloadData];
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
//        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//        cell.textLabel.text = name;
    }
}





@end
