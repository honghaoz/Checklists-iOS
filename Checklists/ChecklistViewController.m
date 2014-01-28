//
//  ChecklistViewController.m
//  Checklist
//
//  Created by Zhang Honghao on 1/25/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import "ChecklistViewController.h"
#import "ChecklistItem.h"
#import "Checklist.h"

@interface ChecklistViewController ()

@end

@implementation ChecklistViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.title = self.checklist.name;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// configure each cell

-(void)configureCheckMarkForCell: (UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    if (item.checked) {
        label.text = @"◉";
    } else {
        label.text = @"◎";
    }
    label.textColor = self.view.tintColor;
    
    UILabel *subLabel = (UILabel *)[cell viewWithTag:1002];
    
    if (item.shouldRemind) {
        NSDateFormatter *dateFormatUsedForCompareDay = [[NSDateFormatter alloc] init];
        [dateFormatUsedForCompareDay setDateFormat:@"yyyy-MM-dd"];
        //get today's date
        NSDate *dateToday = [NSDate date];
        // if not today
        if (![[dateFormatUsedForCompareDay stringFromDate:dateToday] isEqualToString:[dateFormatUsedForCompareDay stringFromDate:item.dueDate]]){
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            [formatter setDateStyle:NSDateFormatterShortStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            NSString *dateString = [formatter stringForObjectValue:item.dueDate];
            //    NSString *dateString = [NSDateFormatter localizedStringFromDate:item.dueDate
            //                                                          dateStyle:NSDateFormatterShortStyle
            //                                                          timeStyle:NSDateFormatterFullStyle];
            subLabel.text = [NSString stringWithFormat: @"Due: %@", dateString];
        } else {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            NSString *dateString = [formatter stringForObjectValue:item.dueDate];
            subLabel.text =[NSString stringWithFormat:@"Due: Today, %@",dateString];
        }
    }
    else {
        subLabel.text = @"No reminder";
        subLabel.alpha = 1.0f;
    }
    
    
}

-(void) configureTextForCell:(UITableViewCell *)cell withChecklistItem: (ChecklistItem *)item{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}


// return number of rows in a section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.checklist.items count];
}

-(UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    ChecklistItem *item = self.checklist.items[indexPath.row];
    [self configureCheckMarkForCell:cell withChecklistItem:item];
    [self configureTextForCell:cell withChecklistItem:item];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ChecklistItem *item = self.checklist.items[indexPath.row];
    [item toggleChecked];
    
    [self configureCheckMarkForCell:cell withChecklistItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.checklist.items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

//Protocol methods
-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)itemDetailViewControl:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item {
    int newRowIndex = (int)[self.checklist.items count];
    [self.checklist.items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureCheckMarkForCell:cell withChecklistItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)itemDetailViewControl:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item{
    NSInteger index = [self.checklist.items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckMarkForCell:cell withChecklistItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}

// set delegate
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AddItem"]){
        //1
        UINavigationController *navigationController = segue.destinationViewController;
        //2
        ItemDetailViewController *controller = (ItemDetailViewController*) navigationController.topViewController;
        //3
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        
        // hard part!
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        controller.itemToEdit = self.checklist.items[indexPath.row];
    }
}

@end
