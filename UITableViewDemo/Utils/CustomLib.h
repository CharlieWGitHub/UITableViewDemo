//
//  CustomLib.h
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/7.
//  Copyright © 2017年 sdjt. All rights reserved.
//

/**
 * 自定义通用方法类
 */
#import <Foundation/Foundation.h>

@interface CustomLib : NSObject

+(NSString *)convertToJsonData:(NSDictionary *)dict;

/**
 字典转json字符串
 @param parameters 字典（参数）
 @return json字符串
 */
+ (NSString *)createJsonStringFromID:(id)parameters;
#pragma mark - 时间转化
/**
 获取当前时间戳
 */
+ (NSString *)getTimeStamp;
/**
 时间戳转时间
 */
+ (NSString *)getStampChangeToDate:(NSString *)stamp;
/**
 时间戳转时间
 */
+ (NSString *)getStampChangeToDate:(NSString *)stamp formatter:(NSString *)formatterStr;
/**
 将某个时间转化成 时间戳
 */
+ (NSString *)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
//字符串转时间戳 如：2017.4.10
+ (NSString *)getTimeStrWithString:(NSString *)str;

/**
 html返回的url 反编码
 */
+ (NSString *)formatUrl:(NSString *)htmlUrl;

/**
 判断输入是否为纯数字
 */
+(BOOL)isPureInt:(NSString*)string;

/**
 身份证号码
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

/**
 html文本展示
 */
+ (NSAttributedString *)getHtmlStr:(NSString *)htmlStr;

/**
 获取app版本号
 */
+ (NSString *)getAppVersionMethod;

/**
 获取手机系统版本
 */
+ (NSString *)getPhoneVersionMethod;

/**
 *  获取手机型号
 *  @return e.g. iPhone
 */
+ (NSString *)getPhoneModelMethod;

/**
 *  设备版本
 *
 *  @return e.g. iPhone 5S
 */
+ (NSString*)deviceVersion;

/**
 手机别名
 @return NSString
 */
+(NSString *)phoneName;

/**
 广告标识符(现在作为设备为码)
 */
+ (NSString *)getPhoneIdentifierForAdvertisingMethod;

/**
 tabBar隐藏于展示
 */
//+ (void)hidTabBar:(BOOL)isHidden tbvc:(UITabBarController *)tbvc;

/**
 view设置不同位置圆角
 */
+ (void )bezierPathWith:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadi;

/**
 判断字符串是否为空
 
 @param aString 待判断的是字符串数据
 @return 是否
 */
+ (BOOL)isStringNull:(NSString*)aString;

/**
 *  修改不同颜色字体
 *
 *  @param text     全部字符
 *  @param needText 需要变颜色的字符
 *  @param color    颜色
 *
 *  @return 字符串
 */
+ (NSAttributedString *) changeLabelWithColor:(NSString *)text colorText:(NSString *)needText color:(UIColor *)color;


+ (UIImage*)imageFromView:(UIView*)view;

/**
 校验密码合理性

 @param password 输入密码
 @return 是否合理
 */
+ (BOOL)clCheckPassWord:(NSString*)password;

+(float)measureMutilineStringHeight:(NSString*)str andFont:(UIFont*)wordFont andWidthSetup:(float)width;

+(float)measureSinglelineStringWidth:(NSString*)str andFont:(UIFont*)wordFont;

@end
