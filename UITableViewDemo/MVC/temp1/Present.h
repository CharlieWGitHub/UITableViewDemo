//
//  Present.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/28.
//  Copyright © 2018 CL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol clPresenterDelegate <NSObject>

@optional
/*
 * 动态cell的一些处理
 */
//展开当前的cell
- (void)didClickIsShow:(NSIndexPath*)indexPath;


//刷新数据
- (void)reloadNewData;

@end

@interface Present : NSObject<clPresenterDelegate>

@property (nonatomic ,strong)NSMutableArray * dataArray;
@property (nonatomic ,weak) id<clPresenterDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
