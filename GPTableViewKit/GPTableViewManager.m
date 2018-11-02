//
//  GPTableViewManager.m
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import "GPTableViewManager.h"
#import "GPTableView.h"

@interface GPTableViewManager ()<UITableViewDelegate, UITableViewDataSource>
/** section info */
@property (nonatomic, strong) NSMutableArray *sectionArray;
@end


@implementation GPTableViewManager

- (instancetype)initWithTableView:(UITableView *)tableView; {
    self = [super init];
    if (self) {
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        
        _sectionArray = [[NSMutableArray alloc]init];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {

        }
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.contentOffset = CGPointMake(0, -_tableView.contentInset.top);

    }
    return self;
}

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<GPTableViewManagerDelegate>)delegate; {
    
    self = [self initWithTableView:tableView];
    if (self) {
        _delegate = delegate;
    }
    return self;
    
}

- (NSArray *)sections {
    return _sectionArray;
}

#pragma mark 增／删/改  section
- (void)addSection:(GPTableViewSectionManager *)section; {
    
    [_sectionArray addObject:section];
    
}
- (void)insertSection:(id)section atIndex:(NSInteger)index {
    
    if (index<0 || index>_sectionArray.count) NSLog(@"index:%ld 超出当前section的范围\n已自动取就近索引",(long)index);
    
    index = index<0?0:index;
    index = index > _sectionArray.count?_sectionArray.count:index;
    
    [_sectionArray insertObject:section atIndex:index];
}

- (void)deleteSectionAtIndex:(NSInteger)index {
    
    if (index < 0 || index >= _sectionArray.count || _sectionArray.count == 0) {
        NSLog(@"index:%ld 超出当前section的范围\n已自动取就近索引",(long)index);
        return;
    }
    [_sectionArray removeObjectAtIndex:index];
}
- (void)replaceSectionsAtIndex:(NSInteger)index withSection:(id)section {
    [_sectionArray replaceObjectAtIndex:index withObject:section];
    [self.tableView reloadData];
}

- (void)removeAllSections; {
    [self.sectionArray removeAllObjects];
}

#pragma mark 刷新
- (void)reloadTableView; {
    
    if ([self.delegate respondsToSelector:@selector(tableViewDataSource:)]) {
        [self removeAllSections];
        [self.delegate tableViewDataSource:self];
    }
    
    [self.tableView reloadData];
}
- (void)reloadSection:(GPTableViewSectionManager *)section atIndex:(NSInteger)index; {
    
    if (self.sections.count > index) {
        [self replaceSectionsAtIndex:index withSection:section];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        NSLog(@"section：%ld不存在",(long)index);
    }
}



#pragma mark  - >> 获取cell <<
- (id)getCell:(NSString *)cell {

    if (cell.length == 0) {
        return nil;
    } else {
        for (int i = 0; i < self.sections.count; i++) {
            GPTableViewSectionManager *sectionModel = self.sections[i];
            for (int j = 0; j < sectionModel.rows.count; j++) {
                GPTableViewRowManager *rowModel = sectionModel.rows[j];
                if ([cell isEqualToString:rowModel.cellName]) {
                    return [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
                }
            }

        }
    return nil;
    }
}


#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    if (indexPath.section >= self.sections.count) {
        NSLog(@"\n -------- \n tableView error \n -------- \n");
        return 0;
    }
    GPTableViewSectionManager *sectionModel = self.sections[indexPath.section];
    GPTableViewRowManager *rowModel = sectionModel.rows[indexPath.row];
    
    return rowModel.rowHeight;
}

#pragma mark  - >> edit <<

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    if (indexPath.section >= self.sections.count) {
        NSLog(@"\n -------- \n tableView error \n -------- \n");
        return UITableViewCellEditingStyleNone;
    }
    
    GPTableViewSectionManager *sectionModel = self.sections[indexPath.section];
    GPTableViewRowManager *rowModel = sectionModel.rows[indexPath.row];
    
    return rowModel.editingStyle;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section >= self.sections.count) {
        return nil;
    }
    
    GPTableViewSectionManager *sectionModel = self.sections[indexPath.section];
    GPTableViewRowManager *rowModel = sectionModel.rows[indexPath.row];
    
    if (rowModel.editingStyle != UITableViewCellEditingStyleDelete) {
        return nil;
    } else {
        UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:rowModel.editingTitle handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            if (rowModel.didEditRow) {
                rowModel.didEditRow(rowModel);
            }
        }];
        action.backgroundColor = [UIColor redColor];
        return @[action];
    }
}

#pragma mark DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; {

    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    
    if (section >= self.sections.count) {
        return 0;
    }
    
    GPTableViewSectionManager *sectionModel = self.sections[section];
    return sectionModel.rows.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    GPTableViewRowManager *rowModel = nil;
    if (indexPath.section < self.sections.count) {
        
        GPTableViewSectionManager *sectionModel = self.sections[indexPath.section];
        rowModel = sectionModel.rows[indexPath.row];
    } else {
        NSLog(@"\n -------- \n tableView error \n -------- \n");
    }

    NSString *identifier = @"GPTableViewCell";
    if (rowModel.reuseIdentifier.length) {
        identifier = rowModel.reuseIdentifier;
    } else if (rowModel.cellName.length) {
        identifier = rowModel.cellName;
    }
    
    GPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    Class cellClass = NSClassFromString(rowModel.cellName);
    if (!cell) {
        
        cell = [[cellClass?:[GPTableViewCell class] alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
    }
    cell.selectionStyle = rowModel.selectStyle;
    
    cell.row = rowModel;
    cell.indexPath = indexPath;

    [cell cellWillAppear:rowModel.model];
    
    return cell;
}


#pragma mark 滚动 UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ([self.delegate respondsToSelector:@selector(tableViewDidScroll:)]) {
        UITableView *tableView = (UITableView *)scrollView;
        [self.delegate tableViewDidScroll:tableView];
    }
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(tableViewDidEndScroll:)]) {
        UITableView *tableView = (UITableView *)scrollView;
        [self.delegate tableViewDidEndScroll:tableView];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate; {
    
    if (!decelerate && [self.delegate respondsToSelector:@selector(tableViewDidEndScroll:)]) {
        UITableView *tableView = (UITableView *)scrollView;
        [self.delegate tableViewDidEndScroll:tableView];
    }
    
    if ([self.delegate respondsToSelector:@selector(tableViewDidEndDragging:willDecelerate:)]) {
        UITableView *tableView = (UITableView *)scrollView;

        [self.delegate tableViewDidEndDragging:tableView willDecelerate:decelerate];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView; {
    if ([self.delegate respondsToSelector:@selector(tableViewDidEndScroll:)]) {
        UITableView *tableView = (UITableView *)scrollView;
        [self.delegate tableViewDidEndScroll:tableView];
    }
}

@end

