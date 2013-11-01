//
//  GMTableViewController.m
//  UITableViewController Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-21.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMTableViewController.h"

enum TableViewSection {
  TableViewSection1 = 0,
  TableViewSection2,
  TableViewSection3,
  TableViewSectionCount
};

enum TableViewRow {
  TableViewRowSection1 = 2,
  TableViewRowSection2 = 1,
  TableViewRowSection3 = 3
};


@interface GMTableViewController ()

@end

@implementation GMTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return TableViewSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  int nbRow;
  switch (section) {
    case TableViewSection1:
      nbRow = TableViewRowSection1;
      break;
    case TableViewSection2:
      nbRow = TableViewRowSection2;
      break;
    case TableViewSection3:
      nbRow = TableViewRowSection3;
      break;
  }
  
  return nbRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
  [self configureCell:cell atIndexPath:indexPath];
  
    return cell;
}

- (void)configureCell:(UITableViewCell*) cell atIndexPath:(NSIndexPath*) indexPath {
  switch (indexPath.section) {
    case TableViewSection1:
      cell.textLabel.text = @"I am in section 0";
      cell.textLabel.textColor = [UIColor redColor];
      break;
    case TableViewSection2:
      cell.textLabel.text = @"another section";
      cell.textLabel.textColor = [UIColor blueColor];
      break;
    case TableViewSection3:
      cell.textLabel.text = [NSString stringWithFormat:@"cell %i",indexPath.row];
      cell.textLabel.textColor = [UIColor yellowColor];
      break;
  }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
