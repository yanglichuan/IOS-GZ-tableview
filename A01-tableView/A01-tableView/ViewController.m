//
//  ViewController.m
//  A01-tableView
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1 设置tableView的数据源
    self.tableView.dataSource = self;
}


#pragma mark - 数据源方法
//返回总共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numberOfSectionsInTableView");
    return 2;
}

//返回每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection-%ld",section);
    if (section == 0) {
        //第一组
        return 3;
    }else{
        //第二组
        return 2;
    }
}
//返回当前行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath-%ld-%ld",indexPath.section,indexPath.row);

    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (indexPath.section == 0) {
        //第一组
        if (indexPath.row == 0) {
            //第一组  第一行
            cell.textLabel.text = @"德山";
        }else if(indexPath.row == 1){
            //第一组  第2行
            cell.textLabel.text = @"德刚";
        }else{
            //第一组  第3行
            cell.textLabel.text = @"房shi疼";
        }
    }else{
        //第二组
        if(indexPath.row == 0){
            cell.textLabel.text = @"赵晓猫";
        }else{
            cell.textLabel.text = @"史尚飞";
        }
    }

    return cell;
}
//返回头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"一班";
    }else{
        return @"二班";
    }
}
//返回尾部的描述
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return @"一般的人";
    }else{
        return @"不一般的人";
    }
}



@end
