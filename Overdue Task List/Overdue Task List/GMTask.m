//
//  GMTask.m
//  Overdue Task List
//
//  Created by Guillaume Maka on 2013-11-04.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMTask.h"

@implementation GMTask
-(id)init{
  self = [self initWithData:nil];
  if (self) {
    
  }
  return self;
}

-(instancetype)initWithData:(NSDictionary *)data{
  self = [super init];
  
  if (self) {
    self.name = data[TASK_NAME_KEY];
    self.taskDescription = data[TASK_DESCRIPTION_KEY];
    self.dueDate = data[TASK_DATE_KEY];
    self.isConpleted = [data[TASK_COMPLETED_KEY] boolValue];
  }
  
  return self;
}
@end
