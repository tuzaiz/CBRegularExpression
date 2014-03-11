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
    *group = matches;
    return matches.count > 0;
}

- (BOOL)search:(NSString *)string group:(NSArray *__autoreleasing *)group
{
    NSArray *matches = [self matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    *group = matches;
    return matches.count > 0;
}
@end
