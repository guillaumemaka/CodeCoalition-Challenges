//
//  GMTaskDetailViewController.m
//  Overdue Task List
//
//  Created by Guillaume Maka on 2013-11-04.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMTaskDetailViewController.h"

@interface GMTaskDetailViewController ()
-(void) updateUI;
@end

@implementation GMTaskDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self updateUI];
}

-(void)updateUI{
  _taskNameLabel.text = _task.name;
  [_taskNameLabel sizeToFit];
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  
  _taskDueDateLabel.text = [dateFormatter stringFromDate:_task.dueDate];
  [_taskDueDateLabel sizeToFit];
  
  _taskDescriptionTextView.text = _task.taskDescription;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([segue.identifier isEqualToString:@"toEditVC"]) {
    GMTaskEditViewController *editVC = segue.destinationViewController;
    editVC.delegate = self;
    editVC.task = self.task;
  }
}

#pragma mark - GMTaskEditViewControllerDelegate

-(void)didUpdateTask{
  [self.navigationController popViewControllerAnimated:YES];
  [self.delegate didUpdate];
}
@end
