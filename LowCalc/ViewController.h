//
//  ViewController.h
//  LowCalc
//
//  Created by Александр Гелета on 07.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "LCCalc.h"
#include "LCCalc+LCCalcSingleExpressionString.h"

@interface ViewController : NSViewController

- (void)windowClosed:(NSNotification*)notification;
- (void)inputTextDidChange:(NSNotification*)notification;

- (IBAction)precisionSliderValueDidChange:(id)sender;
- (IBAction)hqSwitchValueChanged:(id)sender;

@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSSlider *precisionSlider;
@property (weak) IBOutlet NSButton *badModeOnSwitch;
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSTextField *resultLabel;

@property (readonly, nonatomic) LCCalc *calc;
@property (readonly, nonatomic) NSNumberFormatter *formatter;

@end

