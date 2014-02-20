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
    //[blockClass testInlineVesusVariableBlocks];

    
    NSMutableArray *movieQueue = [NSMutableArray arrayWithObjects:@"Inception", @"Book of Eli", @"Independence Day", nil];
    // Initialize a class with a callback
    Blocks *block = [[Blocks alloc] initWithCallback:^(NSString *title) {
       // NSLog(@"Removing %@", title);
        // Array becomes part of the state of the block, dont need to use __block for movieQueue
        // because we are modifiying it's contents but where where the array pointer is pointing
        [movieQueue removeObject:title];
    }];
    
    // playMovie method calls the callback
    //[blockClass playMovie:@"Inception"];
    
    // Have to use [NSArray arrayWithArray which returns the instance
    // of the arrays otherwise if you just use movieQueue you will
    // be removing instances from the actual collection while it is in used
    for (NSString *movieTitle in [NSArray arrayWithArray:movieQueue]) {
        //[block playMovie:movieTitle];
    }
    
    // Test daily block
   __block int localVariable = 5;
    // The type for the second parameter is a pointer to bool value
    [self runBlock:^(int number, bool *stop) {
        localVariable *= number;
        NSLog(@"Number: %i   %i", number, localVariable);
        
        if (number>=5) {
        // We have a reference to a bool value passed through the parameter
            *stop = TRUE;
        }
    }];
}

-(void)runBlock:(void(^)(int number, bool *stop))block{
    for (int i=1; i<10; i++) {
        bool stopIteration = FALSE;
        // & gives you the memory address, so we are passing a reference to the
        // memory address through the parameter so we can access and change it
        // to stop the iteration.
        // stopIteration without * or & is a primitive
        block(i, &stopIteration);
        if (stopIteration) {
            break;
        }
    }
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















