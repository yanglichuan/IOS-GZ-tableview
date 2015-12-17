//
//  CZHero.m
//  A03-Lol
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZHero.h"

@implementation CZHero
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)heroWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)herosList
{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        CZHero *hero = [CZHero heroWithDic:dic];
        [tmpArray addObject:hero];
    }
    return tmpArray;
}
@end
