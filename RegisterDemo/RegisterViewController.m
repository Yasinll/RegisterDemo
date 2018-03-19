//
//  RegisterViewController.m
//  RegisterDemo
//
//  Created by PatrickY on 2018/3/16.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "RegisterViewController.h"
#import "LayoutView.h"

@interface RegisterViewController ()

@property (nonatomic, strong) UITextField                       *usernameTextField;
@property (nonatomic, strong) UITextField                       *passwordTextField;


@end

@implementation RegisterViewController {
    LayoutView                          *_myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _myView = [[LayoutView alloc] init];
    [self.view addSubview:_myView];
    

    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(registerButtonClick)];
    UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = saveButtonItem;
    self.navigationItem.leftBarButtonItem = cancelButtonItem;
    
    [_myView.registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)registerButtonClick {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"注册回调");
        
        NSDictionary *dataDict = @{@"username":_myView.usernameTextField.text, @"password":_myView.passwordTextField.text};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletedNotification" object:nil userInfo:dataDict];
        
    }];
}

- (void)cancel {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
