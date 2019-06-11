//
//  NewToDoViewController.h
//  Every.Do
//
//  Created by Cameron Mcleod on 2019-06-11.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

NS_ASSUME_NONNULL_BEGIN

@interface CreateTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *taskDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *taskPriorityTextField;

@end

NS_ASSUME_NONNULL_END
