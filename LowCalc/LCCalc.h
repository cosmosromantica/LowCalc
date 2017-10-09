//
//  LCCalc.h
//  LowCalc
//
//  Created by Александр Гелета on 07.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Object oriented mathematic calculator.
 Oriented for high quality mathematic operation results with big precision.
 LCCalc computes value in raw format passed by user and after calculation returns result with user predefined precision.
 @see LCCalc.
 */
@interface LCCalc : NSObject

/**
 Initializes a new instance of LCCalc with user predefined calculation precision.
 @param value User predefined precision for calculation results.
 @return Method returns a new instance of LCCalc.
 @see LCCalc.
 */
- (id _Nonnull)initWithPrecision:(NSUInteger)value;
/**
 Initializes a new instance of LCCalc with user predefined calculation precision and value rounding mode.
 @param value User predefined precision for calculation results.
 @param isBad Sets rounding mode for calculation results. When false passed LCCalc will use high quality mathematic rounding algorithm.
 If true passed then LCCalc will use low quality string rounding algorithm.
 @return Method returns a new instance of LCCalc.
 @see LCCalc.
 @warning Using string rounding algorithm is not recommended.
 */
- (id _Nonnull)initWithPrecision:(NSUInteger)value
                      andBadMode:(BOOL)isBad;

/**
 Folds two numbers presented as NSNumber* with predefined LCCalc params.
 @param right Right part of the expression (second term).
 @param left Left part of the expression (first term).
 @return Returns NSNumber* as result of the mathematic operation for expression.
 @see LCCalc.
 */
- (NSNumber* _Nonnull)addRight:(NSNumber*_Nonnull)right
                        toLeft:(NSNumber*_Nonnull)left;
/**
 Substructs two numbers presented as NSNumber* with predefined LCCalc params.
 @param right Right part of the expression (second term).
 @param left Left part of the expression (first term).
 @return Returns NSNumber* as result of the mathematic operation for expression.
 @see LCCalc.
 */
- (NSNumber*_Nonnull)substructRight:(NSNumber*_Nonnull)right
                           fromLeft:(NSNumber*_Nonnull)left;
/**
 Multiplicate two numbers presented as NSNumber* with predefined LCCalc params.
 @param left Left part of the expression (first term).
 @param right Right part of the expression (second term).
 @return Returns NSNumber* as result of the mathematic operation for expression.
 @see LCCalc.
 */
- (NSNumber*_Nonnull)multiplicateLeft:(NSNumber*_Nonnull)left
                            withRight:(NSNumber*_Nonnull)right;
/**
 Divide first number by second number presented as NSNumber* with predefined LCCalc params.
 @param left Left part of the expression (first term).
 @param right Right part of the expression (second term).
 @return Returns NSNumber* as result of the mathematic operation for expression.
 @see LCCalc.
 */
- (NSNumber*_Nonnull)divideLeft:(NSNumber*_Nonnull)left
                        byRight:(NSNumber*_Nonnull)right;

/**
 Returns last mathematic operation result as NSNumber*.
 @return NSNumber* as result of mathematic expression.
 @see LCCalc.
 */
- (NSNumber*_Nonnull)getLastResult;

/**
 Contains the result of last mathematic operation.
 @return Result as NSNumber*.
 @see LCCalc.
 @warning This property is readonly and thread unsafe.
 */
@property (readonly, nonatomic, nonnull, getter=getLastResult) NSNumber *lastResult;
/**
 Contains the precision value for mathematic operation results. It is amount of chars after point in result value.
 @return Rounded result as NSNumber*.
 @see LCCalc.
 @warning This property is thread unsafe.
 */
@property (readwrite, nonatomic) NSUInteger precision;
/**
 Switches rounding mode for mathematic operation results.
 When false passed LCCalc will use high quality mathematic rounding algorithm.
 If true passed then LCCalc will use low quality string rounding algorithm.
 @return Selected rounding mode.
 @see LCCalc.
 @warning This property is thread unsafe.
 */
@property (readwrite, nonatomic) BOOL badModeOn;

@end
