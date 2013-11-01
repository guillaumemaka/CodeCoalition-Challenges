//
//  GMCustomTextField.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMCustomTextField.h"

@implementation GMCustomTextField

-(id)initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  if (self) {
    _validColor = [[UIColor alloc] initWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
    _invalidColor = [UIColor grayColor];
    _validWidth = 0.8;
    _invalidWidth = 0.3;
    self.delegate = self;
    self.layer.cornerRadius = 5.0;
    [self registerForNotifications];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
//- (void)drawRect:(CGRect)rect
//{
// 5
//}

-(void)setLeftImage:(UIImage *)leftImage{
  UIImageView* leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
  leftView.image = [leftImage resizedImage:CGSizeMake(15, 15) interpolationQuality:kCGInterpolationDefault];
  leftView.frame = CGRectInset(leftView.frame, -15, 0);
  leftView.contentMode = UIViewContentModeLeft;
  leftView.alpha = 0.5;
  
  self.leftView = leftView;
  self.leftViewMode = UITextFieldViewModeAlways;
}

-(CGRect)leftViewRectForBounds:(CGRect)bounds {
  
  return CGRectInset(CGRectMake(10, 5, 15, 20), -5, -5);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  [self resignFirstResponder];
  [_nextControl becomeFirstResponder];
  return YES;
}

#pragma mark - Notifications;

- (void)registerForNotifications {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(textFieldTextChange:)
                                               name:UITextFieldTextDidChangeNotification
                                             object:self];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(textFieldTextChange:)
                                               name:UITextFieldTextDidChangeNotification
                                             object:self];
}


- (void)unregisterForNotifications {
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:self];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:self];
}

-(void) textFieldTextChange:(NSNotification*) notification{
  BOOL valid = self.text.length > 0;
  
  self.layer.borderColor = valid ? _validColor.CGColor : _invalidColor.CGColor;
  self.layer.borderWidth = valid ? _validWidth : _invalidWidth;
}

-(void)dealloc{
  [self unregisterForNotifications];
}
@end
