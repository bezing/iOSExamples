//
//  DataManager.h
//  iOSExamples
//
//  Created by Mike Chen on 2/21/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+(DataManager *)dataManager;

@property (nonatomic, readwrite) NSMutableArray *allDataArray;
@property (nonatomic, readwrite) NSMutableArray *textDataArray;
@property (nonatomic, readwrite) NSMutableArray *imageDataArray;


-(void)loadJSONDataWithCompletionBlock:(void (^) (void)) block ;

@end
