//
//  GMViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-28.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMUser.h"
#import "GMUserDetailView.h"
#import "GMSignInViewController.h"

@interface GMViewController : UIViewController <GMSignInViewControllerDelegate>

@property (weak, nonatomic) IBOutlet GMUserDetailView *userDetailView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)signOutAction:(UIBarButtonItem *)sender;
@end
