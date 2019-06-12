//
//  ViewController.m
//  Every.Do
//
//  Created by Cameron Mcleod on 2019-06-11.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "ViewController.h"
#import "ToDo.h"
#import "TaskToDoTableViewCell.h"
#import "CreateTaskViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *toDoTableView;

@end

@implementation ViewController{
    
    NSMutableArray *toDoArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     int toDoCapacity = 3;
    self.toDoTableView.delegate = self;
    self.toDoTableView.dataSource = self;
    toDoArray = [[NSMutableArray alloc] initWithCapacity:3];
    
    ToDo *task = [[ToDo alloc] init];
    task.taskTitle = @"My First Task";
    task.toDoDescription = @"Example Task - swipe to complete";
    task.priorityNumber = 99;
    toDoArray[0] = task;
    NSLog(@"task '%@' added to array", [toDoArray[0] taskTitle]);
    
    task = [[ToDo alloc] init];
    task.taskTitle = @"My Second Task";
    task.toDoDescription = @"Example Task - swipe to complete";
    task.priorityNumber = 99;
    toDoArray[1] = task;
    NSLog(@"task '%@' added to array", [toDoArray[1] taskTitle]);
    
    task = [[ToDo alloc] init];
    task.taskTitle = @"My Third Task";
    task.toDoDescription = @"Example Task - swipe to complete";
    task.priorityNumber = 99;
    toDoArray[2] = task;
    NSLog(@"task '%@' added to array", [toDoArray[2] taskTitle]);
    
    
}

// segues

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showTaskDetailSegue"]) {
        [segue.destinationViewController performSelector:@selector(setIncomingCell:) withObject:sender];
        
    }
}

//- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView
leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    TaskToDoTableViewCell *swipedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (swipedCell.accessoryType == UITableViewCellAccessoryNone){
        swipedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        swipedCell.backgroundColor = [UIColor lightGrayColor];
        
        NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:[toDoArray count]-1 inSection:0];

        NSLog(@"%@", indexPath);
        NSLog(@"%@", destinationIndexPath);
        [self.toDoTableView moveRowAtIndexPath:indexPath toIndexPath:destinationIndexPath];
        
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [toDoArray removeObjectAtIndex:indexPath.row];
        [_toDoTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// add task to array

- (IBAction)unwindToViewController:(UIStoryboardSegue *)unwindSegue {
    
    CreateTaskViewController *newTaskViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
    
    ToDo *taskSave = [[ToDo alloc] init];
    taskSave.taskTitle = [newTaskViewController taskNameTextField].text;
    taskSave.toDoDescription = [newTaskViewController taskDescriptionTextField].text;
    taskSave.priorityNumber = [[newTaskViewController taskPriorityTextField].text integerValue];
    
    NSLog(@"New task '%@' created", taskSave.taskTitle);
    [toDoArray insertObject:taskSave atIndex:0];
    NSLog(@"%@", toDoArray);
    [self.toDoTableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [toDoArray count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Fetch a cell of the appropriate type.
    TaskToDoTableViewCell *taskCell = [tableView dequeueReusableCellWithIdentifier:@"taskCellIdentifier" forIndexPath:indexPath];
    // Configure the cell’s contents.

    ToDo *tasksToDo = toDoArray[indexPath.row];
    
    taskCell.taskLabel.text = tasksToDo.taskTitle;
    taskCell.taskDescriptionLabel.text = tasksToDo.toDoDescription;
    taskCell.taskPriorityLabel.text = [NSString stringWithFormat:@"%ld", tasksToDo.priorityNumber];

    return taskCell;

    
}

@end
