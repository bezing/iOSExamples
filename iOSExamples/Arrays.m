//
//  Arrays.m
//  iOSExamples
//
//  Created by Mike Chen on 12/27/13.
//  Copyright (c) 2013 Mike Chen. All rights reserved.
//

#import "Arrays.h"

@interface Arrays ()

@property (nonatomic, strong) NSMutableArray *stringArrays;

@end

@implementation Arrays

-(NSMutableArray*)stringArrays {
    
    if (!_stringArrays) {
    _stringArrays = [[NSMutableArray alloc ]init];
    }
    return _stringArrays;
}

-(void)createStrings {
    [self.stringArrays addObject:@"test"];
    [self.stringArrays addObject:@"car"];
}

-(void)printArray {
    for (NSString *string in self.stringArrays) {
        NSLog(@"%@", string);
    }    
}

-(void)createArrays {
    
    // Regular Immutable Arrays
    NSArray *inmutArray = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
    for (int i=0; i< inmutArray.count; i++) {
        NSLog(@"%@", [inmutArray objectAtIndex:i]);
    }
    
    // Mutable Arrays
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    [mutArray addObject:@"four"];
    [mutArray addObject:@"five"];
    [mutArray addObject:@"six"];
    for (NSString *stringObject in mutArray) {
        NSLog(@"%@", stringObject);
    }
    
}

@end























