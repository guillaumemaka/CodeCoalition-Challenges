//
//  GMTestCase.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-29.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMTestCase.h"

@interface GMTestCase ()

@end

@implementation GMTestCase

- (void)setUp
{
  [super setUp];
  [Expecta setAsynchronousTestTimeout:5.0];
}

- (void)tearDown
{
  // Put teardown code here; it will be run once, after the last test case.
  [super tearDown];
}
@end
