//
//  GMViewController.m
//  Passing-Data-Challenge-Solution
//
//  Created by Guillaume Maka on 2013-10-21.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMViewController.h"
#import "GMDetailsViewController.h"
@interface GMViewController () <UITextFieldDelegate>

@end

@implementation GMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_textField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([segue.identifier isEqualToString:@"DetailsVC"]) {
    if ([segue.destinationViewController isKindOfClass:[GMDetailsViewController class]]) {
      // Tell the textField to dismiss the keyboard
      [_textField resignFirstResponder];
      
      GMDetailsViewController *detailsVC = (GMDetailsViewController*) segue.destinationViewController;
      
      // Set delegation to self
      detailsVC.delegate = self;
      
      // provide data to detailsViewController
      detailsVC.detailsText = _textField.text;
    }
  }
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

#pragma mark - GMDetailsViewControllerDelegate

- (void)gmDetailsViewController:(GMDetailsViewController *)detailsViewController
                  didUpdateText:(NSString *)text {
  _textField.text = text;
  
  // Go 1 step back on the navigation hierarchy
  // [self.navigationController popViewControllerAnimated:YES];
}
@end