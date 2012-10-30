//
//  NSString+NSStringTags.m
//  WebViewTutorial1
//
//  Created by anwell on 10/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+NSStringTags.h"

@implementation NSString (NSStringTags)
-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [[self copy] autorelease];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s; }
@end
