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
        
        [self.contentView addSubview:self.bottomButton];
        
        NSMutableDictionary *views = [NSMutableDictionary new];
        [views setObject:_bottomButton forKey:@"button"];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button]-0-|" options:0 metrics:nil views:views]];
        
        [self cellDidLoad];

    }
    return self;
}

- (void)cellDidLoad; {
    
}

- (void)cellWillAppear:(id)model; {
    
    if (!self.row.didSelectRow) {
        self.bottomButton.userInteractionEnabled = NO;
    }
}

- (void)selectCellAction_gptable {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if (self.row.didSelectRow) {
        self.row.didSelectRow();
    }
}

/** bottom */
- (UIButton *)bottomButton {
    if (!_bottomButton) {
        _bottomButton = [[UIButton alloc]init];
        [_bottomButton setBackgroundImage:[self imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
        [_bottomButton setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:247/255.0 green:248/255.0 blue:250/255.0 alpha:1] size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
        [_bottomButton addTarget:self action:@selector(selectCellAction_gptable) forControlEvents:UIControlEventTouchUpInside];
        _bottomButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _bottomButton;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
