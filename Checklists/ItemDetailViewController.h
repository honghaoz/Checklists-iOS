//
//  ItemDetailViewController.h
//  Checklists
//
//  Created by Zhang Honghao on 1/26/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChecklistsItem.h"
@class ItemDetailViewController;


@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)itemDetailViewControllerDidCancel: (ItemDetailViewController *)controller;
-(void)itemDetailViewControl:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistsItem *)item;
-(void)itemDetailViewControl:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistsItem *)item;

@end

@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) id <ItemDetailViewControllerDelegate> delegate;

@property (nonatomic, strong) ChecklistsItem *itemToEdit;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;
@end
