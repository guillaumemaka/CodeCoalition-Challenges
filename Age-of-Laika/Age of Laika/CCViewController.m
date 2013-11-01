//
//  CCViewController.m
//  Age of Laika
//
//  Created by Eliot Arntz on 9/24/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convert:(id)sender {
  [self.humanYearsTextFields resignFirstResponder];
  
  // Declare a variable named humanYears of type int
  int humanYears;
  
  // Declare a variable named dogYears of type float   
  float dogYears = 0;  
  
  // Check if the textfield isn't empty
  if ([self.humanYearsTextFields.text isEqualToString:@""]) {
    // if empty show an error message
    [[[UIAlertView alloc] initWithTitle:@"Years is empty" message:@"Please enter a years to be converted" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
  }else{
    // else get back the textfield content as integer, store it ti the local
    // humanYears variable
    humanYears = [self.humanYearsTextFields.text intValue];
    
    // 10.5 years per human years for the first 2 years and 4 years for the rest
    // for instance 3 human years = (21 + ((3 - 2) * 4)) = 25 dog years
    if (humanYears > 2) {
      dogYears = 21 + ((humanYears - 2)  * 4);
    }else{
      dogYears = humanYears * 10.5;
    }
    
    // Update the label displaying the result of the conversion
    self.dogYearsLabel.text = [NSString stringWithFormat:@"Laïka would be %.f years old", dogYears ];
  }
}
@end
