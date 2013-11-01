//
//  GMCustomTextField.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Resize.h"

@interface GMCustomTextField : UITextField <UITextFieldDelegate>

@property (strong, nonatomic) UIColor *validColor;
@property (strong, nonatomic) UIColor *invalidColor;
@property (assign, nonatomic) CGFloat validWidth;
@property (assign, nonatomic) CGFloat invalidWidth;
@property (strong, nonatomic) UIControl *nextControl;
@property (strong, nonatomic) UIImage *leftImage;
@end
