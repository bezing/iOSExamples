//
//  ViewController.m
//  iOSExamples
//
//  Created by Mike Chen on 12/27/13.
//  Copyright (c) 2013 Mike Chen. All rights reserved.
//

#import "ViewController.h"
#import "Arrays.h"
#import "Operators.h"
#import "Variables.h"
#import "Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self testClasses];
    
    
    //[self runDailyLineOfCode];
}




enum TestNum {
    NumA= 1,
    NumB= 2,
    NumC= 3
};

// Daily line code
-(void)runDailyLineOfCode {
    
    int i = 0;
    
    while (i<10) {
       // NSLog(@"%i", i);
        i++;
    }
    
    
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
    
    
    
    int test = 0;
    do {
       // NSLog(@"%i", test);
        test++;
    } while (test<50);
    
    
    NSMutableArray *testMutableArray = [[NSMutableArray alloc] init];
    [testMutableArray addObject:@"A"];
    [testMutableArray addObject:@"B"];
    [testMutableArray addObject:@"C"];
    
    for (NSString *stringObject in testMutableArray) {
       // NSLog(@"%@", stringObject);
    }
    
    
    for (int i = 20; i>0; i--) {
        //NSLog(@"%i", i);
    }
    
    
    int sampleInt = 0;
    while (sampleInt < 100) {
        sampleInt +=10;
        NSLog(@"%i", sampleInt);
    }
    
    
    
}

-(void)runBlockSamples {
    // Pass a block to the sample block class' block property
    Blocks *blockClass = [[Blocks alloc] init];
    blockClass.onCompletion = ^{
        NSLog(@"Sample Block");
    };
    
    
    //[blockClass testBlockMethods];
    //[blockClass testSampleBlocks];
    
    
    //    [blockClass checkEvenint:2 completionBlock:^(BOOL even) {
    //        //
    //        if (even) {
    //            NSLog(@"TRUE");
    //        }
    //        else {
    //            NSLog(@"FALSE");
    //        }
    //    }];
    
    
    //    [blockClass checkValues:6 completionHandler:^(BOOL success, BOOL failure) {
    //        if (success) {
    //            NSLog(@"Even number");
    //        }
    //
    //        if (failure) {
    //            NSLog(@"Odd");
    //        }
    //    }];
    
    
    //    [blockClass checkSuccessBlock:^{
    //        NSLog(@"Success Block");
    //    } onError:^(NSError *error) {
    //        NSLog(@"Error block");
    //    }];
    
    
    //[blockClass testEnumeratedBlocks];
    //[blockClass testSampleBlocks];
     
    [blockClass testInlineVesusVariableBlocks];
}

-(void)testClasses {
    Arrays *array = [[Arrays alloc] init];
   // [array createStrings];
   // [array printArray];
   // [array createArrays];
    
    Operators *operator = [[Operators alloc] init];
    //[operator testOperations];
    
    
    Variables *variables = [[Variables alloc] init];
    
    
    [self runBlockSamples];
    
}





@end















