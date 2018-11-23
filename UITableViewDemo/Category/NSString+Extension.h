//
//  NSString+Extension.h
//  PostLoan
//
//  Created by 彭昭君 on 2017/10/24.
//  Copyright © 2017年 sdjt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 *  判断姓名是否合法
 */
-(BOOL)isNameValid;

/**
 *  手机号码的正则表达式
 *  @return 是否是手机号
 */
-(BOOL)isValidateMobile;

/**
 *  手机号格式化
 *  @return 返回344样式手机号
 */
-(NSString *)MobilePhoneFormat;

/**
 *  银行卡卡号格式化
 */
-(NSString *)bankCardNumberFormat;

/**
 返回密码形式的手机号134****1234
 @return 加密之后的手机号
 */
-(NSString *)mobilePhoneNumberEncryption;

/**
 *  判断字符串是否为空
 *  created by pzj
 */
-(BOOL)isEmptyStr;

/**
 * 清除字符串中空格
 * @return 无空格的string
 */
- (NSString *)clearSpace;

/**
 * 清除字符串中—
 * @return 无—的string
 */
- (NSString *)clearSpecLine;

/**
 * 清除字符串中 string
 * @return 无 string 的string
 */
- (NSString *)clearSpeceStr:(NSString *)string;

//邮箱地址的正则表达式
/**
 验证邮箱地址
 
 @return YES or NO
 */
-(BOOL)isValidateEmail;

/**
 验证密码输入规则
 
 @return YES or NO
 */
-(BOOL)isPasswordFormat;

/**
 判断字符串是否相同
 
 @return YES or NO
 */
-(BOOL)isString:(NSString *)str;

/**
 判断是否是url
 
 @return YES or NO
 */
-(BOOL)isUrlString;

/**
 label 图文混排
 
 creat by pzj
 @param image 本地图片
 @param frame 图片frame
 @param isHeader 图片在文字前 or 后
 @return NSAttributedString
 */
- (NSMutableAttributedString *)getAttributeWithImage:(NSString *)image
                                          imageFrame:(CGRect)frame
                                            isHeader:(BOOL)isHeader;
/**
 * 计算文字高度，可以处理计算带行间距的等属性
 */
- (CGSize)boundingRectWithSize:(CGSize)size paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle font:(UIFont*)font;
/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing;
/**
 * 计算最大行数文字高度，可以处理计算带行间距的
 */
- (CGFloat)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines;

/**
 *  计算是否超过一行
 */
- (BOOL)isMoreThanOneLineWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing;

/**
 * 返回URL
 */
- (NSString *)  createUrlWithID:(NSString *) ID;

@end
