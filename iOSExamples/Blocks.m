//
//  Blocks.m
//  iOSExamples
//
//  Created by Mike Chen on 2/11/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "Blocks.h"

@implementation Blocks


-(id) init {
    if (self = [super init]) {

        
    }
    return  self;
}

-(void)checkEvenint:(int)integer completionBlock:(CompletionBlock)block {
    
    if (integer == 2) {
        block(TRUE);
    }else {
        block(FALSE);
    }
}

// Use Inline blocks and variable blocks
-(void)testInlineVesusVariableBlocks {
    
    // First test the inline block, the code complete will be wrong
    // we are using an inline block, so just complete the right side
   [self iterateFromOneTo:5 withBlock:^(int number) {
       return  number  * 3;
   }];
    
   // Pass a block by variable
    int(^variableBlock)(int) = ^(int number) {
        return number * 5;
    };
    [self iterateFromOneTo:5 withBlock:variableBlock];
    
    
    // Test the method with a typedef block
    [self iterateFromOneTo:10 withTypDefBlock:^(int number) {
        return number * 10;
    }];
    
}

-(void)iterateFromOneTo:(int)limit withBlock:(int (^)(int))block {
    for (int i=0; i<limit; i++) {
        int numberInt = block(i);
        NSLog(@"%i", numberInt);
    }
}

-(void)iterateFromOneTo:(int)limit withTypDefBlock:(ComputationBlock)block {
    for (int i=0; i<limit;i++) {
        int returnInt = block(i);
        NSLog(@"%i", returnInt);
    }
}


-(void)testEnumeratedBlocks {
    NSArray *testArray = [NSArray arrayWithObjects:@"zero",@"one", @"two", @"three", @"four", nil];
    [testArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@   %i   %s", obj, idx, stop );
        
        if (idx>=3) {
            
            // Stop is equivalent to break, it'll stop the iteration
            *stop = YES;
            NSLog(@"Stopped");
        }
    } ];
}

// How to write the eumerate part
-(void)enumerateObjectsUsingBlock:(void (^) (id obj , NSInteger  idx, BOOL *stop))block {
    
    /*
    for (id obj in self) {
        BOOL stop = NO;
        
        // call the block, is call the callback method in whereever the block literal is defined in ie Object A
        block(obj, idx++, &stop);
        
        if (stop) {
            break;
        }
    }
    */
}

-(void)checkSuccessBlock:(SuccessBlock)success Failure:(ErrorBlock)error {
    
}

-(void)checkSuccessBlock:(void (^)(void))completionBlock onError:(void (^)(NSError *))errorBlock {
    completionBlock();
}

-(void)checkValues:(int)integer completionHandler:(CompletionHandler)blockValue {
    
    if (integer % 2 == 0) {
        blockValue (TRUE, FALSE);
    }else {
        blockValue (FALSE, TRUE);
    }
}

-(void)testBlockMethods {
    
    // Test block by running a uiview with completion block
    [UIView animateWithDuration:0.0 animations:^{
        //
    } completion:^(BOOL finished) {
        if (self.onCompletion) {
            self.onCompletion();
        }
    }];
}

-(void)testSampleBlocks {
    
    /*
    ^void (void) {
        NSLog(@"Testing block sample 1");
    }();
    
    
    ^ {
        NSLog(@"Sample block 2");
    }();
    */
    
    
    // Assigning blocks to variables and calling them
    
    int (^sampleBlock)(int) = ^(int number){
        return number * 3;
    };
    int blockResult = sampleBlock(3);
   // NSLog(@"%i", blockResult);
    
    
    int (^multipleArgumentBlock)(int , int) = ^(int firstInt, int secondInt) {
        return firstInt * secondInt;
    };
    int result = multipleArgumentBlock(3, 5);
    NSLog(@"%i", result);

    
    int (^blockName) (int, int, int) = ^(int firstInt, int secondInt, int thirdInt) {
        return  firstInt * secondInt * thirdInt;
    };
    result = blockName (1,2,3);
    NSLog(@"%i", result);
    
}



@end
































