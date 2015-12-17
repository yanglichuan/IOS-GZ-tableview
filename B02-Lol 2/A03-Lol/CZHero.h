//
//  CZHero.h
//  A03-Lol
//
//  Created by Apple on 14/12/17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHero : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSString *name;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)heroWithDic:(NSDictionary *)dic;

+ (NSArray *)herosList;
@end
