//
//  GPTableViewSectionManager.m
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import "GPTableViewSectionManager.h"
#import "GPTableViewRowManager.h"

@interface GPTableViewSectionManager ()

/** rows */
@property (nonatomic, strong) NSMutableArray *rowsArray;
@end

@implementation GPTableViewSectionManager
- (instancetype)init {
    
    self = [super init];
    if (self) {
        _rowsArray = [[NSMutableArray alloc]init];
    }
    return self;
}


+ (instancetype)section {
    return [[self alloc] init];
}


- (void)addRow:(id)row {
    
    [_rowsArray addObject:row];
    
}
- (void)addSeparateRowHeight:(CGFloat)height color:(UIColor *)color {
    
    GPTableViewRowManager *row = [GPTableViewRowManager row];
    row.rowHeight = height;
    row.cellName = @"GPTableViewSeparateCell";
    row.model= color;
    [_rowsArray addObject:row];

}

- (void)addSeparateRowHeight:(CGFloat)height color:(UIColor *)color leftMargin:(CGFloat)left rightMargin:(NSInteger)right; {
    
    GPTableViewRowManager *row = [GPTableViewSectionManager separateRowModelWithHeight:height color:color leftMargin:left rightMargin:right bgColor:UIColor.clearColor];
    [_rowsArray addObject:row];
}
- (void)addSeparateRowHeight:(CGFloat)height color:(UIColor *)color leftMargin:(CGFloat)left rightMargin:(NSInteger)right backColor:(UIColor *)bgColor {
    GPTableViewRowManager *row = [GPTableViewSectionManager separateRowModelWithHeight:height color:color leftMargin:left rightMargin:right bgColor:bgColor];
       [_rowsArray addObject:row];
}
+ (GPTableViewRowManager *)separateRowModelWithHeight:(CGFloat)height color:(UIColor *)color leftMargin:(CGFloat)left rightMargin:(NSInteger)right bgColor:(UIColor *)bgColor {

    GPTableViewRowManager *row = [GPTableViewRowManager row];
    row.rowHeight = height;
    row.cellName = @"GPTableViewSeparateCell";
    NSInteger date = [[NSDate date] timeIntervalSince1970] * 1000 + arc4random() % 10000;
    row.reuseIdentifier = [NSString stringWithFormat:@"GPTableViewSeparateCell%ld",(long)date];
    row.model= color;
    row.subModel = bgColor;
    row.subModel = @[@(left), @(right)];
    return row;
}

- (void)insertRow:(id)row atIndex:(NSInteger)index {
    
    if (index<0 || index>_rowsArray.count) NSLog(@"index:%ld 超出当前row的范围\n已自动取就近索引",(long)index);
    
    index = index<0?0:index;
    index = index > _rowsArray.count?_rowsArray.count:index;
    
    [_rowsArray insertObject:row atIndex:index];
}

- (void)deleteRowAtIndex:(NSInteger)index {
    
    if (index<0 || index>_rowsArray.count) NSLog(@"index:%ld 超出当前row的范围\n已自动取就近索引",(long)index);
    
    index = index<0?0:index;
    index = index>=_rowsArray.count?_rowsArray.count-1:index;
    
    [_rowsArray removeObjectAtIndex:index];
}

- (NSArray *)rows {
    return _rowsArray;
}

@end
