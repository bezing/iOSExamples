//
//  NetworkViewController.m
//  iOSExamples
//
//  Created by Mike Chen on 2/27/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "NetworkViewController.h"
#import "AFNetworking.h"
#import "Constants.h"

@interface NetworkViewController ()

@end

@implementation NetworkViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testAFNetworkingJSON {
    
    /*
     Testing two ways to pull JSON data with AFNetworking, 
     AFHTTPRequestOperation and AFHTTPSessionManager
     
     We use AFHTTPRequestOperation for just one operation to pull JSON data from the request URL
     We use AFHTTPSessionManager to make several request, ie use it to perform Restful verbs
     
    */
    
    NSURLRequest *request = [NSURLRequest requestWithURL:kFuzzURL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    // Must add a JSON serializer otherwise the response object is scrambled
    // and can't be cast to array
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = (NSArray *)responseObject;
        for (NSDictionary *dict in array) {
            NSLog(@"%@", dict);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure");
    }];
    
    [operation start];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // Default serialializer for AFHTTPSessionManager is JSON so
    // if you are parsing JSON then you can leave it out
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:@"http://dev.fuzzproductions.com/MobileTest/test.json"
         parameters:nil
            success:^(NSURLSessionDataTask *task, id responseObject) {
                 NSArray *array = (NSArray *)responseObject;
                 for (NSDictionary *dict in array) {
                   //  NSLog(@"%@", dict);
                 }
            }
            failure:^(NSURLSessionDataTask *task, NSError *error) {
                    }];
}

@end

























