//
//  GMUser_ModelTests.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-29.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMUser+TestAdditions.h"
#import "GMTestCase.h"
#import "GMConstants.h"

@interface GMUser_ModelTests : GMTestCase

@end

@implementation GMUser_ModelTests

- (void)setUp
{
    [super setUp];
    [GMUser setUp];
}

- (void)tearDown
{
  [GMUser clearUserDefault];
    [super tearDown];
}

- (void)test_modelProperty{
  GMUser* user = [[GMUser alloc] init];
  XCTAssertTrue([user respondsToSelector:@selector(uid)], @"should have uid property");
  XCTAssertTrue([user respondsToSelector:@selector(username)], @"should have username property");
  XCTAssertTrue([user respondsToSelector:@selector(password)], @"should have password property");
}

- (void)test_setUp_NSUserDefault
{
  NSDictionary* currentUser = [GMUser objectForKey:NS_USER_DEFAULT_CURRENT_USER_KEY];
  NSArray* users = [GMUser objectForKey:NS_USER_DEFAULT_USERS_KEY];
  
  XCTAssertNotNil(currentUser, @"the currentUser dictionary should not be nil");
  XCTAssertNotNil(users, @"the users array should not be nil");
  XCTAssertTrue([currentUser isKindOfClass:[NSDictionary class]], @"currentUser should be of type NSDictionary");
  XCTAssertTrue([users isKindOfClass:[NSArray class]], @"users should be of type NSArray");
}

-(void)test_currentUser_withNoLoggedInUser_shouldBeNil{
  XCTAssertNil([GMUser currentUser], @"with no user logged in currentUser should be nil");
}

-(void)test_sinIn_withInvalidUser_shouldFailed{
  __block NSError *_blockError = nil;
  
  [GMUser signInWithUsername:@"test" andPassword:@"test"
                     success:nil
                     failure:^(NSError *error) {
    if (error) {      
      _blockError = error;
    }
  }];
  
//  expect(_blockError).toNot.beNil();
//  expect([[_blockError.userInfo allKeys] containsObject:@"message"]).to.beTruthy();
//  expect(_blockError.code).to.equal(404);
//  expect(_blockError.domain).to.equal(@"UserNotFounc");
//  expect(_blockError.userInfo[@"message"]).to.equal(@"The provided username/password doesn't exists");
  XCTFail(@"Wait a fix for testing asynchronous method");
}

-(void)test_signIn_withRegisteredUser_shouldSucceed{
  __block BOOL _successBlock;
  
  [GMUser addUser:@{
                    @"UID": [[NSUUID UUID] UUIDString],
                    @"Username" : @"test",
                    @"Password" : @"test"
                    }];
  
  NSArray* users = [GMUser getUsers];
  XCTAssert([users count] == 1, @"should have 1 user");
  
  [GMUser signInWithUsername:@"test" andPassword:@"test"
                     success:^(BOOL success){
                       _successBlock = success;
                     }
                     failure:nil];
  
//  expect(_successBlock).will.beTruthy();
  XCTFail(@"Wait a fix for testing asynchronous method");
}
@end
