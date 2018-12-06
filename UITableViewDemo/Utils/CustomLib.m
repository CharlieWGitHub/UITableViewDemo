//
//  CustomLib.m
//  PostLoan
//
//  Created by 彭昭君 on 2017/11/7.
//  Copyright © 2017年 sdjt. All rights reserved.
//

#import "CustomLib.h"
#import <AVFoundation/AVFoundation.h>
#import <AdSupport/ASIdentifierManager.h>
#import "sys/utsname.h"
//#import "JTBaseTabBarController.h"

@implementation CustomLib

+(NSString *)convertToJsonData:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
//    [mutStr replaceOccurrencesOfString:@" " withString:@" " options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}
/**
 字典转json字符串

 @param parameters 字典（参数）
 @return json字符串
 */
+ (NSString *)createJsonStringFromID:(id)parameters
{
    NSString * jsonString = nil;
    if ([parameters isKindOfClass:[NSDictionary class]])
    {
        NSError *errorJ;
        NSData * diccData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&errorJ];
        if (!diccData) {
            NSLog(@"%@",errorJ);
        } else {
            jsonString = [[NSString alloc] initWithData:diccData encoding:NSUTF8StringEncoding];
        }
        
    }else if ([parameters isKindOfClass:[NSObject class]]) {
        
        jsonString = [parameters JSONString];
    }
    return jsonString;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
#pragma mark - 时间转化
//获取当前时间戳
+ (NSString *)getTimeStamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}
//时间戳转时间
+ (NSString *)getStampChangeToDate:(NSString *)stamp
{

    NSTimeInterval interval = stamp.length>11? [stamp doubleValue]/1000: [stamp doubleValue];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate:confromTimesp];
//    NSLog(@"confromTimespStr =  %@",dateString);
    return dateString;
}
/**
 时间戳转时间
 */
+ (NSString *)getStampChangeToDate:(NSString *)stamp formatter:(NSString *)formatterStr{
#pragma mark 时间戳问题 - 后台返回的是1970 '毫秒数'
    
    NSTimeInterval interval = stamp.length>11?[stamp doubleValue]/1000:[stamp doubleValue];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    NSString *dateString = [formatter stringFromDate:confromTimesp];
//    NSLog(@"---confromTimespStr =  %@",dateString);
    return dateString;
}
/**
 将某个时间转化成 时间戳
 */
+ (NSString *)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:format];
    
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    //    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSDate* datenow = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}

//字符串转时间戳 如：2017.4.10
+ (NSString *)getTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY.MM.dd"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:str];//将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]*1000];//字符串转成时间戳,精确到毫秒*1000
    return timeStr;
}

/**
 html返回的url 反编码
 */
+ (NSString *)formatUrl:(NSString *)htmlUrl
{
    if (![htmlUrl isEmptyStr]) {
        NSString *str = [htmlUrl stringByReplacingOccurrencesOfString:@"amp;" withString:@""];
        return str;
    }else{
        return htmlUrl;
    }
}

/**
 判断输入是否为纯数字
 */
+(BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**
 身份证号码
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard{
    BOOL flag;
    if (identityCard.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:identityCard];
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(identityCard.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[identityCard substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [identityCard substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else{
                    flag =  NO;
                    return flag;
                }
            }else{
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }else{
                    flag =  NO;
                    return flag;
                }
            }
        }else{
            flag =  NO;
            return flag;
        }
    }else{
        return flag;
    }
}

/**
 html文本展示
 */
+ (NSAttributedString *)getHtmlStr:(NSString *)htmlStr
{
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return attrStr;
}

/**
 获取app版本号
 */
