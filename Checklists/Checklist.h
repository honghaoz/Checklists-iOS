//
//  Checklist.h
//  Checklists
//
//  Created by Zhang Honghao on 1/27/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;

@property(nonatomic,strong) NSMutableArray *items;

@property(nonatomic, copy) NSString *iconName;

-(int)countUncheckedItems;

@end
