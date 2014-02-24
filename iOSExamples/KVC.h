//
//  KVC.h
//  iOSExamples
//
//  Created by Mike Chen on 2/24/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVC : NSObject

@property (nonatomic, readwrite) NSString *characterName;
@property (nonatomic, readwrite) int characterLife;

-(void)hasLostValue;
-(void)hasGainValue;


@end
