//
//  GMSignUpViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMCustomTextField.h"

@class GMSignUpViewController;

@protocol GMSignUpViewControllerDelegate <NSObject>

@required
-(void) signUpViewControllerDidSignUp:(GMSignUpViewController*) signUpViwqController;

@end

@interface GMSignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet GMCustomTextField *usernameTextField;
@property (weak, nonatomic) IBOutlet GMCustomTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet GMCustomTextField *confirnPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) id<GMSignUpViewControllerDelegate> delegate;
- (IBAction)signUpAction:(UIButton *)sender;

@end
