//
//  GPTableViewRowManager.m
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import "GPTableViewRowManager.h"

@implementation GPTableViewRowManager
- (instancetype)init {
    self = [super init];
    if (self) {
        _rowHeight = 50;
        _selectStyle = UITableViewCellSelectionStyleNone;
        _editingStyle = UITableViewCellEditingStyleNone;
    }
    return self;
}


+ (instancetype) row {
    
    return  [[self alloc]init];
    
}
@end