+ (NSString *)getAppVersionMethod
{
    // app版本
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

/**
 *  获取手机系统版本
 *  @return e.g. 8.0
 */
+ (NSString *)getPhoneVersionMethod
{
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    return phoneVersion;
}

/**
 获取手机型号
 */
+ (NSString *)getPhoneModelMethod
{
    NSString* phoneModel = [[UIDevice currentDevice] model];
    return phoneModel;
}

/**
 *  设备版本
 *
 *  @return e.g. iPhone 5S
 */
+ (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine
                                               encoding:NSUTF8StringEncoding];
    
    // 模拟器
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    
    // iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
//    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
//    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA/Verizon/Sprint)";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])    return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone10,6"])    return @"iPhone X";
//    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
//    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
//    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
//    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
//    if ([deviceModel isEqualToString:@"iPhone10,1"])    return @"iPhone 8 (CDMA)";
//    if ([deviceModel isEqualToString:@"iPhone10,4"])    return @"iPhone 8 (GSM)";
//    if ([deviceModel isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus (CDMA)";
//    if ([deviceModel isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus (GSM)";
//    if ([deviceModel isEqualToString:@"iPhone10,3"])    return @"iPhone X (CDMA)";
//    if ([deviceModel isEqualToString:@"iPhone10,6"])    return @"iPhone X (GSM)";
    
    // iPod 系列
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([deviceModel isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    
    // iPad 系列
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini";
    
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4";
//    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
//    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
//    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
//    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
//
//    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
//    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
//    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
//    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
//    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
//    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad PRO (12.9)";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad PRO (12.9)";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad PRO (9.7)";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad PRO (9.7)";
    if ([deviceModel isEqualToString:@"iPad6,11"])      return @"iPad 5";
    if ([deviceModel isEqualToString:@"iPad6,12"])      return @"iPad 5";
    
    if ([deviceModel isEqualToString:@"iPad7,1"])      return @"iPad PRO 2 (12.9)";
    if ([deviceModel isEqualToString:@"iPad7,2"])      return @"iPad PRO 2 (12.9)";
    if ([deviceModel isEqualToString:@"iPad7,3"])      return @"iPad PRO (10.5)";
    if ([deviceModel isEqualToString:@"iPad7,4"])      return @"iPad PRO (10.5)";
    
    return deviceModel;
}

/**
 手机别名
 @return NSString
 */
+(NSString *)phoneName
{
    return [[UIDevice currentDevice] name];
}

/**
 广告标识符(现在作为设备为码)
 */
+ (NSString *)getPhoneIdentifierForAdvertisingMethod
{
    NSString *identifierForAdvertising = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return identifierForAdvertising;
}

///**
// tabBar隐藏于展示
// */
//+ (void)hidTabBar:(BOOL)isHidden vc:(UIViewController *)vc
//{
//    JTBaseTabBarController *tbvc = (JTBaseTabBarController *) self.t
//    JTBaseTabBarController *tbvc = (JTBaseTabBarController *)self.tabBarController;
//    tbvc.tabBar.hidden = isHidden;
//}

/**
 tabBar隐藏于展示
 */
//+ (void)hidTabBar:(BOOL)isHidden tbvc:(UITabBarController *)tbvc
//{    
//    JTBaseTabBarController *t = (JTBaseTabBarController *)tbvc;
//    t.tabBar.hidden = isHidden;
//}
+ (void )bezierPathWith:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadi
{
    //设置所需的圆角位置以及大小
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:cornerRadi];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
  
}

+(BOOL)isStringNull:(NSString *)aString{
    if (!aString) {
        return YES;
    }
    if ([aString isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!aString.length) {
        return YES;
    }
    if ([aString isEqualToString:@"(null)"]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aString stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}
+ (NSAttributedString *)changeLabelWithColor:(NSString *)text colorText:(NSString *)needText color:(UIColor *)color
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange range = [text rangeOfString:needText];
    [attrString addAttribute:NSForegroundColorAttributeName value:color range:range];
    return (NSAttributedString *)attrString;
}

/**
 *  UIView 转成 UIImage
 */
+ (UIImage*)imageFromView:(UIView*)view{
//    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
//    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO , [UIScreen mainScreen].scale);
//    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
    
    
    CGSize s = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

/**
 校验密码合理性

 @param password 输入密码
 @return 是否合格
 */
+ (BOOL)clCheckPassWord:(NSString*)password
{   //6-16位数字和字母组成
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:password]) {
        return YES ;
    }else
        return NO;
}

+(float)measureMutilineStringHeight:(NSString*)str andFont:(UIFont*)wordFont andWidthSetup:(float)width{
    
    if (str == nil || width <= 0) return 0;
    
    CGSize measureSize;
    
    measureSize = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:wordFont, NSFontAttributeName, nil] context:nil].size;
    
    return ceil(measureSize.height);
    
}


+(float)measureSinglelineStringWidth:(NSString*)str andFont:(UIFont*)wordFont{
    
    if (str == nil) return 0;
    
    CGSize measureSize;
        
    measureSize = [str boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:wordFont, NSFontAttributeName, nil] context:nil].size;
    
    return ceil(measureSize.width);
    
}


@end
