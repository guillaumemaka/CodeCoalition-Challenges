//
//  GMSignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMSignInViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Resize.h"
#import "GMUser.h"

@interface GMSignInViewController () {
  UIColor *_buttonReferenceColor;
}
- (void) updateUI;
@end

@implementation GMSignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  [_usernameTextField setLeftImage:[UIImage imageNamed:@"glyphicons_003_user"]];
  [_passwordTextField setLeftImage:[UIImage imageNamed:@"glyphicons_203_lock"]];

  [_usernameTextField setNextControl:_passwordTextField];
  [_passwordTextField setNextControl:_signInButton];

  _buttonReferenceColor = _signInButton.backgroundColor;

  [self updateUI];
}

-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];  
  [self registerForNotifications];
  [self updateUI];
}

-(void)viewWillDisappear:(BOOL)animated{
  [self unregisterForNotifications];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([segue.identifier isEqualToString:@"SignUp"]) {
    if ([segue.destinationViewController isKindOfClass:[GMSignUpViewController class]]) {
      GMSignUpViewController *signUpVC = segue.destinationViewController;
      signUpVC.delegate = self;
    }
  }
}
#pragma mark - IBActions

- (IBAction)signInAction:(UIButton *)sender {
  NSString *username = _usernameTextField.text;
  NSString *password = _passwordTextField.text;
  
  [GMUser signInWithUsername:username
                 andPassword:password
                     success:^(BOOL success) {
                       [self.delegate signInViewControllerDidSignIn:self];
                      }
                     failure:^(NSError *error) {
                       [[[UIAlertView alloc] initWithTitle:@"Sign In Error"
                                message:error.userInfo[@"message"]
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"Ok", nil] show];
                     }];
}


-(void)updateUI{
  BOOL usernameTextFieldValid = _usernameTextField.text.length > 0;
  BOOL passwordTextFieldValid = _passwordTextField.text.length > 0;
  _signInButton.backgroundColor = usernameTextFieldValid && passwordTextFieldValid ? _buttonReferenceColor : [UIColor grayColor];
  _signInButton.enabled = usernameTextFieldValid && passwordTextFieldValid;
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
}


- (void)unregisterForNotifications {
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:_usernameTextField];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:_passwordTextField];
}

-(void) textFieldTextChange:(NSNotification*) notification{
  [self updateUI];
}

#pragma mark - GMSignUpViewControllerDelegate

-(void)signUpViewControllerDidSignUp:(GMSignUpViewController *)signUpViwqController{
  [self.navigationController popViewControllerAnimated:YES];
}

@end
