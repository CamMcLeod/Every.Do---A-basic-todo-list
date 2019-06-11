//
//  ToDo.h
//  Every.Do
//
//  Created by Cameron Mcleod on 2019-06-11.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToDo : NSObject

@property NSString *taskTitle;
@property NSString *toDoDescription;
@property NSInteger priorityNumber;

@end

NS_ASSUME_NONNULL_END



/*

 User should be able to view a list of all their todos
 
 Create a Todo object which has the following properties: - title - todo description (note: a property cannot be named description, as that's already in use) - priority number - is completed indicator
 
 
 Create a new UITableView
 Create a custom UITableViewCell subclass that displays the title, a one-line preview of the task description, the priority level.
 When the view loads, display all of the todos.
 This will require you to implement the delegate and data source methods to display a cell for each todo item.

*/

