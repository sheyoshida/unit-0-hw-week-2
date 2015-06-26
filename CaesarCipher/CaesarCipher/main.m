//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras, edited by Shena 🙋🏻 on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;
- (BOOL) breakCode:(NSString *)stringOne  // created codebreaker method:
 compareOneWithTwo:(NSString *)stringTwo;

@end

@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);
        
        result[i] = allchars[new_idx];
    }
    
    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

// implementation of codebreaker method:
- (BOOL) breakCode:(NSString *)stringOne
 compareOneWithTwo:(NSString *)stringTwo{
    
    BOOL isEqualTo = NO;
    
    for (int i = 0; i < 25; i++) {
        NSString *decodeCyphStringOne = [self decode:stringOne offset:i];
        for (int j = 1; j < 26; j++) {
            NSString *decodeCyphStringTwo = [self decode:stringTwo offset:j];
            if ([decodeCyphStringOne isEqualTo:decodeCyphStringTwo])
                isEqualTo = YES;
        }
    }
    return isEqualTo;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CaesarCipher *testStrings = [[CaesarCipher alloc]init];
        
        // I print values to test the encode/decode methods
        [testStrings encode:@"bananas" offset:3];
        [testStrings decode:@"edqdqdv" offset:3];
        
        NSLog(@"%@", [testStrings encode:@"bananas" offset:3]);
        NSLog(@"%@", [testStrings decode:@"edqdqdv" offset:3]);
        
        // I can't get the below portion to work without crashing the system, that is why it is commented out. :(
        
        //        BOOL isEqualTo = [testStrings breakCode:@"bananas" compareOneWithTwo:@"edqdqdv"];
        //        NSLog(@"%c", isEqualTo);
    }
    return 0;
}