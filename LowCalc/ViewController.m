//
//  ViewController.m
//  LowCalc
//
//  Created by Александр Гелета on 07.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import "ViewController.h"
#import "LCCalc.h"
#import "LCCalc+LCCalcSingleExpressionString.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowClosed:) name:NSWindowWillCloseNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputTextDidChange:) name:NSControlTextDidChangeNotification object:_inputTextField];
    
    _calc = [[LCCalc alloc] initWithPrecision:_precisionSlider.integerValue];
    _formatter = [[NSNumberFormatter alloc] init];
    
    self.formatter.numberStyle = NSNumberFormatterDecimalStyle;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)windowClosed:(NSNotification *)notification {
    [[NSApplication sharedApplication] terminate:self];
}

- (void)inputTextDidChange:(NSNotification *)notification {
    [self.resultLabel setStringValue:
     [self.formatter stringFromNumber:
      [self.calc computeSingleExpressionString:
       [notification.object stringValue]]]];
}

- (IBAction)precisionSliderValueDidChange:(id)sender {
    [self.calc setPrecision:[sender integerValue]];
    
    [self.resultLabel setStringValue:
     [self.formatter stringFromNumber:
      [self.calc computeSingleExpressionString:
       self.inputTextField.stringValue]]];
}

- (IBAction)hqSwitchValueChanged:(id)sender {
    [self.calc setBadModeOn:[sender state]];
    
    [self.resultLabel setStringValue:
     [self.formatter stringFromNumber:
      [self.calc computeSingleExpressionString:
       self.inputTextField.stringValue]]];
}

@end
