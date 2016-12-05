//
//  BaseModel.h
//  YuanChenKeeper
//
//  Created by Yhoon on 16/1/27.
//  Copyright © 2016年 com.Qingye.YuanChenKeeper. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BaseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *PHPSESSID;

/**
 *  字典转模型
 *
 *  @param data 数据字典
 *
 *  @return 数据模型
 */
+ (id)modelFromDictionary:(NSDictionary *)data;

/**
 *  数组转模型数组
 *
 *  @param array 数组
 *
 *  @return 模型数组
 */
+ (id)modelsFromArray:(NSArray *)array;

/**
 *  模型转字典
 *
 *  @return 数据字典
 */
- (NSDictionary *)transformToDictionary;

@end
