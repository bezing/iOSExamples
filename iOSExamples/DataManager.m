//
//  DataManager.m
//  iOSExamples
//
//  Created by Mike Chen on 2/21/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "DataManager.h"
#import "Constants.h"

@implementation DataManager

static DataManager *dataManager = nil;

+(DataManager*)dataManager {
    if (!dataManager) {
        // Create the singleton
        dataManager = [[DataManager alloc] init];
    }
    return dataManager;
};

-(void)loadJSONDataWithCompletionBlock:(void (^)(void))block {
    // Grab the data with [NSData dataWithContents but do this asynchronously with a background thread
    dispatch_async(kBgQueue, ^{
        
        NSError *error = nil;
        // Load data from the network
        NSData *data = [NSData dataWithContentsOfURL:kFuzzURL options:0 error:&error];
        // If error just return
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        // Parse the JSON data on the main thread and reload the table view
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = nil;
            // The JSON data returned is an array (of dictionaries in this case)
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            self.allDataArray = [[NSMutableArray alloc ] init];
            self.textDataArray = [[NSMutableArray alloc] init];
            self.imageDataArray = [[NSMutableArray alloc] init];
            
            for (NSDictionary *dictionaryData in array) {
                NSDictionary *dataDictionary = dictionaryData;
                if ([[dataDictionary objectForKey:@"type"] isEqualToString:@"text"]) {
                    [self.textDataArray addObject:dataDictionary];
                }
                if ([[dataDictionary objectForKey:@"type"] isEqualToString:@"image"]) {
                    [self.imageDataArray addObject:dataDictionary];
                }
                
                [self.allDataArray addObject:dataDictionary];
            }
            
            // Runs the block from the ViewController which adds the json data
            // to all three table view controller data and reload's the tvc's as well
            block();
        });
    });
}

@end
























