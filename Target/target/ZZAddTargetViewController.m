//
//  ZZaddTargetViewController.m
//  target
//
//  Created by zhaoyipei on 2020/3/1.
//  Copyright © 2020 zhaoyipei. All rights reserved.
//

#import "ZZaddTargetViewController.h"
#import <Masonry/Masonry.h>

@interface ZZaddTargetViewController ()

@property (nonatomic, strong) UILabel *targetNameLabel;
@property (nonatomic, strong) UITextField *targetName;
@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation ZZaddTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)setupView {
    [self.view addSubview:self.targetNameLabel];
    [self.targetNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(20);
        make.top.mas_equalTo(self.view).offset(100);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.view addSubview:self.targetName];
    [self.targetName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.targetNameLabel.mas_right);
        make.top.bottom.mas_equalTo(self.targetNameLabel);
        make.right.mas_equalTo(self.view).offset(-50);
    }];
    
    [self.view addSubview:self.doneButton];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-50);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(300);
    }];
}

#pragma mark --action

- (void)doneButtonDidClick:(UIButton *)sinder {
    self.newTarget(self.targetName.text);
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (UILabel *)targetNameLabel {
    if (!_targetNameLabel) {
        _targetNameLabel = [[UILabel alloc] init];
        _targetNameLabel.text = @"目标";
        _targetNameLabel.textColor = [UIColor blackColor];
        _targetNameLabel.font = [UIFont systemFontOfSize:17];
    }
    return _targetNameLabel;
}

- (UITextField *)targetName {
    if (!_targetName) {
        _targetName = [[UITextField alloc] init];
        _targetName.borderStyle = UITextBorderStyleRoundedRect;
        _targetName.placeholder = @"输入目标名称";
        _targetName.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _targetName;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [[UIButton alloc] init];
        _doneButton.backgroundColor = [UIColor blueColor];
        [_doneButton setTitle:@"保存" forState:UIControlStateNormal];
        [_doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont systemFontOfSize:17];
        _doneButton.layer.cornerRadius = 4.0;
        _doneButton.layer.masksToBounds = YES;
        [_doneButton addTarget:self action:@selector(doneButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end
