//
//  NSPredicateClass.h
//  iOSExamples
//
//  Created by Mike Chen on 2/26/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPredicateClass : NSObject

@property (nonatomic, readwrite) NSString *firstName;
@property (nonatomic, readwrite) NSString *lastName;
@property (nonatomic, readwrite) NSNumber *age;

-(void)testNSPredicate;

@end
