//
//  ViewController.m
//  RegisterDemo
//
//  Created by PatrickY on 2018/3/16.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "LayoutView.h"

@interface ViewController ()

@end

@implementation ViewController {
    LayoutView                          *_myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myView = [[LayoutView alloc] init];
    [self.view addSubview:_myView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompleted:) name:@"RegisterCompletedNotification" object:nil];
    
    [_myView.registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_myView.loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
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
    _myView.usernameTextField.text = username;
    _myView.passwordTextField.text = password;
    NSLog(@"%@ -- %@", username, password);
}

- (void)loginButtonClick {
    
    NSLog(@"登录");
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
