//
//  main.m
//  DataTypes
//
//  Created by Ben Gohlke on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
//        int anInt = -2147483648;
//        long aLong = -9223372036854;
//        
//        float aFloat = 21.09f;
//        double aDouble = -21.09f;
//        
//        int integerResult = 5 / 4;
//        double doubleResult = 5.0 / 4;
        
//        NSLog(@"%.17f", .1);
//        
//        BOOL isBool = YES;
//        
//        NSString *myString = @"Hello World!";
//        NSLog(@"%@", myString);
//        
//        id mysteryObject = @"An NSString object";
//        NSLog(@"%@", [mysteryObject description]);
//        mysteryObject = @{@"model": @"Ford", @"year": @1967};
//        NSLog(@"%@", [mysteryObject description]);
        
        NSArray *shipCaptains = @[@"Malcolm Reynolds", @"Jean-Luc Picard", @"James T. Kirk", @"Han Solo"];
        NSArray *sameCaptains = @[@"Malcolm Reynolds", @"Jean-Luc Picard", @"James T. Kirk", @"Han Solo"];
        if ([shipCaptains isEqualToArray:sameCaptains])
        {
            NSLog(@"They are the same!");
        }
        
        if ([shipCaptains containsObject:@"Kathryn Janeway"])
        {
            NSLog(@"U.S.S. Voyager represent!");
        }
        
        NSMutableArray *mutableShipCaptains = [shipCaptains mutableCopy];
        [mutableShipCaptains addObject:@"Kathryn Janeway"];
        NSLog(@"%ld captains", (long)mutableShipCaptains.count);
        
        

    }
    return 0;
}
