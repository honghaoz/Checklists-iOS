//
//  ChecklistViewController.h
//  Checklist
//
//  Created by Zhang Honghao on 1/25/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController <ItemDetailViewControllerDelegate>

@property (nonatomic, strong) Checklist *checklist;

@end
