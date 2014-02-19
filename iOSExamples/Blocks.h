//
//  Blocks.h
//  iOSExamples
//
//  Created by Mike Chen on 2/11/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock) (BOOL);
typedef void(^CompletionHandler)(BOOL, BOOL);
typedef void (^SuccessBlock)(BOOL);
typedef void (^ErrorBlock)(BOOL);
typedef int (^ComputationBlock)(int);

// how to define nsstring as a return argument in blocks?


@interface Blocks : NSObject

@property (nonatomic, copy) void (^onCompletion)(void);

-(void)testBlockMethods;
-(void)testSampleBlocks;
-(void)checkEvenint:(int)integer completionBlock:(CompletionBlock)block;
-(void)checkValues:(int)integer completionHandler:(CompletionHandler)blockValue;
-(void)checkSuccessBlock:(SuccessBlock)success Failure:(ErrorBlock)error;
-(void)checkSuccessBlock:(void (^)(void)) completionBlock
                 onError:(void (^)(NSError* error)) errorBlock;
-(void)testEnumeratedBlocks;

// The "(int(^)(int)) repsents the type of block, just like int is a type
-(void)iterateFromOneTo:(int)limit withBlock:(int (^) (int)) block;
-(void)iterateFromOneTo:(int)limit withTypDefBlock:(ComputationBlock)block;
-(void)testInlineVesusVariableBlocks;


@end






















































