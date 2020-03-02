//
//  ZZaddTargetViewController.h
//  target
//
//  Created by zhaoyipei on 2020/3/1.
//  Copyright © 2020 zhaoyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZaddTargetViewController : UIViewController

@property (nonatomic, strong)void (^newTarget)(NSString *);

@end

NS_ASSUME_NONNULL_END
