//
//  ViewController.h
//  iOSExamples
//
//  Created by Mike Chen on 12/27/13.
//  Copyright (c) 2013 Mike Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KVC.h"

@interface ViewController : UIViewController

@property (nonatomic) KVC *characterKVC;

@property (nonatomic, readwrite) NSString *stringBlockValue;

- (IBAction)showJSONClass:(id)sender;
@end
