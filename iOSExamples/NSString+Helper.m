//
//  NSString+Helper.m
//  iOSExamples
//
//  Created by Mike Chen on 2/25/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

-(NSString *)stringByStrippingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(BOOL)isBlank {
    if ([[self stringByStrippingWhitespace] isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

-(void)printString {
    
    //self.stringVal = @"HEl";
    
    
//    NSLog(@" %@   %@", self, self.stringVal);
    NSLog(@"%@", self);
}

@end
