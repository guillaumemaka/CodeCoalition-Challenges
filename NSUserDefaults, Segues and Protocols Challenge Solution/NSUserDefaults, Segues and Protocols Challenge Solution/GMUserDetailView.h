//
//  GMUserDetailView.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-30.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMUser.h"

@interface GMUserDetailView : UIView
@property (weak,readonly, nonatomic) IBOutlet UILabel* usernameLabel;
@property (weak,readonly, nonatomic) IBOutlet UILabel* passwordLabel;

- (void) updateWithUserInfo:(GMUser*) user;
@end
