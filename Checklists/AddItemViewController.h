//
//  AddItemViewController.h
//  Checklists
//
//  Created by Zhang Honghao on 1/26/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChecklistsItem.h"
@class AddItemViewController;


@protocol AddItemViewControllerDelegate <NSObject>

-(void)addItemViewControllerDidCancel: (AddItemViewController *)controller;
-(void)addItemViewControl:(AddItemViewController *)controller didFinishAddingItem:(ChecklistsItem *)item;

@end

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) id <AddItemViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;
@end
