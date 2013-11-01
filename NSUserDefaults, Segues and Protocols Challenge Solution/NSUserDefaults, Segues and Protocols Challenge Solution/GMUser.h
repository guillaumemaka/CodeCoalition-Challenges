//
//  GMUser.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-28.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(BOOL success);
typedef void(^FailureBlock)(NSError* error);

@interface GMUser : NSObject
//! The user unique identifier
@property (strong, nonatomic) NSString *uid;
//! The user username
@property (strong, nonatomic) NSString *username;
//! The user password
@property (strong, nonatomic) NSString *password;

/*! \brief Setup dependencies for the user
 *
 * This method initialize pre-requisite objects like NSUserDefaults
 */
+(void)setUp;

/*! \brief return the current logged user
*
* This method exists so everywhere in your application you can determine if a user
* is currently logged in, if a user is logged in thsi method return an instance of 
* GMUser \see GMUser.h
*\return the logged user, nil if no user logged
 */
+(GMUser*) currentUser;

/*! \brief Signin a user without blocking the main thread
 *
 *\param username The user username
 *\param password The user password (in cleartext)
 *\param success The success block to callback after a successful signin
 *\param failure The failure block to callback after a failed signin
 */
+(void) signInWithUsername:(NSString*) username
              andPassword:(NSString*) password
                  success:(SuccessBlock) success
                  failure:(FailureBlock) faillure;

/*! \brief Signup a user without blocking the main thread
 *
 *\param username The user username
 *\param password The user password (in cleartext)
 *\param success The success block to callback after a successful signup
 *\param failure The failure block to callback after a failed signup
 */
+(void) signUpWithUsername:(NSString*) username
               andPassword:(NSString*) password
                   success:(SuccessBlock) success
                   failure:(FailureBlock) faillure;

/*! \brief Signout a user without blocking the main thread
 *
 *\param username The user username
 *\param password The user password (in cleartext)
 *\param success The success block to callback after a successful signout
 *\param failure The failure block to callback after a failed signout
 */
+(void) signOutUsingBlock:(void(^)(BOOL success, NSError* error)) block;
@end
