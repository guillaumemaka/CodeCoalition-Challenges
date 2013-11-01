//
//  GMDetailsViewController.h
//  Passing-Data-Challenge-Solution
//
//  Created by Guillaume Maka on 2013-10-21.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GMDetailsViewController;

@protocol GMDetailsViewControllerDelegate <NSObject>

@required
- (void) gmDetailsViewController:(GMDetailsViewController*)detailsViewController
                   didUpdateText:(NSString*) text;

@end

@interface GMDetailsViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UITextField *updateTextField;
@property (strong, nonatomic) NSString *detailsText;
@property (weak, nonatomic) id<GMDetailsViewControllerDelegate> delegate;
- (IBAction)updateAction:(UIButton *)sender;
@end
