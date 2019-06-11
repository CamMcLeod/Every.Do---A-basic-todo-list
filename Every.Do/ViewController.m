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
    int toDoCapacity = 7;
    self.toDoTableView.delegate = self;
    self.toDoTableView.dataSource = self;
    
    toDoArray = [[NSMutableArray alloc] initWithCapacity:toDoCapacity];
    
    for (int i = 0; i <toDoCapacity; i++) {
        
        ToDo *task = [[ToDo alloc] init];
        task.taskTitle = [NSString stringWithFormat:@"Task: %d", i ];
        task.toDoDescription = [NSString stringWithFormat:@"Do this %d times", i ];
        task.priorityNumber = (NSInteger)(toDoCapacity - i);
        toDoArray[i] = task;
        NSLog(@"task '%@' added to array", [toDoArray[i] taskTitle]);
        
    }
    
//    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"raccoon.jpg"]];
//    [tempImageView setFrame:self.toDoTableView.frame];
//    tempImageView.contentMode = UIViewContentModeScaleAspectFill;
//    tempImageView.alpha = 0.75;
//    self.toDoTableView.backgroundView = tempImageView;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showTaskDetailSegue"]) {
        [segue.destinationViewController performSelector:@selector(setIncomingCell:) withObject:sender];
        
    }
}

- (IBAction)unwindToViewController:(UIStoryboardSegue *)unwindSegue {
    
    CreateTaskViewController *newTaskViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
    
    ToDo *taskSave = [[ToDo alloc] init];
    taskSave.taskTitle = [newTaskViewController taskNameTextField].text;
    taskSave.toDoDescription = [newTaskViewController taskDescriptionTextField].text;
    taskSave.priorityNumber = [[newTaskViewController taskPriorityTextField].text integerValue];
    
    NSLog(@"New task '%@' created", taskSave.taskTitle);
    
    [toDoArray addObject:taskSave];
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
