//
//  ViewControllerB.m
//  iOSExamples
//
//  Created by Mike Chen on 2/23/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//


#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self showDataValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)passingData:(NSString *)dataString {
    self.methodString = dataString;
}

-(void)showDataValues {
    // Data passed from A to B with properties and methods
    NSLog(@"%@", self.dataString);
    NSLog(@"%@", self.methodString);
    if (self.segueDataString) {
        NSLog(@"Seque Data:%@", self.segueDataString);
    }
}

- (IBAction)passDataBackWithDelegation:(id)sender {
    // Pass data back to A through Delegation
    if (self.delegate != nil) {
        if ([self.delegate respondsToSelector:@selector(exchangeData:)]) {
            [self.delegate exchangeData:@"Passing string from B to A  through delegation"];
        }
    }
}

- (IBAction)passDataBackWithBlocks:(id)sender {
    // Data passed from B to A through blocks
    if (self.dataBlock) {
        self.dataBlock(@"Data string from B to A with blocks");
    }
}

@end
















