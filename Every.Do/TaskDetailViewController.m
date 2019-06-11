//
//  TaskDetailViewController.m
//  Every.Do
//
//  Created by Cameron Mcleod on 2019-06-11.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "TaskDetailViewController.h"

@interface TaskDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskPriorityLabel;

@end

@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _incomingCell = self.incomingCell;
//    _taskLabel = self.taskLabel;
//    _taskDescriptionLabel = self.taskDescriptionLabel;
//    _taskPriorityLabel = self.taskPriorityLabel;
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"raccoon.jpg"]];
    [tempImageView setFrame:self.view.frame];
    tempImageView.contentMode = UIViewContentModeScaleAspectFill;
    tempImageView.alpha = 0.75;
    [self.view addSubview:tempImageView];
    [self.view sendSubviewToBack:tempImageView];
    
    NSString *incomingTaskName = self.incomingCell.taskLabel.text;
    NSString *incomingDescription = self.incomingCell.taskDescriptionLabel.text;
    NSString *incomingPriority = self.incomingCell.taskPriorityLabel.text;
    
    self.taskLabel.text = incomingTaskName;
    self.taskDescriptionLabel.text = incomingDescription;
    self.taskPriorityLabel.text = incomingPriority;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
