//
//  UserData.m
//  User Data Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-22.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//


#import "UserData.h"

@implementation UserData
+(NSArray *)users{
  NSArray *users = @[
                            @{
                              USER_DATA_NAME_KEY : @"Person1",
                              USER_DATA_EMAIL_KEY : @"person1@example.com",
                              USER_DATA_PASSWORD_KEY : @"qwerty",
                              USER_DATA_AGE_KEY : @20,
                              USER_DATA_PROFILE_PICTURE_KEY : [UIImage imageNamed:@"person1.jpeg"]
                              },
                            @{
                              USER_DATA_NAME_KEY : @"Person2",
                              USER_DATA_EMAIL_KEY : @"person2@example.com",
                              USER_DATA_PASSWORD_KEY : @"qwerty",
                              USER_DATA_AGE_KEY : @20,
                              USER_DATA_PROFILE_PICTURE_KEY : [UIImage imageNamed:@"person2.jpeg"]
                              },
                            @{
                              USER_DATA_NAME_KEY : @"Person3",
                              USER_DATA_EMAIL_KEY : @"person3@example.com",
                              USER_DATA_PASSWORD_KEY : @"qwerty",
                              USER_DATA_AGE_KEY : @20,
                              USER_DATA_PROFILE_PICTURE_KEY : [UIImage imageNamed:@"person3.jpg"]
                              },
                            @{
                              USER_DATA_NAME_KEY : @"Person4",
                              USER_DATA_EMAIL_KEY : @"person4@example.com",
                              USER_DATA_PASSWORD_KEY : @"qwerty",
                              USER_DATA_AGE_KEY : @20,
                              USER_DATA_PROFILE_PICTURE_KEY : [UIImage imageNamed:@"person4.jpeg"]
                              },
                            ];
  
  
  return users;
}
@end
