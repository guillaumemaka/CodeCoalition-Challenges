//
//  GMUserDetailView.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMUserDetailView.h"
@interface GMUserDetailView ()
@property (weak,readwrite, nonatomic) IBOutlet UILabel* usernameLabel;
@property (weak,readwrite, nonatomic) IBOutlet UILabel* passwordLabel;
@property (strong, nonatomic) GMUser *user;

-(void) updateUI;
@end

@implementation GMUserDetailView
-(id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self updateUI];
  }
  return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//  [self updateUI];
//  [self setNeedsDisplay];
//}


-(void)updateWithUserInfo:(GMUser *)user {
  _usernameLabel.text = user.username;
  _passwordLabel.text = user.password;
  [self updateUI];
}

-(void)updateUI{
  self.hidden = !_user ? NO : YES;
}
@end
