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
typedef void (^MoviePlayerCallbackBlock)(NSString *);

@interface Blocks : NSObject

@property (nonatomic, copy) void (^onCompletion)(void);
@property (nonatomic, copy) void (^MoviePlayerCallbackBlock)(NSString*);

-(void)testBlockMethods;
-(void)testSampleBlocks;
-(void)checkEvenint:(int)integer completionBlock:(CompletionBlock)block;
-(void)checkValues:(int)integer completionHandler:(CompletionHandler)blockValue;
-(void)checkSuccessBlock:(void (^)(void)) completionBlock
                 onError:(void (^)(NSError* error)) errorBlock;
-(void)testEnumeratedBlocks;

//    The "(int(^)(int)) represents the type of block, just like int is a type
// typedef int(^ComputionBlock)(int) which is the same line above
-(void)iterateFromOneTo:(int)limit withBlock:(int (^) (int)) block;
-(void)iterateFromOneTo:(int)limit withTypDefBlock:(ComputationBlock)block;
-(void)testInlineVesusVariableBlocks;

// The parenthesis before the block is the type of block so void is the return
// The caret signals block, the right parenthesis signals parameters
-(void)runIterationTo:(int)iterationLimit withCompletionBlock: (void(^)(int number , BOOL *success)) block ;

-(ComputationBlock)returnBlock:(int)x;

-(id)initWithCallback:(MoviePlayerCallbackBlock)block;
-(void)playMovie:(NSString*)title;


@end






















































