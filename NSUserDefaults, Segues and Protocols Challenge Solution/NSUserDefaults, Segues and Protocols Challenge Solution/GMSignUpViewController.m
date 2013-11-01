//
//  GMSignUpViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMSignUpViewController.h"
#import "UIImage+Resize.h"
#import "GMUser.h"

@interface GMSignUpViewController (){
  UIColor* _buttonReferenceColor;
}

@end

@implementation GMSignUpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  [_usernameTextField setLeftImage:[UIImage imageNamed:@"glyphicons_003_user"]];
  [_usernameTextField setNextControl:_passwordTextField];
  [_passwordTextField setLeftImage:[UIImage imageNamed:@"glyphicons_203_lock"]];
  [_passwordTextField setNextControl:_confirnPasswordTextField];
  [_confirnPasswordTextField setLeftImage:[UIImage imageNamed:@"glyphicons_203_lock"]];
  [_confirnPasswordTextField setNextControl:_signUpButton];
  _buttonReferenceColor = _signUpButton.backgroundColor;
  [self updateUI];
}

-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
  [self registerForNotifications];
}

-(void)viewWillDisappear:(BOOL)animated{
  [self unregisterForNotifications];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpAction:(UIButton *)sender {
  NSString *username = _usernameTextField.text;
  NSString *password = _passwordTextField.text;
  NSString *confirmPassword = _confirnPasswordTextField.text;
  
  BOOL passwordsMatch = [password isEqualToString:confirmPassword];
  
  if (passwordsMatch) {
    [GMUser signUpWithUsername:username
                   andPassword:password
                       success:^(BOOL success) {
                         [self.delegate signUpViewControllerDidSignUp:self];
                       }
                       failure:^(NSError *error) {
                         [[[UIAlertView alloc] initWithTitle:@"Oups" message:error.userInfo[@"message"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
                       }];
  } else {
    [[[UIAlertView alloc] initWithTitle:@"Oups" message:@"The password and confirm password must match !" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
  }
}


-(void)updateUI{
  BOOL usernameTextFieldValid = _usernameTextField.text.length > 0;
  BOOL passwordTextFieldValid = _passwordTextField.text.length > 0;
  BOOL confirmPasswordTextFieldValid = _confirnPasswordTextField.text.length > 0;
  BOOL allValid = (usernameTextFieldValid && passwordTextFieldValid && confirmPasswordTextFieldValid);
//  BOOL confirmPasswordAndPasseordMatch = [_passwordTextField.text isEqualToString:_confirnPasswordTextField.text];
  
  _signUpButton.backgroundColor = allValid ? _buttonReferenceColor : [UIColor grayColor];
  _signUpButton.enabled = allValid;
}

#pragma mark - Notifications

- (void)registerForNotifications {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(textFieldTextChange:)
                                               name:UITextFieldTextDidChangeNotification
                                             object:_usernameTextField];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(textFieldTextChange:)
                                               name:UITextFieldTextDidChangeNotification
                                             object:_passwordTextField];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(textFieldTextChange:)
                                               name:UITextFieldTextDidChangeNotification
                                             object:_confirnPasswordTextField];
}


- (void)unregisterForNotifications {
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:_usernameTextField];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:_passwordTextField];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:_confirnPasswordTextField];
}

-(void) textFieldTextChange:(NSNotification*) notification{
  [self updateUI];
}
@end
