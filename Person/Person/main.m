//
//  main.m
//  Person
//
//  Created by Michael Kavouras, edited by Shena 💁🏻 on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
#import <Foundation/Foundation.h>

// We always start with the INTERFACE:
@interface Person: NSObject

// And then declare a few METHODS:
- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCity:(NSString *)city;
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;

// I added another method that will show each person's shoe size!
- (void)setShoeSize:(NSString *)shoeSize;
- (NSString *)shoeSize;

// This method will eventually check the same city:
-(BOOL)checkSameCity:(Person *)aPerson;

// This method adds a child:
-(Person *)haveChild;

@end

// We name the properties:
// I learned that we only have to declare variables here, so "have child" and "checkSameCity" don't qualify:
@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;
    NSString *_city;
    NSString *_shoeSize;
}

// Then we add the setter/getter methods:
- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;
}

- (NSString *)city {
    return _city;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}

- (void)setShoeSize:(NSString *)shoeSize {
    _shoeSize = shoeSize;
}

- (NSString *)shoeSize {
    return _shoeSize;
}

// Here are the methods for checking the city:
-(BOOL) checkSameCity:(Person *)aPerson; {
    // note: "==" does not work in obj c, use "isEqualToString" instead, like this:
    if([[aPerson city] isEqualToString: [self city]]) {
        return YES;
    } else {
        return NO;
    }
}

// And this method will return a child:
-(Person *)haveChild {
    Person *child = [[Person alloc]init];
    [child setCity: [self city]];
    [child setPhoneNumber: [self phoneNumber]];
    return child;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        Person *fred = [[Person alloc]init];
        Person *wilma = [[Person alloc]init];
        
        // we can set our Person's properties:
        
        [fred setName: @"Fred"];
        [fred setCity: @"Bedrock"];
        [fred setPhoneNumber: @"123-4567"];
        [fred setShoeSize: @"9.5"];
        
        [wilma setName: @"Wilma"];
        [wilma setCity: @"Bedrock"];
        [wilma setPhoneNumber: @"123-4567"];
        [wilma setShoeSize: @"7"];
        
        BOOL checkSameCity = [wilma checkSameCity: fred];
        NSLog(@"Do Fred and Wilma live in the same city? 1 = yes, 0 = no. Answer: %i", checkSameCity);
        
        // to display Fred and Wilma's names, we call the "getter"
        NSString *fredsName = [fred name];
        NSLog(@"Our first person is called %@", fredsName);
        NSString *wilmasName = [wilma name];
        NSLog(@"Our second person is called %@", wilmasName);
        
        NSString *fredsPhone = [fred phoneNumber];
        NSLog(@"%@'s phone number is %@", fredsName, fredsPhone);
        
        NSString *wilmasShoeSize = [wilma shoeSize];
        NSLog(@"%@ wears size %@ shoes", wilmasName, wilmasShoeSize);
        
        NSString *wilmasCity = [wilma city];
        NSLog(@"%@ lives in %@", wilmasName, wilmasCity);
        
        [fred haveChild];
        Person *fredsBaby = [fred haveChild];
        [fredsBaby setCity: @"Dino Town"];
        [fredsBaby setPhoneNumber: @"123-4567"];
        NSLog(@"Fred's baby lives in %@", [fredsBaby city]);
        
        
    }
    return 0;
}