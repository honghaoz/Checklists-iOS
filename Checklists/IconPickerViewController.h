//
//  IconPickerViewController.h
//  Checklists
//
//  Created by Zhang Honghao on 1/28/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>

-(void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName;

@end

@interface IconPickerViewController : UITableViewController

@property(nonatomic, weak)id <IconPickerViewControllerDelegate> delegate;

@end
