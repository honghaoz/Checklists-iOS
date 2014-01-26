//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Zhang Honghao on 1/25/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistsItem.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController {
    ChecklistsItem *_row0item;
    ChecklistsItem *_row1item;
    ChecklistsItem *_row2item;
    ChecklistsItem *_row3item;
    ChecklistsItem *_row4item;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _row0item = [[ChecklistsItem alloc] init];
    _row0item.text = @"Aaaaaaaa";
    _row0item.checked = NO;
    
    _row0item = [[ChecklistsItem alloc] init];
    _row0item.text = @"BBBBaaaaaa";
    _row0item.checked = NO;
    
    _row0item = [[ChecklistsItem alloc] init];
    _row0item.text = @"CCCCaaaaa";
    _row0item.checked = NO;
    
    _row0item = [[ChecklistsItem alloc] init];
    _row0item.text = @"DDDDaaaaa";
    _row0item.checked = NO;
    
    _row0item = [[ChecklistsItem alloc] init];
    _row0item.text = @"EEEEaaaaa";
    _row0item.checked = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    BOOL isChecked = NO;
    if (indexPath.row == 0){
        isChecked = _row0item.checked;
    } else if (indexPath.row == 1){
        isChecked = _row1item.checked;
    } else if (indexPath.row == 2){
        isChecked = _row2item.checked;
    } else if (indexPath.row == 3){
        isChecked = _row3item.checked;
    } else if (indexPath.row == 4){
        isChecked = _row4item.checked;
    }
    
    if (isChecked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    if (indexPath.row == 0) {
        label.text = _row0item.text;
    } else if (indexPath.row == 1) {
        label.text = _row1item.text;
    } else if (indexPath.row == 2) {
        label.text = _row2item.text;
    } else if (indexPath.row == 3) {
        label.text = _row3item.text;
    } else if (indexPath.row == 4) {
        label.text = _row4item.text;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    
    if (indexPath.row == 0) {
        _row0item.checked = !_row0item.checked;
    } else if (indexPath.row == 1) {
        _row1item.checked = !_row1item.checked;
    } else if (indexPath.row == 2) {
        _row2item.checked = !_row2item.checked;
    } else if (indexPath.row == 3) {
        _row3item.checked = !_row3item.checked;
    } else if (indexPath.row == 4) {
        _row4item.checked = !_row4item.checked;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    [tableView deselectRowAtIndexPath: indexPath animated:YES];
}

@end
