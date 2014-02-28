//
//  DatabaseManager.h
//  iOSExamples
//
//  Created by Mike Chen on 2/27/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseManager : NSObject

+(DatabaseManager*)databaseManager;

-(void)testNSUserDefaults;
-(void)testPlist;
-(void)testWriteablePlist;

@end
