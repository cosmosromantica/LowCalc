//
//  LCCalc+LCCalcSingleExpressionString.h
//  LowCalc
//
//  Created by Александр Гелета on 09.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import "LCCalc.h"

@interface LCCalc (LCCalcSingleExpressionString)

- (NSNumber*_Nonnull)computeSingleExpressionString:(NSString*_Nonnull)expressionString;
- (NSArray<NSString*>*_Nonnull)parseSingleExpressionString:(NSString*_Nonnull)expressionString;

@end
