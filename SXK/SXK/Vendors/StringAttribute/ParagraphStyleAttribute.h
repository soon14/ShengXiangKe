//
//  ParagraphStyleAttribute.h
//  HYStringAttribute
//
//  Created by HEYANG on 15/11/22.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "StringAttribute.h"

@interface ParagraphStyleAttribute : StringAttribute

/** 段落样式 */
@property (nonatomic,strong)NSMutableParagraphStyle *style;

@end
