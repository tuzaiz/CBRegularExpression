//
//  CBRegularExpression.m
//  CBRegularExpression
//
//  Created by Henry on 3/12/14.
//  Copyright (c) 2014 Cloudbay. All rights reserved.
//

#import "CBRegularExpression.h"

@implementation CBRegularExpression
+ (CBRegularExpression *)regularExpressionWithPattern:(NSString *)pattern
{
    NSError *error;
    CBRegularExpression *re = [[CBRegularExpression alloc] initWithPattern:pattern options:0 error:&error];
    return re;
}

- (BOOL)match:(NSString *)string group:(NSArray *__autoreleasing *)group
{
    NSArray *matches = [self matchesInString:string options:0 range:NSMakeRange(0, string.length)];

    NSTextCheckingResult *result = [matches firstObject];
    
    if ((result.range.location == 0 && result.range.length == string.length)) {
        NSMutableArray *allGroups = [NSMutableArray array];
        for (NSInteger i = 0; i < [result numberOfRanges]; i++) {
            [allGroups addObject:[string substringWithRange:[result rangeAtIndex:i]]];
        }
        *group = [NSArray arrayWithArray:allGroups];
        return YES;
    } else {
        return NO;
    }
    
}

- (BOOL)search:(NSString *)string group:(NSArray *__autoreleasing *)group
{
    NSArray *matches = [self matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    NSMutableArray *groups = [NSMutableArray array];
    for (NSTextCheckingResult *result in matches) {
        for (NSInteger i = 1; i < [result numberOfRanges]; i++) {
            [groups addObject:[string substringWithRange:[result rangeAtIndex:i]]];
        }
    }
    *group = [NSArray arrayWithArray:groups];
    return matches.count > 0;
}
@end
