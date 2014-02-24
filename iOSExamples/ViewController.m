//
//  ViewController.m
//  iOSExamples
//
//  Created by Mike Chen on 12/27/13.
//  Copyright (c) 2013 Mike Chen. All rights reserved.
//

#import "ViewController.h"
#import "Arrays.h"
#import "Operators.h"
#import "Variables.h"
#import "Blocks.h"
#import "TableViewController.h"
#import "DataManager.h"
#import "ViewControllerA.h"
#import "KVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   // [self testClasses];
    
   // [self runBlockSamples];

   // [self runDailyLineOfCode];
    
    
   //BOOL isPalindrome =  [self checkStringIsPalindrome:@"CAC"];
   // NSLog(isPalindrome ? @"TRUE" : @"FALSE");
   
    /* Fuzz swap
    int a = 5;
    int b = 7;
    [self swapInt:a With:b];
    */
    
   // [self runFuzzTest];
    
    [self runKeyValueTest];
}

// Event is called, since we add ourselves as an observer, when the values change
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"characterName"]) {
        NSString *oldName = [change objectForKey:@"old"];
        NSString *newcharacterName = [change objectForKey:@"new"];
        NSLog(@"Old name: %@ New name is: %@", oldName, newcharacterName);
    }
    
    if ([keyPath isEqualToString:@"characterLife"]) {
        int oldCharacterLife = [[change objectForKey:@"old"] intValue];
        int newCharacterLife = [[change objectForKey:@"new"] intValue];
        NSLog(@"Old life: %i New life is: %i", oldCharacterLife, newCharacterLife);
    }
}

// Change the values for the key value object
- (IBAction)testKeyValuePressed:(id)sender {
    [self.characterKVC setValue:@"Rick" forKey:@"characterName"];
    [self.characterKVC setValue:[NSNumber numberWithInt:10] forKey:@"characterLife"];
}

