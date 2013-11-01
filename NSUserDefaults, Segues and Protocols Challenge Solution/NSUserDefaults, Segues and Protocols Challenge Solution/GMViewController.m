//
//  GMViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-28.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMViewController.h"
#import "GMSignInViewController.h"

@interface GMViewController ()

@end

@implementation GMViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  // Check if we are logged in
  //  Show account info
  // Otherwise
  //  Perform Signin Segue
  GMUser *currentUser = [GMUser currentUser];
  [_userDetailView updateWithUserInfo:currentUser];
  if (!currentUser) {
    [_activityIndicator startAnimating];
    [self performSegueWithIdentifier:@"SignIn" sender:self];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)signInViewControllerDidSignIn:(GMSignInViewController *)signInViewController{
  [self dismissViewControllerAnimated:YES completion:nil];
  [_activityIndicator stopAnimating];
  [_userDetailView updateWithUserInfo:[GMUser currentUser]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([segue.identifier isEqualToString:@"SignIn"]) {
    GMSignInViewController *signInVC = (GMSignInViewController*) ((UINavigationController*)segue.destinationViewController).topViewController;
      signInVC.delegate = self;
  }
}
- (IBAction)signOutAction:(UIBarButtonItem *)sender {
  [GMUser signOutUsingBlock:^(BOOL success, NSError *error) {
    if (success) {
      [self performSegueWithIdentifier:@"SignIn" sender:self];
    }else if (error){
      [[[UIAlertView alloc] initWithTitle:@"Oups"
                                  message:error.userInfo[@"message"]
                                 delegate:nil
                        cancelButtonTitle:nil
                        otherButtonTitles:@"Ok", nil] show];
    }
  }];
}
@end
