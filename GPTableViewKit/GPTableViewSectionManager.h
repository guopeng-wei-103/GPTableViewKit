//
//  GPTableViewSectionManager.h
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GPTableViewRowManager, GPTableViewSHeaderManager;

@interface GPTableViewSectionManager : NSObject

@property (nonatomic, readonly, strong) NSArray *rows;


/** header */
@property (nonatomic, strong) GPTableViewSHeaderManager *header;


/*!
 @brief 初始化section类
 */
+ (instancetype)section;


/*!
 @brief 添加row
 */
- (void)addRow:(id)row;

/*!
 @brief 添加分割row
 */
- (void)addSeparateRowHeight:(CGFloat)height color:(UIColor *)color;

/*!
 @brief 添加分割row
 */
- (void)addSeparateRowHeight:(CGFloat)height color:(UIColor *)color leftMargin:(CGFloat)left rightMargin:(NSInteger)right;


/*!
 @brief 在指定行插入row
 */
- (void)insertRow:(id)row atIndex:(NSInteger)index;


/*!
 @brief 删除指定行
 */
- (void)deleteRowAtIndex:(NSInteger)index;


/**
 提供一个 GPTableViewRowManager 模型

 @param height 高度
 @param color 颜色
 @param left 左边距
 @param right 右边距
 @return rowModel
 */
+ (GPTableViewRowManager *)separateRowModelWithHeight:(CGFloat)height color:(UIColor *)color leftMargin:(CGFloat)left rightMargin:(NSInteger)right;

@end
