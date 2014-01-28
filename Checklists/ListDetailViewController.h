//
//  ListDetailViewController.h
//  Checklists
//
//  Created by Zhang Honghao on 1/27/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListDetailViewController;
@class Checklist;

@protocol ListDetailViewControllerDelegate <NSObject>

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;

@end


@interface ListDetailViewController : UITableViewController

@property(nonatomic, weak) IBOutlet UITextField *textField;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic, weak) id <ListDetailViewControllerDelegate> delegate;

@property(nonatomic, strong) Checklist *checklistToEdit;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end
