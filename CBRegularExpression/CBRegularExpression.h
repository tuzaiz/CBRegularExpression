//
//  CBRegularExpression.h
//  CBRegularExpression
//
//  Created by Henry on 3/12/14.
//  Copyright (c) 2014 Cloudbay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBRegularExpression : NSRegularExpression
+ (CBRegularExpression *)regularExpressionWithPattern:(NSString *)pattern;
- (BOOL)match:(NSString *)string group:(NSArray **)group;
- (BOOL)search:(NSString *)string group:(NSArray **)group;
@end
