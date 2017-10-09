//
//  LCCalc+LCCalcSingleExpressionString.m
//  LowCalc
//
//  Created by Александр Гелета on 09.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import "LCCalc+LCCalcSingleExpressionString.h"

@implementation LCCalc (LCCalcSingleExpressionString)

- (NSNumber*_Nonnull)computeSingleExpressionString:(NSString*_Nonnull)expressionString {
    NSArray<NSString*> *parsedExpression = [self parseSingleExpressionString:expressionString];
    if (parsedExpression.count < 3)
        return @0;
    else {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
        NSNumber *leftOperand = [formatter numberFromString:[parsedExpression objectAtIndex:0]];
        NSNumber *rightOperand = [formatter numberFromString:[parsedExpression objectAtIndex:1]];
        unichar operationSelector = [[parsedExpression objectAtIndex:2] characterAtIndex:0];
    
        switch ((char)operationSelector) {
            case '+':
                return [self addRight:rightOperand toLeft:leftOperand];
            case '-':
                return [self substructRight:rightOperand fromLeft:leftOperand];
            case '*':
                return [self multiplicateLeft:leftOperand withRight:rightOperand];
            case '/':
                return [self divideLeft:leftOperand byRight:rightOperand];
            default:
                return @0;
        }
    }
}

- (NSArray<NSString*>*_Nonnull)parseSingleExpressionString:(NSString*_Nonnull)expressionString {
    NSArray<NSString*> *separators = [[NSArray alloc] initWithObjects:@"+", @"-", @"*", @"/", nil];
    NSArray<NSString*> *subStrings = nil;
    NSString *selectedSeparator = nil;
    
    for (id separator in separators) {
        if (subStrings.count != 2) {
            subStrings = [expressionString componentsSeparatedByString:separator];
            selectedSeparator = [[NSString alloc] initWithString:separator];
        }
    }
    subStrings = [subStrings arrayByAddingObject:selectedSeparator];
    return subStrings;
}

@end
