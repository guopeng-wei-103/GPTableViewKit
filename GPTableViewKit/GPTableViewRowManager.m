//
//  GPTableViewRowManager.m
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import "GPTableViewRowManager.h"

@interface GPTableViewRowManager ()

/** editDics */
@property (nonatomic, strong) NSMutableArray *editDics;

@end

@implementation GPTableViewRowManager
- (instancetype)init {
    self = [super init];
    if (self) {
        _rowHeight = 50;
        _selectStyle = UITableViewCellSelectionStyleNone;
        _editDics = [[NSMutableArray alloc] init];
    }
    return self;
}


+ (instancetype) row {
    
    return  [[self alloc]init];
    
}

- (void)addEditingTitle:(NSString *)title bgColor:(UIColor *)bgColor {
    
    if (title.length > 0) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:title forKey:@"title"];
        [dic setObject:bgColor?:[UIColor redColor] forKey:@"color"];
        [_editDics addObject:dic];
    }
}

- (NSArray *)editingStyles {
    return _editDics;
}

@end
