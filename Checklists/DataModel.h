//
//  DataModel.h
//  Checklists
//
//  Created by Zhang Honghao on 1/27/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

-(void)saveChecklists;
-(void)setIndexOfSelectedChecklist:(NSInteger)index;
-(NSInteger)indexOfSelectedChecklist;
-(void)sortChecklists;

+(NSInteger) nextChecklistItemId;

@end
