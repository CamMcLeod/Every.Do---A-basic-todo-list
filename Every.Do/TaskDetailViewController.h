//
//  TaskDetailViewController.h
//  Every.Do
//
//  Created by Cameron Mcleod on 2019-06-11.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskToDoTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaskDetailViewController : UIViewController

@property (strong, nonatomic) TaskToDoTableViewCell *incomingCell;

@end
NS_ASSUME_NONNULL_END
