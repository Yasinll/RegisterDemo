//
//  RegisterViewController.m
//  RegisterDemo
//
//  Created by PatrickY on 2018/3/16.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (nonatomic, strong) UILabel                           *usernameLabel;
@property (nonatomic, strong) UILabel                           *passwordLabel;
@property (nonatomic, strong) UITextField                       *usernameTextField;
@property (nonatomic, strong) UITextField                       *passwordTextField;
@property (nonatomic, strong) UIButton                          *registerButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [UIScreen mainScreen].bounds;
    
    self.navigationItem.title = @"注册";
    CGFloat labelWidth = 60;
    CGFloat labelHeight = 30;
    CGFloat textFieldWidth = 200;
    CGFloat textFieldHeight = 30;
    CGFloat buttonWidth = 80;
    CGFloat buttonHeight = 30;
    CGFloat leftView = 50;
    CGFloat topView = 150;
    CGFloat marginView = 50;
    
    
    self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftView, topView, labelWidth, labelHeight)];
    self.usernameLabel.text = @"用户名:";
    self.usernameLabel.textAlignment = NSTextAlignmentRight;
    
    self.passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftView, topView + marginView, labelWidth, labelHeight)];
    self.passwordLabel.text = @"密码:";
    self.passwordLabel.textAlignment = NSTextAlignmentRight;
    
    self.usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(leftView + labelWidth, topView, textFieldWidth, textFieldHeight)];
    self.usernameTextField.borderStyle = UITextBorderStyleLine;
    self.usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(leftView + labelWidth, topView + textFieldHeight + 20, textFieldWidth, textFieldHeight)];
    self.passwordTextField.borderStyle = UITextBorderStyleLine;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.secureTextEntry = YES;
    
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registerButton.frame = CGRectMake((screen.size.width - buttonWidth) / 2, marginView + 300, buttonWidth, buttonHeight);
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(registerButtonClick)];
    UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = saveButtonItem;
    self.navigationItem.leftBarButtonItem = cancelButtonItem;
    
    [self.view addSubview:self.usernameLabel];
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.usernameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.registerButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)registerButtonClick {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"注册回调");
        
        NSDictionary *dataDict = @{@"username":self.usernameTextField.text, @"password":self.passwordTextField.text};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletedNotification" object:nil userInfo:dataDict];
        
    }];
}

- (void)cancel {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
