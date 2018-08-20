
//
//  GPTableViewSeparateCell.m
//  DayProgress
//
//  Created by 魏国朋 on 16/8/22.
//  Copyright © 2016年 weiguopeng. All rights reserved.
//

#import "GPTableViewSeparateCell.h"
#import "GPTableViewRowManager.h"

@interface GPTableViewSeparateCell ()

/** lineView */
@property (nonatomic, strong) UIView *lineView;

@end


@implementation GPTableViewSeparateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier NS_AVAILABLE_IOS(3_0) {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.lineView];
        _lineView.frame = CGRectMake(0, 0, 320, 0.5);
    }
    return self;
}
- (void)cellWillAppear:(id)model {
    
    self.contentView.backgroundColor = [UIColor clearColor];
    
    _lineView.backgroundColor = model;
    
    CGFloat leftOffset = 0.f;
    CGFloat rightOffset = 0.f;
    if ([self.row.subModel isKindOfClass:[NSArray class]]) {
        NSArray *lfOffset = self.row.subModel;
        leftOffset = [lfOffset[0] floatValue];
        rightOffset = [lfOffset[1] floatValue];
    }
    
    CGFloat width = CGRectGetWidth(self.contentView.bounds) - leftOffset - rightOffset;
    CGFloat height = CGRectGetHeight(self.contentView.bounds);
    
    _lineView.frame = CGRectMake(leftOffset, 0, width, height);
    
}

/** line */
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
    }
    return _lineView;
}

@end
