//
//  ListDetailViewController.h
//  Checklists
//
//  Created by Zhang Honghao on 1/27/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconPickerViewController.h"
@class ListDetailViewController;
@class Checklist;


@protocol ListDetailViewControllerDelegate <NSObject>

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;

@end


@interface ListDetailViewController : UITableViewController <UITextFieldDelegate, IconPickerViewControllerDelegate>

@property(nonatomic, weak) IBOutlet UITextField *textField;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic, weak) id <ListDetailViewControllerDelegate> delegate;

@property(nonatomic, strong) Checklist *checklistToEdit;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end
