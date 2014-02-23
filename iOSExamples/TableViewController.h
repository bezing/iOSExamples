//
//  TableViewController.h
//  iOSExamples
//
//  Created by Mike Chen on 2/21/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (nonatomic, readwrite) NSArray *jsonDataArray;
@property (nonatomic, strong) UIImage *image;

@end
