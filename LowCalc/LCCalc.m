//
//  LCCalc.m
//  LowCalc
//
//  Created by Александр Гелета on 07.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import "LCCalc.h"

@interface LCCalc()

/**
 Rounds passed value with user defined precision.
 @param value Value to round.
 @param aPrecision amount of chars after point in value.
 @see LCCalc.m
 */
- (NSNumber*_Nonnull)roundValue:(NSNumber*_Nonnull)value withPrecision:(NSUInteger)aPrecision;

@end

@implementation LCCalc

@synthesize lastResult = _lastResult;
@synthesize badModeOn = _badModeOn;

- (id _Nonnull)initWithPrecision:(NSUInteger)value {
    self = [super init];
    if (self) {
        [self setPrecision:value];
    }
    return self;
}

- (id _Nonnull)initWithPrecision:(NSUInteger)value
                      andBadMode:(BOOL)isBad {
    self = [self initWithPrecision:value];
    if (self) {
        [self setBadModeOn:isBad];
    }
    return self;
}

- (NSNumber*_Nonnull)addRight:(NSNumber*_Nonnull)right
                       toLeft:(NSNumber*_Nonnull)left {
    _lastResult = @([left floatValue] + [right floatValue]);
    return self.lastResult;
}

- (NSNumber*_Nonnull)substructRight:(NSNumber*_Nonnull)right
                           fromLeft:(NSNumber*_Nonnull)left {
    _lastResult = @([left floatValue] - [right floatValue]);
    return self.lastResult;
}

- (NSNumber*_Nonnull)multiplicateLeft:(NSNumber*_Nonnull)left
                            withRight:(NSNumber*_Nonnull)right {
    _lastResult = @([left floatValue] * [right floatValue]);
    return self.lastResult;
}

- (NSNumber*_Nonnull)divideLeft:(NSNumber*_Nonnull)left
                        byRight:(NSNumber*_Nonnull)right {
    _lastResult = @([left floatValue] / [right floatValue]);
    return self.lastResult;
}

- (NSNumber*_Nonnull)roundValue:(NSNumber*_Nonnull)value
                  withPrecision:(NSUInteger)aPrecision {
    NSNumber *result = @0;
    if (self.badModeOn) {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:aPrecision];
    result = [formatter numberFromString:[formatter stringFromNumber:value]];
    } else {
        double mathPrecision = pow(10.0, [[NSNumber numberWithUnsignedInteger:aPrecision] doubleValue]);
        double mathResult = round([value doubleValue] * mathPrecision) / mathPrecision;
        result = [NSNumber numberWithDouble:mathResult];
    }
    return result;
}

- (NSNumber*_Nonnull)getLastResult {
    return [self roundValue:_lastResult withPrecision:self.precision];
}

- (BOOL)getBadModeOn {
#ifdef DEBUG
    if (_badModeOn)
        NSLog(@"Bad mode ON (String style) [LQ].\nConverter working...");
    else
        NSLog(@"Bad mode OFF (Math style) [HQ].\nConverter working...");
#endif
    return _badModeOn;
}

@end