-(void)runKeyValueTest {
    // Use key value coding / KVC to set values for the properties
    self.characterKVC = [[KVC alloc] init];
    // character name and character life must be property values of object KVC
    [self.characterKVC setValue:@"Mike" forKey:@"characterName"];
    [self.characterKVC setValue:[NSNumber numberWithInt:5] forKey:@"characterLife"];
    
    NSString *stringName = [self.characterKVC valueForKey:@"characterName"];
    int characterLife = [[self.characterKVC valueForKey:@"characterLife"] integerValue];
    NSLog(@"Character name is %@ and life is %i", stringName, characterLife);
    
    // Add this object as an observer, with KVO, of the KVC object
    [self.characterKVC addObserver:self forKeyPath:@"characterName"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    [self.characterKVC addObserver:self
                   forKeyPath:@"characterLife"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
}

-(void)runFuzzTest {
    
//    int a = 50;
//    if (a>10 && a<40) {
//        NSLog(@"TRUE");
//    }else {
//        NSLog(@"False");
//    }
    
    // Check if first 4 letters of string is Equal to Http
    /* The algo is use a iteration to run four times to 
     check first 4 char, assume flag is true until one
     of the characters is not, then break from the iteration
     very important to break, otherwise it can set to true
     on the last check
    */
    NSString *string = @"Http";
    BOOL equal = TRUE;
    for (int i=1; i<=4; i++) {
        char firstChar = [string characterAtIndex:0];
        char secondChar = [string characterAtIndex:1];
        char thirdChar = [string characterAtIndex:2];
        char fourthChar = [string characterAtIndex:3];

        if (firstChar != 'H') {
            equal = false;
            break;
        }
        if (secondChar != 't') {
            equal = false;
            break;
        }
        if (thirdChar != 't') {
            equal = false;
            break;
        }
        if (fourthChar != 'p') {
            equal = false;
            break;
        }
    }
    NSString *isStringEqual = equal ? @"TRUE" : @"FALSE";
   // NSLog(@"String is equal to Http: %@", isStringEqual);
    

    
    
    // Print the number inside the 2D arrays in various ways
    NSArray *sample2DArray = @[@[@"1",@"2",@"3"],
                               @[@"4",@"5",@"6"],
                               @[@"7",@"8",@"9"]];
    //NSArray *array2D = [Arrays create2DArrays];
    NSArray *array2D = sample2DArray;

    
    /* Print the array in sequential order
     Algo: If you are iterating the array in sequential order, use
     forin loop. When you start examine closely how the array is structured
     We have a array inside another array. Forin means what's the object
     inside the array. Once you have it print it out.
    */
    for (NSArray *innerArray in array2D) {
        for (NSString *stringNum in innerArray) {
           // NSLog(@"%@", stringNum);
        }
    }

    /*Print the array backwards
     Algo: We are not looping in order so we can't use forin. Must use
     regular for loop to control the order of the loop, in this case
     we want to start from the last to the first.
     Find the length of the array and use that to initialize the i
     value but we use the i value to test and out in objectAtIndex, we
     do not change or use the outerArrayLength for anything else.
     Also decrease the length of the array length by 1 because the
     array length will be 3 but the array index will be 2 instead
    */
    int outerArrayLength = sample2DArray.count-1;
    for (int x=outerArrayLength; x>=0; x--) {
        NSArray *innerArray = [sample2DArray objectAtIndex:x];
        int innerArrayLength = innerArray.count-1;
        for (int y = innerArrayLength; y>=0; y--) {
            NSString *stringNum = [innerArray objectAtIndex:y];
            //NSLog(@"%@", stringNum);
        }
    }
    
    
    /* Print the columns  
     @[@[@"1",@"2",@"3"],
       @[@"4",@"5",@"6"],
       @[@"7",@"8",@"9"]];
     
     Look at it closely, follow the loop algo. We need to iterate the arrays and print
     out the first values, then iterate again to print out the second value, then 
     iterate again to print out the third value. Use a outer for loop to loop three
     times and to use the index flag of i and inside the forin loop to give use the
     inner arrays inside the 2d array
    
    */
    
    for (int i =0; i<3; i++) {
        for (NSArray *innerArray in sample2DArray) {
            NSString *stringNum = [innerArray objectAtIndex:i];
            NSLog(@"%@", stringNum);
        }
    }
    
    // Same as above but no need to loop inside the inner array
    /*
    for (int i=0; i<3; i++) {
        for (NSArray *innerArray in sample2DArray) {
            for (NSString *stringNum in innerArray) {
                NSString *stringValue = [innerArray objectAtIndex:i];
                NSLog(@"uu %@", stringValue);
                break; // Break because we only need one value, not all the values of the loop
            }
        }
    }
    */

}


-(BOOL)checkStringIsPalindrome:(NSString*)string {
    
    // Check first string to last string so
    // run checks at half the count
    
    int length = string.length;
    
    
    // Set flag to true until the check turns it to false
    // Other way will involve more code ie setting flag to
    // false and then setting it to true after every hit
    BOOL palindrome = TRUE;
    
    
    for (int i=0; i<length/2; i++) {
        // Check if characters at various indexs are equal
        if ([string characterAtIndex:i] != [string characterAtIndex:length-1-i]) {
            return  palindrome = FALSE;
        }
    }
    
    return  palindrome;
}

enum TestNum {
    NumA= 1,
    NumB= 2,
    NumC= 3
};

// Daily line code
-(void)runDailyLineOfCode {
    
    int i = 0;
    
    while (i<10) {
       // NSLog(@"%i", i);
        i++;
    }
    
    
    int a = 1;
    int b = 5;
    int c = a / b ;
    //NSLog(@"%f", c);
    
    switch (a) {
        case NumA:
            NSLog(@"A");
            break;
            
        case NumC:
            NSLog(@"C");
            break;
            
        default:
            break;
    }
    
    
    
    int test = 0;
    do {
       // NSLog(@"%i", test);
        test++;
    } while (test<50);
    
    
    NSMutableArray *testMutableArray = [[NSMutableArray alloc] init];
    [testMutableArray addObject:@"A"];
    [testMutableArray addObject:@"B"];
    [testMutableArray addObject:@"C"];
    
    for (NSString *stringObject in testMutableArray) {
       // NSLog(@"%@", stringObject);
    }
    
    for (int i = 20; i>0; i--) {
        //NSLog(@"%i", i);
    }

    int sampleInt = 0;
    while (sampleInt < 100) {
        sampleInt +=10;
        NSLog(@"%i", sampleInt);
    }
}

-(BOOL)checkPalindrom:(NSString*)string {
    int stringLength = string.length;
    // We are checking every letter so we set the palindrome
    // flag to true until the check is false
    BOOL palindrome = TRUE;
    // The number of iterations is half because we are taking 2 at a time
    for (int i=0; i<stringLength/2; i++) {
        // Using != instead of isEqualString because it is a char not a string
        // The last integer will be charater length -1 (account for zero array index) and
        // also subtract i to decrease the pointer after after iterations
        if ([string characterAtIndex:i] != [string characterAtIndex:string.length-i-1]) {
            return palindrome = FALSE;
        }
    }
    return palindrome;
}

-(void)runBlockSamples {
    // Pass a block to the sample block class' block property
    Blocks *blockClass = [[Blocks alloc] init];
    blockClass.onCompletion = ^{
        NSLog(@"Sample Block");
    };
    
    
    //[blockClass testBlockMethods];
    //[blockClass testSampleBlocks];
    
    
    //    [blockClass checkEvenint:2 completionBlock:^(BOOL even) {
    //        //
    //        if (even) {
    //            NSLog(@"TRUE");
    //        }
    //        else {
    //            NSLog(@"FALSE");
    //        }
    //    }];
    
    
    //    [blockClass checkValues:6 completionHandler:^(BOOL success, BOOL failure) {
    //        if (success) {
    //            NSLog(@"Even number");
    //        }
    //
    //        if (failure) {
    //            NSLog(@"Odd");
    //        }
    //    }];
    
    
    //    [blockClass checkSuccessBlock:^{
    //        NSLog(@"Success Block");
    //    } onError:^(NSError *error) {
    //        NSLog(@"Error block");
    //    }];
    
    
    //[blockClass testEnumeratedBlocks];
    //[blockClass testSampleBlocks];
    //[blockClass testInlineVesusVariableBlocks];

    
    NSMutableArray *movieQueue = [NSMutableArray arrayWithObjects:@"Inception", @"Book of Eli", @"Independence Day", nil];
    // Initialize a class with a callback
    Blocks *block = [[Blocks alloc] initWithCallback:^(NSString *title) {
       // NSLog(@"Removing %@", title);
        // Array becomes part of the state of the block, dont need to use __block for movieQueue
        // because we are modifiying it's contents but where where the array pointer is pointing
        [movieQueue removeObject:title];
    }];
    
    // playMovie method calls the callback
    //[blockClass playMovie:@"Inception"];
    
    // Have to use [NSArray arrayWithArray which returns the instance
    // of the arrays otherwise if you just use movieQueue you will
    // be removing instances from the actual collection while it is in used
    for (NSString *movieTitle in [NSArray arrayWithArray:movieQueue]) {
        //[block playMovie:movieTitle];
    }
    
    // Test daily block
   __block int localVariable = 5;
    // The type for the second parameter is a pointer to bool value
    [self runBlock:^(int number, bool *stop) {
        localVariable *= number;
        NSLog(@"Number: %i   %i", number, localVariable);
        
        if (number>=5) {
        // We have a reference to a bool value passed through the parameter
            *stop = TRUE;
        }
    }];
}

-(void)runBlock:(void(^)(int number, bool *stop))block{
    for (int i=1; i<10; i++) {
        bool stopIteration = FALSE;
        // & gives you the memory address, so we are passing a reference to the
        // memory address through the parameter so we can access and change it
        // to stop the iteration.
        // stopIteration without * or & is a primitive
        block(i, &stopIteration);
        if (stopIteration) {
            break;
        }
    }
}

-(void)testClasses {
    Arrays *array = [[Arrays alloc] init];
   // [array createStrings];
   // [array printArray];
   // [array createArrays];
    
    Operators *operator = [[Operators alloc] init];
    //[operator testOperations];
    [operator checkTernaryOperator];
    
    Variables *variables = [[Variables alloc] init];
}

-(void)swapInt:(int)firstInt With:(int)secondInt {
    int a = firstInt;
    int b = secondInt;
    int c = 0;
    
    NSLog(@"Before Swap A:%i  B:%i", a, b);
    
    c = a;
    a = b;
    b = c;
    
    NSLog(@"Before Swap A:%i  B:%i", a, b);
}


- (IBAction)showDataExchange:(id)sender {
    
    
    ViewControllerA *vcA = (ViewControllerA*) [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerA"];
    [self.navigationController pushViewController:vcA animated:YES];
}

- (IBAction)showJSONClass:(id)sender {
    
    // Create three table view controllers and add to navigational controllers then add to
    // a tab bar controller then push on top of navigational controller
    
    // First Table View Controller
    TableViewController *allTableView = [[TableViewController alloc] init];
    UINavigationController *allTableNav = [[UINavigationController alloc] initWithRootViewController:allTableView];
    UITabBarItem *allTabBar = [[UITabBarItem alloc] initWithTitle:@"all" image:nil tag:1];
    NSDictionary *titleAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:24 ]};
    [allTabBar setTitleTextAttributes:titleAttributes forState:UIControlStateNormal];
    [allTableNav setTabBarItem:allTabBar];
    
    // Second
    TableViewController *textTableView = [[TableViewController alloc] init];
    UINavigationController *textTableNav = [[UINavigationController alloc] initWithRootViewController:textTableView];
    UITabBarItem *textTabBar = [[UITabBarItem alloc] initWithTitle:@"text" image:nil tag:1];
    [textTabBar setTitleTextAttributes:titleAttributes forState:UIControlStateNormal];
    [textTableNav setTabBarItem:textTabBar];
    
    // Third
    TableViewController *imageTableView = [[TableViewController alloc] init];
    UINavigationController *imageTableNav = [[UINavigationController alloc] initWithRootViewController:imageTableView];
    UITabBarItem *imageTabBar = [[UITabBarItem alloc] initWithTitle:@"image" image:nil tag:1];
    [imageTabBar setTitleTextAttributes:titleAttributes forState:UIControlStateNormal];
    [imageTableNav setTabBarItem:imageTabBar];

    NSArray *controllers = [NSArray arrayWithObjects:allTableNav, textTableNav, imageTableNav, nil];
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    [tabBar setViewControllers:controllers];
    
    [self.navigationController pushViewController:tabBar animated:YES];

    /* Load our json data and pass it to our table view controllers
     
    Perfect use of blocks here. After the download is complete you want
    to add the data to our tvcs and reload all the tables as well.
    IE you want our data manager to call us back here, hence we are 
    creating the callback block here. 
    -You can also use delegation here, after the download data manager
     can call it's delegate, us to add data to delegate and reload. 
     All the call back methods would be defined here like the blocks
    -These examples are how these objects communicate and pass data 
     between each other.
     */
    
    DataManager *dataManager = [DataManager dataManager];
    
    [dataManager loadJSONDataWithCompletionBlock:^{
        // Pass the data once the download is complete
        allTableView.jsonDataArray = dataManager.allDataArray;
        textTableView.jsonDataArray = dataManager.textDataArray;
        imageTableView.jsonDataArray = dataManager.imageDataArray;
        
        // Reload the table as well
        [allTableView.tableView reloadData];
        [textTableView.tableView reloadData];
        [imageTableView.tableView reloadData];
    }];
}

@end



































