//
//  GPTableViewCell.h
//  GPTableViewKit
//
//  Created by peng on 16/6/27.
//  Copyright © 2016年 Wei Guopeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPTableViewRowManager;

@interface GPTableViewCell : UITableViewCell

/** rowModel for currentCell */
@property (nonatomic, strong) GPTableViewRowManager *row;

/** indexPath for current cell */
@property (nonatomic, strong) NSIndexPath *indexPath;


/** DidLoad oneTime ,can be used as init */
- (void)cellDidLoad;

/** WillAppear moreTime */
- (void)cellWillAppear:(id)model;


@end
