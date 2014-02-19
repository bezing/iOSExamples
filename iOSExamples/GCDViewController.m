//
//  GCDViewController.m
//  iOSExamples
//
//  Created by Mike Chen on 1/31/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController


/*
 Example to show difference with and without multithreading. Press the first and second button
 and try to update the picker, the first will block the app while the second (GCD)
 will process the work in the background thread. The result label is to show that you 
 should dispatch the queue back to the main thread for UI updates.
*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)operationOnMainThreadPressed:(id)sender {
    [self runLongOperation];
}

dispatch_queue_t myQueue;
- (IBAction)operationOnGCDPressed:(id)sender {
    
    // Create queue
    myQueue = dispatch_queue_create("com.lynda.gcdtest", NULL);
    
    // Run queue and block with Grand Central Dispath
    dispatch_async(myQueue, ^{
        
        // Simulate long operation
        [NSThread sleepForTimeInterval:3];
        
        // Update the label on main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.timeLabel setText:[NSString stringWithFormat:@"Result: %d", arc4random()]];
        });
    });
}

-(void)runLongOperation {
    // Sleep
    [NSThread sleepForTimeInterval:3];
    [self.timeLabel setText:[NSString stringWithFormat:@"Result: %d", arc4random()]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




























