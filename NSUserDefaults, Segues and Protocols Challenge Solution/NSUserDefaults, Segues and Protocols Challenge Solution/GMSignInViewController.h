//
//  GMSignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMCustomTextField.h"
#import "GMSignUpViewController.h"

@class GMSignInViewController;

@protocol GMSignInViewControllerDelegate <NSObject>

@required
-(void) signInViewControllerDidSignIn:(GMSignInViewController*) signInViewController;

@end

@interface GMSignInViewController : UIViewController <GMSignUpViewControllerDelegate>
@property (weak, nonatomic) IBOutlet GMCustomTextField *usernameTextField;
@property (weak, nonatomic) IBOutlet GMCustomTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak,nonatomic) id<GMSignInViewControllerDelegate> delegate;

- (IBAction)signInAction:(UIButton *)sender;

@end
