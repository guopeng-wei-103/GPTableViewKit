//
//  GPTableViewRowManager.h
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GPTableViewRowManager;

typedef void(^didSelectRowBytitle)(GPTableViewRowManager *row, NSString *title);

@interface GPTableViewRowManager : NSObject

/** 行高 */
@property (nonatomic, assign) CGFloat rowHeight;

/** cell名 */
@property (nonatomic, copy) NSString *cellName;

/** reuseIdentifier，default is cellName */
@property (nonatomic, copy) NSString *reuseIdentifier;

/** 选定样式 default none*/
@property (nonatomic, assign) UITableViewCellSelectionStyle selectStyle;

/** 模型 */
@property (nonatomic, strong) id model;
/** 备用模型 */
@property (nonatomic, strong) id subModel;
/** 其他模型(-_^) */
@property (nonatomic, strong) id otherModel;
/** title (字符串flag) */
@property (nonatomic, copy) NSString *title;
/** 整型 flag */
@property (nonatomic, assign) NSInteger flag;
/** 选择 (bool flag) */
@property (nonatomic, assign) BOOL selected;

/** editTitle */
@property (nonatomic, strong, readonly) NSArray *editingStyles;
- (void)addEditingTitle:(NSString *)title bgColor:(UIColor *)bgColor;

/** 点击事件 indexPath*/
@property (nonatomic, copy) void (^didSelectRow) (void);
/** 点击事件 index */
@property (nonatomic, copy) void (^didSelectRowAtIndex) (NSInteger index);
/** 点击事件 indexPath*/
@property (nonatomic, copy) void (^didSelectRowAtIndexPath) (NSIndexPath *indexPath);
/** 点击事件 data index */
@property (nonatomic, copy) void (^didCallBackWithDataAndIndex) (GPTableViewRowManager *row, id data, NSInteger index);

/** 点击事件 index */
@property (nonatomic, copy) BOOL (^ifCanSelectRowAtIndex) (NSInteger index);

/** 编辑 */
@property (nonatomic, copy) void (^didEditRow) (NSInteger index);

/** 初始化类方法 */
+ (instancetype)row;


@end
