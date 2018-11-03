//
//  GPTableViewManager.h
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class GPTableViewManager, GPTableViewCell, GPTableViewRowManager, GPTableViewSectionManager;

@protocol GPTableViewManagerDelegate <NSObject>

@optional

/** 设置模型数据源 */
- (void)tableViewDataSource:(GPTableViewManager *)manager;
/** 滚动 */
- (void)tableViewDidScroll:(UITableView *)tableView;
/** 结束滚动 */
- (void)tableViewDidEndScroll:(UITableView *)tableView;

- (void)tableViewDidEndDragging:(UITableView *)tableView willDecelerate:(BOOL)decelerate;

- (void)tableViewWillEndDragging:(UITableView *)tableView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;

@end


@interface GPTableViewManager : NSObject

@property (nonatomic, weak) id <GPTableViewManagerDelegate> delegate;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, readonly, strong) NSArray *sections;


/** 初始化方法 */
- (instancetype)initWithTableView:(UITableView *)tableView;

/** 初始化方法 有代理 */
- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<GPTableViewManagerDelegate>)delegate;


/** 添加 section */
- (void)addSection:(GPTableViewSectionManager *)section;

/** 添加section到 指定位置 */
- (void)insertSection:(id)section atIndex:(NSInteger)index ;
/** 删除指定的section */
- (void)deleteSectionAtIndex:(NSInteger)index ;
/** 替换指定的section */
- (void)replaceSectionsAtIndex:(NSInteger)index withSection:(id)section;

/** 清掉所有 section */
- (void)removeAllSections;


/** 刷新 tableView */
- (void)reloadTableView;
/** 刷新 tableView section */
- (void)reloadSection:(GPTableViewSectionManager *)section atIndex:(NSInteger)index;

@end
