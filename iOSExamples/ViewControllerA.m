//
//  ViewControllerA.m
//  iOSExamples
//
//  Created by Mike Chen on 2/23/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

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
    
    
    NSLog(@"A loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushViewControllerB:(id)sender {
    ViewControllerB *vcB = (ViewControllerB *)[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerB"];
    [self passDataToViewController:vcB];
    [self.navigationController pushViewController:vcB animated:YES];
}

-(void)passDataToViewController:(ViewControllerB*)vcB {
    
    vcB.dataString = @"Passing value from A to B's property";
    [vcB passingData:@"Passing value from A to B's method parameter"];
    
    // Set A as a delegate of B to pass data back with delegation
    vcB.delegate = self;
    
    // Pass data back from B to A with blocks
    vcB.dataBlock = ^ (NSString *dataString) {
        NSLog(@"%@", dataString);
    };
}

// Pass data through A to B through storyboard seques
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showViewControllerB"]) {
        ViewControllerB *vcB = (ViewControllerB*)segue.destinationViewController;
        vcB.segueDataString = @"Data from A to B with seques";
        
        // Pass the other types of data exhange
        [self passDataToViewController:vcB];
    }
}

// Delegate method of B
-(void)exchangeData:(NSString *)dataString {
    NSLog(@"%@", dataString);
}

@end




























