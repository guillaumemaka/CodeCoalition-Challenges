//
//  GMTaskListViewController.h
//  Overdue Task List
//
//  Created by Guillaume Maka on 2013-11-04.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMAddTaskViewController.h"
#import "GMTaskDetailViewController.h"

@interface GMTaskListViewController : UITableViewController <GMAddTaskViewControllerDelegate, GMTaskDetailViewControllerDelegate>

- (IBAction)reorderAction:(UIBarButtonItem *)sender;

@end
