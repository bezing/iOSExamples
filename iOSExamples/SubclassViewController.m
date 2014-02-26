//
//  SubclassViewController.m
//  iOSExamples
//
//  Created by Mike Chen on 2/25/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "SubclassViewController.h"

@interface SubclassViewController ()

@end

@implementation SubclassViewController

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
    
    [SubclassViewController testClassMethods];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*  Subclasses can overwrite class methods, in other langauges 
    you cannot overwrite static methods
 */
+(void)testClassMethods {
    //NSLog(@"Subclass overwriting class methods");
}

@end







