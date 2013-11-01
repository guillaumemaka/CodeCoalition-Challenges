//
//  GMUser.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-28.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMUser.h"
#import "GMConstants.h"

@interface GMUser ()
/*! \brief Helper method to get a user from a property list
 *\param userData The property list describing the user
 *\return a user object
 */
+(GMUser*) userFromPropertyList:(NSDictionary*) userData;

/*! \brief Helper method to find a user by it unique identifier
 *\param uid The user uid to find
 *\return a user object
 */
+(GMUser*) findUserByUID:(NSString*) uid;

/*! \brief Helper method to find a user by it username and password
 *\param username The user username
 *\param password The user password
 *\return a user object
 */
+(GMUser*) findUserByUsername:(NSString*)username
                  andPassword:(NSString*)password;

+(GMUser*) findUserWithPredicate:(NSPredicate*) predicate;
+(NSArray*) getUsers;
+(void) saveObject:(id)object foKey:(NSString*) key;
+(id)objectForKey:(NSString*)key;
@end

@implementation GMUser
+(void)setUp{
  if (![self objectForKey:NS_USER_DEFAULT_USERS_KEY] && ![self objectForKey:NS_USER_DEFAULT_CURRENT_USER_KEY]) {
    [self saveObject:@{NS_USER_DEFAULT_CURRENT_USER_KEY: @{USER_UID: @""}} foKey:NS_USER_DEFAULT_CURRENT_USER_KEY];
    [self saveObject:@[] foKey:NS_USER_DEFAULT_USERS_KEY];
    NSLog(@"Setup called: Setup initial value to NSUserDefaults");
  }else{
    NSLog(@"Setup called: Found previous data, no setup need");
  }
}

+ (GMUser *)currentUser {
  NSDictionary* currentUserData = [self objectForKey:NS_USER_DEFAULT_CURRENT_USER_KEY];
  
  NSString* uid = currentUserData[USER_UID];
  
  // Check if we have a current user in NSUserDefaults
  if (uid.length == 0) {
    return nil;
  }
  
  return [GMUser findUserByUID:uid];
}

+ (void)signInWithUsername:(NSString *)username
               andPassword:(NSString *)password
                   success:(SuccessBlock)success
                   failure:(FailureBlock)faillure {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{        
    // if we found the corresponding user
    GMUser *user = [GMUser findUserByUsername:username andPassword:password];
    if (user) {
      NSDictionary *loggedUser = @{USER_UID: user.uid };
      
      [self saveObject:loggedUser foKey:NS_USER_DEFAULT_CURRENT_USER_KEY];
      
      // make sure the success block point to something, preventing to send message to nil
      if (success) {
        
        // execute the success block in the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
          success(YES);
        });
      }
    }else{
      //TODO refactor the hard coded string
      NSError *error = [[NSError alloc] initWithDomain:@"UserNotFound" code:404 userInfo:@{@"message": @"The provided username/password doesn't exists"}];
      
      // make sure the failure block point to something, preventing to send message to nil
      if (faillure) {
        
        // execute the failure block in the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
          faillure(error);
        });
      }
    }

  });
}

+(void)signUpWithUsername:(NSString *)username
              andPassword:(NSString *)password
                  success:(SuccessBlock)success
                  failure:(FailureBlock)faillure{
  
  // Retrieve a mutable copy of the users list from NSUserDefaults
  NSMutableArray* users = [[self objectForKey:NS_USER_DEFAULT_USERS_KEY] mutableCopy];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ = %@",USER_USERNAME, username];
  // Check if the user exists
  if (![GMUser findUserWithPredicate:predicate]) {
    // if the user doesn't exist create it !
    
    NSDictionary *newUser = @{
                              USER_UID      : [NSString stringWithFormat:@"%@", [[NSUUID UUID] UUIDString]],
                              USER_USERNAME : [NSString stringWithFormat:@"%@",username],
                              USER_PASSWORD : [NSString stringWithFormat:@"%@",password]  };
    
    [users addObject:newUser];
    
    // save the users liste in NSUserDefaults
    [self saveObject:users foKey:NS_USER_DEFAULT_USERS_KEY];
    
    // Make sure the success block point to something
    if (success) {
      
      // execute the success block on the main thread
      dispatch_async(dispatch_get_main_queue(), ^{
        success(YES);
      });
    }
  }else{
    //TODO refactor the hard coded string
    NSError* error = [[NSError alloc] initWithDomain:@"UserAlreadyExist"
                                                code:201 userInfo:@{@"message": @"This user  already exist"}];
    
    // Make sure the failure block point to something
    if (faillure) {
      
      // execute the failure block on the main thread
      dispatch_async(dispatch_get_main_queue(), ^{
        faillure(error);
      });
    }
  }
}

+(void)signOutUsingBlock:(void (^)(BOOL, NSError *))block{
  @try {
    [self saveObject:@{USER_UID : @""} foKey:NS_USER_DEFAULT_CURRENT_USER_KEY];
    
    // Make sure the block point to something
    if (block) {
      dispatch_async(dispatch_get_main_queue(), ^{
        block(YES,nil);
      });
    }
  }
  @catch (NSException *exception) {
    // Make sure the block point to something
    if (block) {
      dispatch_async(dispatch_get_main_queue(), ^{
        block(YES,[NSError errorWithDomain:nil code:500 userInfo:exception.userInfo]);
      });
    }
  }
}

#pragma mark - Helpers

+ (GMUser *)userFromPropertyList:(NSDictionary *) userData{
  GMUser* user = nil;
  if (userData) {
    user = [[GMUser alloc] init];
    user.uid = userData[USER_UID];
    user.username = userData[USER_USERNAME];
    user.password = userData[USER_PASSWORD];
  }
  
  return user;
}

#pragma mark - Finders

+(GMUser *)findUserByUID:(NSString *)uid{
  NSArray* users = [self getUsers];
  
  if ([users count] == 0) return nil;
  
  NSDictionary* userData = [[users filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%K = %@",USER_UID, uid]] firstObject];
  
  return [GMUser userFromPropertyList:userData];
}

+(GMUser *)findUserByUsername:(NSString *)username andPassword:(NSString *)password{
  NSArray* users = [self getUsers];
  
  if ([users count] == 0) return nil;
  
  NSDictionary* userData = [[users filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%K = %@ AND %K = %@", USER_USERNAME,username, USER_PASSWORD, password]] firstObject];
  
  return [GMUser userFromPropertyList:userData];
}

+(GMUser *)findUserWithPredicate:(NSPredicate *)predicate {
  NSArray* users = [GMUser getUsers];
  
  if ([users count] == 0) return nil;
  
  NSDictionary* userData = [[users filteredArrayUsingPredicate:predicate] firstObject];
  
  return [GMUser userFromPropertyList:userData];
};

+ (NSArray*) getUsers {
  NSArray* users = [self objectForKey:NS_USER_DEFAULT_USERS_KEY];
  return users;
}

+(void)saveObject:(id)object foKey:(NSString *)key {
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
