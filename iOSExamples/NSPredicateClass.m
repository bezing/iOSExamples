//
//  NSPredicateClass.m
//  iOSExamples
//
//  Created by Mike Chen on 2/26/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "NSPredicateClass.h"
#import "NSString+Helper.h"


@implementation NSPredicateClass



-(void)testArrayOfStrings {
    
    
    /*
        Searching arrays of string objects which is different from searching a array
     of NSPredicateClass objects like in the testPredicate method
    */
    
    NSArray *fruits = [NSArray arrayWithObjects:@"Apple", @"Crabapple", @"Watermelon", @"Lemon", @"Raspberry", @"Rockmelon", @"Orange", @"Lime", @"Grape", @"Kiwifruit", @"Bitter Orange", @"Manderin", nil];
	
    NSPredicate *findMelons = [NSPredicate predicateWithFormat:@"SELF contains[cd] 'melon'"];
    NSArray *melons = [fruits filteredArrayUsingPredicate:findMelons];
	
    NSPredicate *findApple = [NSPredicate predicateWithFormat:@"SELF beginswith 'Apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:findApple];
	
    NSPredicate *findRNotMelons = [NSPredicate predicateWithFormat:@"SELF beginswith 'R' AND NOT SELF contains[cd] 'melon'"];
    NSArray *rNotMelons = [fruits filteredArrayUsingPredicate:findRNotMelons];
    
    NSLog(@"Fruits: %@", fruits);
    NSLog(@"Melons: %@", melons);
    NSLog(@"Apples: %@", apples);
    NSLog(@"RNotMelons: %@", rNotMelons);
}

/* Note override NSObject's description: because when we NSLog the arrays, it consist
 of Person class' so description allows you to print the Person properties instead
 of printing just NSPredicate _class
*/
-(NSString *)description {
    return [NSString stringWithFormat:@"%@  %@", self.firstName, self.lastName];
}

-(void)testNSPredicate {
    
    NSArray *firstNames = @[@"Mike", @"Tony", @"Nick", @"Bob"];
    NSArray *lastNames = @[@"Chen", @"Wong", @"Chen", @"Smith"];
    NSArray *ages = @[@25, @34, @45, @60];
    
    NSMutableArray *peopleArray = [[NSMutableArray alloc] init];
    [firstNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSPredicateClass *people = [[NSPredicateClass alloc] init];
//        people.firstName = [firstNames objectAtIndex:idx];
//        people.lastName = [lastNames objectAtIndex:idx];
//        people.age = [ages objectAtIndex:idx];
          people.firstName = firstNames[idx];
          people.lastName = lastNames[idx];
          people.age = ages[idx];
          [peopleArray addObject:people];
    }];
    

    /*
      We are searching a array which contains NSPredicateClass objects with properties
     like lastName, firstName, and age so inside the predicate we spcify the property
    */
    NSPredicate *firstNamePredicate = [NSPredicate
                                       predicateWithFormat:@" firstName = 'Mike' "];
    NSPredicate *lastNamePrediate = [NSPredicate
                                     predicateWithFormat:@" lastName = %@", @"Chen" ];
    NSPredicate *age = [NSPredicate predicateWithFormat:@" age >= 60 "];
    
    NSArray *firstNamesFound =  [peopleArray filteredArrayUsingPredicate:firstNamePredicate];
    NSArray *lastNamesFound = [peopleArray filteredArrayUsingPredicate:lastNamePrediate];
    NSArray *agesFound = [peopleArray filteredArrayUsingPredicate:age];
    
    NSLog(@"%@", firstNamesFound);
    NSLog(@"%@", lastNamesFound);
    NSLog(@"%@", agesFound);
}

@end







































