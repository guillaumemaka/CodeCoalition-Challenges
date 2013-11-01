//
//  GMDetailsViewController.m
//  Passing-Data-Challenge-Solution
//
//  Created by Guillaume Maka on 2013-10-21.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMDetailsViewController.h"

@interface GMDetailsViewController ()

@end

@implementation GMDetailsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
  _detailsLabel.text = _detailsText;
  _updateTextField.delegate = self;
}

- (IBAction)updateAction:(UIButton *)sender {
  // Tell the UITextField to dismiss the keyboard
  [_updateTextField resignFirstResponder];
  
  // Update label
  _detailsLabel.text = _updateTextField.text;
  
  // Notify the delgate view controller the text was updated
  [_delegate gmDetailsViewController:self didUpdateText:_updateTextField.text];  
}

#pragma mark - UITextfieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  // Tell the UITextField to dismiss the keyboard
  [_updateTextField resignFirstResponder];
  return YES;
}
@end
