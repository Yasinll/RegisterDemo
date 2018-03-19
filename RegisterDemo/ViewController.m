//
//  ViewController.m
//  RegisterDemo
//
//  Created by PatrickY on 2018/3/16.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel                           *usernameLabel;
@property (nonatomic, strong) UILabel                           *passwordLabel;
@property (nonatomic, strong) UITextField                       *usernameTextField;
@property (nonatomic, strong) UITextField                       *passwordTextField;
@property (nonatomic, strong) UIButton                          *loginButton;
@property (nonatomic, strong) UIButton                          *registerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [UIScreen mainScreen].bounds;
    
    self.navigationItem.title = @"登录";
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
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loginButton.frame = CGRectMake((screen.size.width - buttonWidth) / 2, 300, buttonWidth, buttonHeight);
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registerButton.frame = CGRectMake((screen.size.width - buttonWidth) / 2, marginView + 300, buttonWidth, buttonHeight);
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.usernameLabel];
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.usernameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompleted:) name:@"RegisterCompletedNotification" object:nil];
    
}

//注册按钮点击事件
- (void)registerButtonClick {
    
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:registerViewController];
    
    [self presentViewController:navController animated:YES completion:nil];
    
}

- (void)registerCompleted:(NSNotification *)notification {
    
    NSDictionary *dataDict = [notification userInfo];
    NSString *username = dataDict[@"username"];
    NSString *password = dataDict[@"password"];
    self.usernameTextField.text = username;
    self.passwordTextField.text = password;
    NSLog(@"%@ -- %@", username, password);
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
