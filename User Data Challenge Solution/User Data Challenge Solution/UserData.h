//
//  UserData.h
//  User Data Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-22.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USER_DATA_NAME_KEY @"username"
#define USER_DATA_EMAIL_KEY @"email"
#define USER_DATA_PASSWORD_KEY @"password"
#define USER_DATA_AGE_KEY @"age"
#define USER_DATA_PROFILE_PICTURE_KEY @"profilePicture"

@interface UserData : NSObject
+(NSArray*) users;
@end
