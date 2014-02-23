//
//  ViewControllerB.h
//  iOSExamples
//
//  Created by Mike Chen on 2/23/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

@protocol ViewControllerBDelegate <NSObject>
-(void)exchangeData:(NSString*)dataString;
@end

#import <UIKit/UIKit.h>

@interface ViewControllerB : UIViewController

@property (nonatomic, readwrite) NSString *dataString;
@property (nonatomic, readwrite) NSString *methodString;
@property (nonatomic, readwrite) NSString *segueDataString;

@property (nonatomic, retain) id<ViewControllerBDelegate>delegate;
@property (nonatomic, copy) void(^dataBlock)(NSString *dataString);

-(void)passingData:(NSString*)dataString;

@end
