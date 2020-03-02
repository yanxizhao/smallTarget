//
//  ZZTargetsListViewController.m
//  target
//
//  Created by zhaoyipei on 2020/3/1.
//  Copyright © 2020 zhaoyipei. All rights reserved.
//

#import "ZZTargetsListViewController.h"
#import "ZZaddTargetViewController.h"
#import <Masonry/Masonry.h>

@interface ZZTargetsListViewController ()

@property (nonatomic, strong) UIButton  *addTargetButton;
@property (nonatomic, strong) UILabel *addNoteLabel;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ZZTargetsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)setupView {
    [self.view addSubview:self.addTargetButton];
    [self.addTargetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.height.mas_equalTo(33);
    }];
    [self.view addSubview:self.addNoteLabel];
    [self.addNoteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addTargetButton.mas_bottom);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(220);
        make .height.mas_equalTo(100);
    }];
}

#pragma mark --action
- (void)addTarget:(UIButton *)sinder {
    ZZaddTargetViewController *addTargetVc = [[ZZaddTargetViewController alloc] init];
    addTargetVc.newTarget = ^(NSString * target) {
        [self.dataSource addObject:target];
    };
    [self presentViewController:addTargetVc animated:YES completion:^{
    }];
}

- (UIButton *)addTargetButton {
    if (!_addTargetButton) {
        _addTargetButton = [[UIButton alloc] init];
        [_addTargetButton setImage:[UIImage imageNamed:@"add_target"] forState:UIControlStateNormal];
        [_addTargetButton addTarget:self action:@selector(addTarget:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addTargetButton;
}

- (UILabel *)addNoteLabel {
    if (!_addNoteLabel) {
        _addNoteLabel = [[UILabel alloc] init];
        _addNoteLabel.text = @"你的target空空如也，快来创建你的第一个小目标吧";
        _addNoteLabel.textAlignment = NSTextAlignmentCenter;
        _addNoteLabel.textColor = [UIColor blackColor];
        _addNoteLabel.font = [UIFont systemFontOfSize:17];
        _addNoteLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _addNoteLabel.numberOfLines = 0;
    }
    return _addNoteLabel;
}


@end
