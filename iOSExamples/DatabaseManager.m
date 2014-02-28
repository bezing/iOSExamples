//
//  DatabaseManager.m
//  iOSExamples
//
//  Created by Mike Chen on 2/27/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "DatabaseManager.h"

@implementation DatabaseManager

static DatabaseManager *databaseManager = nil;

+(DatabaseManager*)databaseManager {
    if (!databaseManager) {
        databaseManager = [[DatabaseManager alloc] init];
    }
    return databaseManager;
}

-(void)testNSUserDefaults {
    // Store strings and arrays
    NSString *stringValue = @"String Value in User Defaults";
    
    [[NSUserDefaults standardUserDefaults] setObject:stringValue forKey:@"string"];
    
    NSArray *arrayValue = [NSArray arrayWithObjects:@"one",@"two",@"three", nil];
    NSArray *anotherArray = @[@"four",@"five",@"six"];
    [[NSUserDefaults standardUserDefaults] setObject:arrayValue forKey:@"arrayValue"];
    [[NSUserDefaults standardUserDefaults] setObject:anotherArray forKey:@"anotherArray"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // Pull the values
    NSString *retrivedString = [[NSUserDefaults standardUserDefaults] objectForKey:@"string"];
    NSArray *retreivedArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"arrayValue"];
    NSArray *retrivedAnotherArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"anotherArray"];
    NSLog(@"%@  %@   %@", retrivedString, retreivedArray, retrivedAnotherArray);
}

// Date formatter
-(NSDateFormatter *)dateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-YYYY HH:mm:ss"];
    return formatter;
}

-(void)testPlist {
    // Read the plist from our read only Applications bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DatabasePlist" ofType:@"plist"];
    
    // Using dictionaries for plist but can use arrays
    NSDictionary *plistDictionary= [[NSDictionary alloc] initWithContentsOfFile:path];

    [self printPlistDictionart:plistDictionary];
}

-(void)testWriteablePlist {
    /*
     We want to create a writable copy of our plist in app bundle so we use NSFileManager to 
     copy the file to the documents directory
    */
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) lastObject];
    destPath = [destPath stringByAppendingString:@"DatabasePlist.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:destPath]) {
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"DatabasePlist" ofType:@"plist"];
        [fileManager copyItemAtPath:sourcePath toPath:destPath error:nil];
    }
    
  // In hair app, I use NSFileManager to find the contents at a path but this returns a NSArray
  // I need to return NSMutableDictionary so I can change the values
  // NSArray *plistArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:destPath error:nil];
    
    /*
     Now we grab the newly created plist in documents directory and write to it.
    */
    NSMutableDictionary *plistDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:destPath];
    [self printPlistDictionart:plistDictionary];
    
    [plistDictionary setValue:@"Changed String" forKey:@"stringValue"];
    NSDate *date = [NSDate date];
    [plistDictionary setValue:date forKey:@"dateValue"];
    NSArray *newArray = @[@"X", @"Y", @"Z"];
    [plistDictionary setValue:newArray forKey:@"arrayValue"];
    
    [plistDictionary writeToFile:destPath atomically:YES];
    
    [self printPlistDictionart:plistDictionary];
}

-(void)printPlistDictionart:(NSDictionary*)dictionary {
    NSDictionary *plistDictionary = dictionary;
    
    NSString *stringValue = [plistDictionary objectForKey:@"stringValue"];
    NSDate *dateValue = [plistDictionary objectForKey:@"dateValue"];
    NSArray *arrayValue = [plistDictionary objectForKey:@"arrayValue"];
    NSDateFormatter *formatter = [self dateFormatter];
    
    NSLog(@"%@  %@  %@", stringValue, [formatter stringFromDate:dateValue], arrayValue);
}

@end



































