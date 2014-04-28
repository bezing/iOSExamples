//
//  RestOperation.m
//  iOSExamples
//
//  Created by Mike Chen on 4/20/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "RestOperation.h"

@implementation RestOperation




-(void)uploadFile {
    
    /*
    NSString *testString = @"Test";
    NSData *plainData = [testString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    
    NSLog(@"%@", base64String);
    
    
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    NSString *decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", decodeString);
    */
    
    
    
    
    
    
    
    /*
    NSString *string=[NSString stringWithFormat:@"%@.pdf",[chapersArray objectAtIndex:pageIndex]];
    [controller1 addAttachmentData:pdfData mimeType:@"application/pdf" fileName:string];
    [self presentModalViewController:controller1 animated:YES];
    [pdfData writeToFile:[self getDBPathPDf:string] atomically:YES];
}
*/

    /*
     We try to encode a pdf as a base64 string
     
     Find the path of the pdf in main bundle.
     Find the NSData of the file
     Find the base64 encoding string, this is what we add to the JSON dictionary
    */
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"chenResume" ofType:@"pdf"];
    NSData *pdfData = [NSData dataWithContentsOfFile:resourcePath];
    NSString *pdfBase64String = [pdfData base64EncodedStringWithOptions:0];
    
    
    /*
     Decode the pdf file of type base64 string and create a pdf file
    
     Create a path for pdf file in the documents directory
     Decode / Change the base64 string to NSData
     Create a file path of string ending at ".pdf"
     Write the NSData pdf fiel to the file path, ie create the pdf file
    */
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pdfPath = [documentsDirectory stringByAppendingPathComponent:@"resumeFile.pdf"];
    NSData *pdfDecodedNSData = [[NSData alloc] initWithBase64EncodedString:pdfBase64String options:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:pdfPath] == NO) {
        [pdfDecodedNSData writeToFile:pdfPath atomically:YES];
    }
}


-(void)uploadResume {
    
    
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"chenResume" ofType:@"pdf"];
    NSData *pdfData = [NSData dataWithContentsOfFile:resourcePath];
    NSString *pdfBase64String = [pdfData base64EncodedStringWithOptions:0];

    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
//    NSURL *url = [NSURL URLWithString:@"https://getperka.com/api/2/apply"];
    NSURL *url = [NSURL URLWithString:@"endpoint"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    
    NSArray *arrayOfProjects =
    [NSArray arrayWithObjects:
     @"https://itunes.apple.com/us/app/princess-haircuts/id687550982?mt=8",
     @"https://itunes.apple.com/us/app/hot-deal$/id583619810?mt=8",
     @"https://itunes.apple.com/us/app/jeremy-ball/id526964405?mt=8",
     @"https://github.com/mchen3/",
     nil];
    
    
    NSDictionary *mapData = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
    @"Mike",@"first_name",
    @"Chen", @"last_name",
    @"mike_chen7@hotmail.com",@"email",
    @"GENERALIST",@"position_id",
    @"I made the API request using NSURLSession in an iOS app. First, I created NSURLSessionConfiguration and NSURLSession and then I set the settings for NSMutableURLRequest to set up the HTTP header fields and POST method. Then I created a dictionary with the required information and for my pdf resume I changed it to NSData so I could encode it as a base64 string to add to my NSDictionary. I then use NSURLSession to send the request.",@"explanation",
    arrayOfProjects,@"projects",
    @"I found the job listing on Indeed.com",@"source",
    pdfBase64String,@"resume",
    nil];
    
    
    
    
    NSData *postData = [ NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask =
                    [session dataTaskWithRequest:request
                               completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //
    NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*)response;
        NSLog(@"%zd", httpResp.statusCode);
                                   
        NSLog(@"Test");
    
    }];
    
    
     //[postDataTask resume];
    
    
    
}




@end































