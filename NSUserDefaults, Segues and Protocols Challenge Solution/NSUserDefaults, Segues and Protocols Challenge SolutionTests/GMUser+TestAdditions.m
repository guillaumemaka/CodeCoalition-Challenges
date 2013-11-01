//
//  GMUser+TestAdditions.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-29.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMUser+TestAdditions.h"
#import "GMConstants.h"

@implementation GMUser (TestAdditions)
+(void) addUser:(NSDictionary*) data {
  NSMutableArray* users = [[self objectForKey:NS_USER_DEFAULT_USERS_KEY] mutableCopy];
  [users addObject:data];
  [self saveObject:users forKey:NS_USER_DEFAULT_USERS_KEY];
}

+(NSArray*) getUsers{
  return [self objectForKey:NS_USER_DEFAULT_USERS_KEY];
}

+(void)clearUserDefault {
  [NSUserDefaults resetStandardUserDefaults];
}

+(void)saveObject:(id)object forKey:(NSString *)key {
  NSData* data = [NSKeyedArchiver archivedDataWithRootObject:object];
  NSLog(@"Key: %@, Data: %@", key, [NSKeyedUnarchiver unarchiveObjectWithData:data]);
  [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

+(id)objectForKey:(NSString*)key {
  NSData* data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
  id unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:data];
  NSLog(@"Key: %@, Data: %@", key, unarchived);
  return unarchived;
}

@end
