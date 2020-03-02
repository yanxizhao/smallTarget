//
//  ZZLaunchViewController.m
//  target
//
//  Created by zhaoyipei on 2020/3/1.
//  Copyright © 2020 zhaoyipei. All rights reserved.
//

#import "ZZLaunchViewController.h"
#import <Masonry/Masonry.h>
#import "ZZTargetsListViewController.h"


@interface ZZLaunchViewController ()

@property (nonatomic, strong) UIImageView *launchImage;

@end

@implementation ZZLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
//    CGAffineTransform originalTransform = self.launchImage.transform;
//        [UIView animateWithDuration:2 animations:^{
//            self.launchImage.transform = CGAffineTransformMakeScale(1.5, 1.5);
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:2 animations:^{
//                self.launchImage.transform = originalTransform;
//            } completion:^(BOOL finished) {
//
//            }];
//        }];
        [UIView animateWithDuration:2 animations:^{
            self.launchImage.transform = CGAffineTransformMakeScale(1.5, 1.5);
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter]postNotificationName:@"loginSuccssee" object:nil userInfo:nil];
            });
        }];
    
}

- (void)setupView {
    [self.view addSubview:self.launchImage];
    [self.launchImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
}

- (UIImageView *)launchImage {
    if (!_launchImage) {
        _launchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ZZ_launchImage"]];
    }
    return _launchImage;
}

@end
