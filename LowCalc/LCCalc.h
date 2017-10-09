//
//  LCCalc.h
//  LowCalc
//
//  Created by Александр Гелета on 07.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCCalc : NSObject

- (id _Nonnull)initWithPrecision:(NSUInteger)value;
- (id _Nonnull)initWithPrecision:(NSUInteger)value andBadMode:(BOOL)isBad;

- (NSNumber* _Nonnull)addRight:(NSNumber*_Nonnull)right toLeft:(NSNumber*_Nonnull)left;
- (NSNumber*_Nonnull)substructRight:(NSNumber*_Nonnull)right fromLeft:(NSNumber*_Nonnull)left;
- (NSNumber*_Nonnull)multiplicateLeft:(NSNumber*_Nonnull)left withRight:(NSNumber*_Nonnull)right;
- (NSNumber*_Nonnull)divideLeft:(NSNumber*_Nonnull)left byRight:(NSNumber*_Nonnull)right;

- (NSNumber*_Nonnull)getLastResult;

@property (readonly, nonatomic, nonnull, getter=getLastResult) NSNumber *lastResult;
@property (readwrite, nonatomic) NSUInteger precision;
@property (readwrite, nonatomic) BOOL badModeOn;

@end
