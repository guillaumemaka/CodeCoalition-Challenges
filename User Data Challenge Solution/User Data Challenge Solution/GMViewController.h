//
//  GMViewController.h
//  User Data Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-22.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *users;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
