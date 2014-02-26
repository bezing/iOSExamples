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

+(NSArray*)create2DArrays {
    // Short hand wat to create 2D arrays with @
    NSArray *array2D = @[@[@"1",@"2", @"3"],
                         @[@"4",@"5",@"6"],
                         @[@"7",@"8",@"9"]];
    return array2D;
}

-(void)createArrays {
    
    // Regular Immutable Arrays
    NSArray *inmutArray = [NSArray arrayWithObjects:@"zxzx one", @"two", @"three", nil];
    for (int i=0; i< inmutArray.count; i++) {
//      NSLog(@"%@", [inmutArray objectAtIndex:i]);
        NSLog(@"%@", inmutArray[i]); // faster way
    }
    
    // Mutable Arrays
    //NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    NSMutableArray *mutArray = [NSMutableArray array]; // faster way
    [mutArray addObject:@"four"];
    [mutArray addObject:@"five"];
    [mutArray addObject:@"six"];
    for (NSString *stringObject in mutArray) {
        NSLog(@"%@", stringObject);
    }
    
    // Shorthand way to create arrays
    NSArray *multipleArrays = @[@"one", @"two", @"three"];
    for (NSString *stringObject in multipleArrays) {
        NSLog(@"%@", stringObject);
    }
}

@end























