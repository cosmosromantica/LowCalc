//
//  ViewController.m
//  LowCalc
//
//  Created by Александр Гелета on 07.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowClosed:) name:NSWindowWillCloseNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputTextDidChange:) name:NSControlTextDidChangeNotification object:_inputTextField];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)windowClosed:(NSNotification *)notification {
#ifdef DEBUG
    NSLog(@"Terminating application...");
#endif
    [[NSApplication sharedApplication] terminate:self];
}

- (void)inputTextDidChange:(NSNotification *)notification {
    NSString *inputString = [notification.object stringValue];
#ifdef DEBUG
    NSLog(@"Input expression string changed... (%@)", inputString);
#endif
}

@end
