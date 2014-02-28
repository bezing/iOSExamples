//
//  Operators.m
//  iOSExamples
//
//  Created by Mike Chen on 1/1/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "Operators.h"

@implementation Operators


-(void)testOperations {
    
    //    && is AND
    //    || is OR
    
    int i = 5;
    int j = 6;
    int k = 5;
    

    if (i==5 || k ==6) {
        NSLog(@"TRUE");
    }else {
        NSLog(@"False");
    }
}

-(void)checkTernaryOperator {
    
    /*
     Ternarary operator
     
     result = check condition ? assign this value if TRUE : assign this value if false;
     
    */
    int i = 50;
    i = i < 10 ? 0 : 20;
    NSLog(@"%i", i); // Will print 0 if i < 10 or 20 if value is greater than 9
    
    
    // Can also use this to print bool values to true or false
    BOOL boolValue = FALSE;
    NSLog(boolValue ? @"TRUE" : @"FALSE");

}

enum TestNum {
    NumA= 1,
    NumB= 2,
    NumC= 3
};

-(void)testSwitch {
    int a = 1;
    int b = 5;
    int c = a / b ;
    //NSLog(@"%f", c);
    
    switch (a) {
        case NumA:
            NSLog(@"A");
            break;
            
        case NumC:
            NSLog(@"C");
            break;
            
        default:
            break;
    }

}






@end
