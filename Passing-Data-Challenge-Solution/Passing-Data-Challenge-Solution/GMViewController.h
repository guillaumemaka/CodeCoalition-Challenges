//
//  GMViewController.h
//  Passing-Data-Challenge-Solution
//
//  Created by Guillaume Maka on 2013-10-21.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMDetailsViewController.h"
@interface GMViewController : UIViewController <GMDetailsViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
