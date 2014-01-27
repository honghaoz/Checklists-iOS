//
//  AddItemViewController.m
//  Checklists
//
//  Created by Zhang Honghao on 1/26/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
//    NSLog(@"Current text is %@", self.textField.text);
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    ChecklistsItem *item = [[ChecklistsItem alloc] init];
    
    item.text = self.textField.text;
    item.checked= NO;
    [self.delegate addItemViewControl:self didFinishAddingItem:item];
}

- (IBAction)cancel:(id)sender {
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate addItemViewControllerDidCancel:self];
}

-(NSIndexPath *)tableView: (UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newText length] > 0) {
        self.doneBarButton.enabled = YES;
    } else {
        self.doneBarButton.enabled = NO;
    }
    return YES;
}

@end
