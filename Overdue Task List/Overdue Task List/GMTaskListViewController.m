//
//  GMTaskListViewController.m
//  Overdue Task List
//
//  Created by Guillaume Maka on 2013-11-04.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMTaskListViewController.h"
#import "GMTask.h"

@interface GMTaskListViewController ()
@property (strong, nonatomic) NSMutableArray *tasks;
/*! Load tasks from NSUserDefault */
-(void) loadTasksFromPropertyList;

// Save task to NSUserDefault
-(void) saveTasks;

/*! Get a task from a property list
 \param data a dictionary containing task informations
 \return a GMTask object
 */
-(GMTask*) taskFromPropertyList:(NSDictionary*) data;

/*! Method that configure a UITableViewCell with a task
 \paran cell the UITableViewCell to configure
 \param task the task
 */
-(void) configureCell:(UITableViewCell*)cell withTask:(GMTask*) task;

/*! Function that compare if a a given date is greater than another
 \param date1 the date to compare
 \param date2 the against date
 \return YES if date1 is greater than date2, NO otherwise
 */
-(BOOL) isDate:(NSDate*)date1 greaterThan:(NSDate*)date2;
@end

@implementation GMTaskListViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
  [self loadTasksFromPropertyList];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

-(void)loadTasksFromPropertyList{
  if (!self.tasks) {
    self.tasks = [[NSMutableArray alloc] init];
  }
  
  NSArray* savedTasks = [[NSUserDefaults standardUserDefaults] arrayForKey:TASkS_OBJECT_KEY];
  for (NSDictionary *data in savedTasks) {
    GMTask *task = [[GMTask alloc] initWithData:data];
    [self.tasks addObject:task];
  }
  
  [self.tableView reloadData];
}

-(void)saveTasks{
  NSMutableArray *tasksToSave = [[NSMutableArray alloc] init];
  for (GMTask *task in self.tasks) {
    [tasksToSave addObject:@{
                             TASK_NAME_KEY : task.name,
                             TASK_DESCRIPTION_KEY : task.taskDescription,
                             TASK_DATE_KEY : task.dueDate,
                             TASK_COMPLETED_KEY : @(task.isConpleted) }];
  }
  
  [[NSUserDefaults standardUserDefaults] setObject:tasksToSave forKey:TASkS_OBJECT_KEY];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

-(GMTask *)taskFromPropertyList:(NSDictionary *)data {
  return [[GMTask alloc] initWithData:data];
}


-(BOOL)isDate:(NSDate *)date1 greaterThan:(NSDate*)date2{
  int date1TimeInterval = [date1 timeIntervalSince1970];
  int date2TimeInterval = [date2 timeIntervalSince1970];
  
  if (date1TimeInterval > date2TimeInterval) {
    return YES;
  }
  
  return NO;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"TaskListCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  // Configure the cell...
  GMTask* task = (GMTask*) self.tasks[indexPath.row];
  [self configureCell:cell withTask:task];
  
  return cell;
}

-(void)configureCell:(UITableViewCell *)cell withTask:(GMTask *)task{
  if (task.isConpleted) {
    cell.backgroundColor = TASK_COMPLETED_COLOR;
  }else {
    if ([self isDate:[NSDate date] greaterThan:task.dueDate]) {
      cell.backgroundColor = TASK_INPAST_COLOR;
    }else{
      cell.backgroundColor = TASK_UNCOMPLETED_COLOR;
    }
  }
  
  cell.textLabel.text = task.name;
  NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  cell.detailTextLabel.text =  [dateFormatter stringFromDate:task.dueDate] ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  GMTask *task = self.tasks[indexPath.row];
  task.isConpleted = !task.isConpleted;
  [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  [self saveTasks];
}

 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    // Delete the row from the data source
    [self.tableView beginUpdates];
    [self.tasks removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    [self saveTasks];
    
  }
  else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
  GMTask *taskToMove = self.tasks[fromIndexPath.row];
  [self.tasks removeObjectAtIndex:fromIndexPath.row];
  [self.tasks insertObject:taskToMove atIndex:toIndexPath.row];
  [self saveTasks];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Return NO if you do not want the item to be re-orderable.
  return YES;
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"toAddTaskVC"]) {
    GMAddTaskViewController* addTaskVC = (GMAddTaskViewController*) [segue.destinationViewController topViewController];
    addTaskVC.delegate = self;
  }else if ([segue.identifier isEqualToString:@"toDetailVC"]){
    GMTaskDetailViewController *detailVC = segue.destinationViewController;
    UITableViewCell *selectedCell = (UITableViewCell*) sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    detailVC.task =  _tasks[indexPath.row];
    detailVC.delegate = self;
  }
}


#pragma mark - GMAddTaskViewControllerDelegate

-(void)didAddTask:(GMTask *)task{
  [self.tasks addObject:task];
  [self.tableView reloadData];
  [self dismissViewControllerAnimated:YES completion:nil];
  [self saveTasks];
}

-(void)didCancel{
  [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - GMTaskEditViewControllerDelegate

-(void)didUpdate{
  [self.tableView reloadData];
  [self saveTasks];
}

#pragma mark - IBActions

- (IBAction)reorderAction:(UIBarButtonItem *)sender {
  if (![self.tableView isEditing]) {
    [self.tableView setEditing:YES animated:YES];
    sender.title = @"Done";
  }else{
    [self.tableView setEditing:NO animated:YES];
    sender.title = @"Re-order";
  }
}
@end
