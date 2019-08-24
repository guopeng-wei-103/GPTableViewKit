
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
    }
    return self;
}
- (void)cellWillAppear:(id)model {
    
    self.backgroundColor = [UIColor clearColor];
    
    _lineView.backgroundColor = model;
    
    CGFloat leftOffset = 0.f;
    CGFloat rightOffset = 0.f;
    if ([self.row.subModel isKindOfClass:[NSArray class]]) {
        NSArray *lfOffset = self.row.subModel;
        leftOffset = [lfOffset[0] floatValue];
        rightOffset = [lfOffset[1] floatValue];
    }
    
    NSDictionary *bindings = NSDictionaryOfVariableBindings(_lineView);
    NSDictionary* metrics = @{@"leftMargin":@(leftOffset),@"rightMargin":@(rightOffset),@"topMargin":@(0),@"bottomMargin":@(0)};
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[_lineView]-rightMargin-|" options:0 metrics:metrics views:bindings]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[_lineView]-bottomMargin-|" options:0 metrics:metrics views:bindings]];
}



/** line */
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _lineView;
}

@end
