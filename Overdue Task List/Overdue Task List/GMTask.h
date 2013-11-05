//
//  GMTask.h
//  Overdue Task List
//
//  Created by Guillaume Maka on 2013-11-04.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMTask : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSDate *dueDate;
@property (assign, nonatomic) BOOL isConpleted;

-(instancetype) initWithData:(NSDictionary*) data;
@end
