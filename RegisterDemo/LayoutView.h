//
//  LayoutView.h
//  RegisterDemo
//
//  Created by PatrickY on 2018/3/19.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayoutView : UIView

@property (nonatomic, strong) UILabel                           *usernameLabel;
@property (nonatomic, strong) UILabel                           *passwordLabel;
@property (nonatomic, strong) UITextField                       *usernameTextField;
@property (nonatomic, strong) UITextField                       *passwordTextField;
@property (nonatomic, strong) UIButton                          *loginButton;
@property (nonatomic, strong) UIButton                          *registerButton;

@end
