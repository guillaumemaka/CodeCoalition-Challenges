//
//  GMViewController.m
//  User Data Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-22.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMViewController.h"
#import "UserData.h"

@interface GMViewController ()

@end

@implementation GMViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  _users = [UserData users];
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.separatorInset = UIEdgeInsetsZero;
  NSLog(@"%@", _users);
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [_users count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdetifier = @"userCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetifier];
  
  [self configureCell:cell atIndexPath:indexPath];
  
  return cell;
}

-(void) configureCell:(UITableViewCell*) cell atIndexPath:(NSIndexPath*) indexPath {
  NSInteger idx = indexPath.row;
  cell.textLabel.text = _users[idx][USER_DATA_NAME_KEY];
  cell.detailTextLabel.text = _users[idx][USER_DATA_EMAIL_KEY];
  cell.imageView.image = _users[idx][USER_DATA_PROFILE_PICTURE_KEY];
}

@end
