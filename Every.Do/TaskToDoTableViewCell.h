//
//  TaskToDoTableViewCell.h
//  Every.Do
//
//  Created by Cameron Mcleod on 2019-06-11.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskToDoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskPriorityLabel;

@end

NS_ASSUME_NONNULL_END
