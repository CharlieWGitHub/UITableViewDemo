//
//  JTDataSource.h
//  UITableViewDemo
//
//  Created by 王成龙 on 2018/11/27.
//  Copyright © 2018 CL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellModel.h"

typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath * indexPath);

NS_ASSUME_NONNULL_BEGIN

@interface JTDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)  NSMutableArray *dataArray;;

//自定义
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

//sb
@property (nonatomic, strong)NSString *cellIdentifier;

@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;


- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
