//
//  GMAddTaskViewController.m
//  Overdue Task List
//
//  Created by Guillaume Maka on 2013-11-04.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMAddTaskViewController.h"

enum GMTableViewRow {
  GMTableViewRowName = 0,
  GMTableViewRowDescription,
  GMTableViewRowDueDate,
  GMTableViewRowDatePicker
};

@interface GMAddTaskViewController () {
  BOOL _datePickerVisible;
}
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (void) setUp;
- (void) dismissKeyboard:(id) sender;
@end

@implementation GMAddTaskViewController

- (void)setUp
{
  UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
  [toolbar sizeToFit];
  toolbar.barStyle = UIBarStyleDefault;
  
  toolbar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                     style:UIBarButtonItemStyleDone
                                                    target:self
                                                    action:@selector(dismissKeyboard:)]
                    ];
  _descriptionTextView.inputAccessoryView = toolbar;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  _datePickerVisible = NO;
  [self setUp];
}

-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
  [_datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
}

-(void)viewWillDisappear:(BOOL)animated{
  [_datePicker removeTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


-(void) datePickerValueChange:(id)sender{
  UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:GMTableViewRowDueDate inSection:0]];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterLongStyle];
  cell.detailTextLabel.text = [dateFormatter stringFromDate:_datePicker.date];
}

-(void)dismissKeyboard:(id)sender{
  [_descriptionTextView resignFirstResponder];
}

#pragma mark - UITableViewControllerDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.row) {
    case GMTableViewRowName :
      [_taskNameTextField becomeFirstResponder];
      break;
    case GMTableViewRowDescription:
      [_descriptionTextView becomeFirstResponder];
      break;
    case GMTableViewRowDueDate :
      if ([_taskNameTextField isFirstResponder]) {
        [_taskNameTextField resignFirstResponder];
      }else if ([_descriptionTextView isFirstResponder]){
        [_descriptionTextView resignFirstResponder];
      }
      _datePickerVisible = !_datePickerVisible;
      [tableView beginUpdates];
      [tableView endUpdates];
      break;
    default:
      break;
  }
  
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.row == GMTableViewRowDatePicker) {
    if (_datePickerVisible) {
      return _datePicker.frame.size.height;
    }else {
      return 0.0f;
    }
    return 0.0;
  }else if(indexPath.row == GMTableViewRowDescription){
    return 147.0f;
  }
  
  return tableView.rowHeight;
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  if (textField == _taskNameTextField) {
    [_descriptionTextView becomeFirstResponder];
  }
  return NO;
}

#pragma mark - IBActions

- (IBAction)cancelAction:(id)sender {
  [self.delegate didCancel];
}

- (IBAction)doneAction:(id)sender {
  GMTask* task = [[GMTask alloc] init];
  task.name = _taskNameTextField.text;
  task.taskDescription = _descriptionTextView.text;
  task.dueDate = _datePicker.date;
  task.isConpleted = NO;
  
  [self.delegate didAddTask:task];
}
@end
