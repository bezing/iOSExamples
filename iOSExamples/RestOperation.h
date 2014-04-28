//
//  RestOperation.h
//  iOSExamples
//
//  Created by Mike Chen on 4/20/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestOperation : NSObject <NSURLSessionDelegate>


-(void)uploadFile;
-(void)uploadResume;


@end
