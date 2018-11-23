//
//  NSDictionary+Extension.h
//  PostLoan
//
//  Created by 彭昭君 on 2017/10/24.
//  Copyright © 2017年 sdjt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

/**
 * json 字符串 转 字典
 */
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+(NSDictionary *)attributesForUserTextWithlineHeightMultiple:(CGFloat)multiple;

@end
