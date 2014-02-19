//
//  Variables.h
//  iOSExamples
//
//  Created by Mike Chen on 1/22/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Variables : NSObject {
    NSString *instanceVariable;
}

@property (nonatomic, readwrite) NSString *propVariable;

-(void)testVariables;

@end
