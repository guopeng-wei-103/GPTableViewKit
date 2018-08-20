
//
//  GPTableViewSeparateCell.m
//  DayProgress
//
//  Created by 魏国朋 on 16/8/22.
//  Copyright © 2016年 weiguopeng. All rights reserved.
//

#import "GPTableViewSeparateCell.h"
#import "GPTableViewRowManager.h"
#import <Masonry/Masonry.h>

@interface GPTableViewSeparateCell ()

/** lineView */
@property (nonatomic, strong) UIView *lineView;

@end


@implementation GPTableViewSeparateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier NS_AVAILABLE_IOS(3_0) {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
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
    
    [_lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, leftOffset, 0, rightOffset));
    }];
    
}

/** line */
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
    }
    return _lineView;
}

@end
