//
//  GPTableViewSHeaderManager.h
//  AFNetworking
//
//  Created by 魏国朋 on 2018/11/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GPTableViewSHeaderManager : NSObject

/** 高度 */
@property (nonatomic, assign) NSInteger headerHeight;

/** cell 名 */
@property (nonatomic, strong) UIView *headerView;

@end

NS_ASSUME_NONNULL_END


