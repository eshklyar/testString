//
//  ViewController.m
//  testString
//
//  Created by Edik Shklyar on 12/8/14.
//  Copyright (c) 2014 Edik Shklyar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    NSInteger myCount = [self numberOfOcc:@"cake" inString:@"Cheesecake, apple cake, and cherry pie"];

    NSLog(@"myCount is %ld", (long)myCount);




    NSString *abc = @"this is test";

    abc = [NSString stringWithFormat:@"%@%@",[[abc substringToIndex:1] uppercaseString],[abc substringFromIndex:1] ];
    NSLog(@"abc = %@",abc);


    NSString *make = @"Porsche";
    NSString *model = @"911";
    int year = 1968;
    NSString *message = [NSString stringWithFormat:@"That's a %@ %@ from %d!",
                         make, model, year];
    NSString* myMessage = [self replaceSpaces:message];
    NSLog(@"message is %@", message);
   NSLog(@"myMessage is %@", myMessage);

    NSString* myString = [self concatString:make withString:model];
     NSLog(@"myString is %@", myString);
    NSRange range = [message rangeOfString:make];
    NSInteger myStart = range.location;
    NSInteger myLength = range.length;
    NSLog(@"start is %lu", (unsigned long)myStart);
    NSLog(@"lengh is %lu", (unsigned long)myLength);
    NSLog(@"haha %lu", (unsigned long)[make length]);

    char* c = [model UTF8String];
    NSLog(@"char is %s", c);
    NSLog(@"char is %c", c[0]);
    NSLog(@"char 2 is %c", [model characterAtIndex:0]);



    NSString* revString = [self reversingString:make] ;
//    NSString *txt = @"hi my friends!";
//    revString = [revString stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[revString substringToIndex:1] uppercaseString]];
    NSLog(@"rev %@", revString);

    NSString *anotherString = @"abccc";
    NSRange anotherRange = [anotherString rangeOfString:@"c" options:NSCaseInsensitiveSearch range:NSMakeRange(0,anotherString.length)];

    NSLog(@"anotherRange %lu", (unsigned long)anotherRange.location);


}

-(NSString*) concatString: (NSString*) firstString withString: (NSString*) secondString{

    NSString* myString = [NSString stringWithFormat:@"%@ %@", firstString, secondString];
    return myString;
}
// reverse string and changing the case
-(NSString*) reversingString:(NSString *)someString
{

    NSMutableString *reverseString = [[NSMutableString alloc] initWithCapacity:[someString length]];
    for(NSInteger i=[someString length] -1;i>=0;i--)
    {
        [reverseString appendString:[NSString stringWithFormat:@"%c",[someString characterAtIndex:i]]];
    }


//    unichar char = [codeString characterAtIndex:0];
//    unichar char = [codeString substringToIndex:1]
//    NSCharacterSet *letters = [NSCharacterSet letterCharacterSet];
//    if ([letters characterIsMember:char]) {
//        // The first character is a letter in some alphabet
//    }


    if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[someString characterAtIndex:0]]) {

        NSString* reverseStringLowerCase = [reverseString lowercaseString];
        NSLog(@"lowercase %@", reverseStringLowerCase);

        NSString* reverseStringUpperCase = [reverseStringLowerCase stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[reverseStringLowerCase substringToIndex:1] uppercaseString]];
        NSLog(@"uppercase %@", reverseStringUpperCase);
    }

    return reverseString;
}

-(NSString*)replaceSpaces: (NSString*) someString {

    someString = [someString stringByReplacingOccurrencesOfString:@" " withString:@""];

    return someString;
}

-(void)anotherReverse:(NSString*)someString{

    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [someString length];
        while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[someString substringWithRange:subStrRange]];
        }
    NSLog(@"%@", reversedString);
    }
-(void)yetAnotherReverse:(NSString*)someString{


    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[someString length]];

    [someString enumerateSubstringsInRange:NSMakeRange(0,[someString length])
                                 options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                  [reversedString appendString:substring];
                              }];
}

-(NSInteger) numberOfOcc:(NSString*)searchString inString:(NSString*) someString{

    NSUInteger count = 0, length = [someString length];
    //location, length
    NSRange range = NSMakeRange(0, length);
    while(range.location != NSNotFound)
        {
            NSLog(@"first location %lu", (unsigned long)range.location);
            range = [someString rangeOfString: searchString options:0 range:range];
            if(range.location != NSNotFound)
            {
                 NSLog(@"seconf location %lu", (unsigned long)range.location);
                range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
                 NSLog(@"third location %lu", (unsigned long)range.location);
                count++;
            }
        }
    return count;
}
@end
