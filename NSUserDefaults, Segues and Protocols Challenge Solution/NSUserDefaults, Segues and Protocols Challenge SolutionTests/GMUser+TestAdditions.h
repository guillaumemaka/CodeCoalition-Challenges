//
//  GMUser+TestAdditions.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-29.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMUser.h"

@interface GMUser (TestAdditions)
+(void) addUser:(NSDictionary*) data;
+(NSArray*) getUsers;
+(void) clearUserDefault;
+(void)saveObject:(id)object forKey:(NSString *)key;
+(id)objectForKey:(NSString *)key;
@end
