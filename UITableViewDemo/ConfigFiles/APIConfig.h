//
//  APIConfig.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/21.
//  Copyright © 2018 CL. All rights reserved.
//

#ifndef APIConfig_h
#define APIConfig_h

#define H5IP @"http://47.92.54.37:9090/oms/html5/notes"//张学鹏
#define IP   @"http://47.92.54.37:9090/oms"//张学鹏

#define URL_ID  @"{id}"

//登陆
#define JT_Url_Login                  IP"/v1/auth"//登录

//机构圈
#define JT_Url_OrgAgencyCircle         IP"/v1/org/agency/circle"       //机构圈：首页

#define JT_Url_OrgAgencyCircleDynamicDianZan         IP"/v1/org/agency/circle/dynamic/fabulous"       //机构圈：动态点赞
#define JT_Url_OrgAgencyCircleDynamicPinLun          IP"/v1/org/agency/circle/dynamic/comment"       //机构圈：动态评论



#endif /* APIConfig_h */
