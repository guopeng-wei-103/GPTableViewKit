//
//  GPTableViewCell.m
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import "GPTableViewCell.h"
#import "GPTableViewRowManager.h"

@implementation GPTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.highlighView];
        
        NSMutableDictionary *views = [NSMutableDictionary new];
        [views setObject:_highlighView forKey:@"sbView"];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[sbView]-0-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[sbView]-0-|" options:0 metrics:nil views:views]];
        
        [self cellDidLoad];
        
    }
    return self;
}

- (void)cellDidLoad; {
    
}

- (void)cellWillAppear:(id)model; {
    
}


/** bottom */
- (UIView *)highlighView {
    if (!_highlighView) {
        _highlighView = [[UIView alloc]init];
        _highlighView.translatesAutoresizingMaskIntoConstraints = NO;
        _highlighView.backgroundColor = UIColor.clearColor;
    }
    return _highlighView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    _highlighView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    _highlighView.backgroundColor = UIColor.clearColor;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    _highlighView.backgroundColor = UIColor.clearColor;
}

@end
