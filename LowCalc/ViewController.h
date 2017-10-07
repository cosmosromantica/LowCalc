//
//  ViewController.h
//  LowCalc
//
//  Created by Александр Гелета on 07.10.2017.
//  Copyright © 2017 Александр Гелета. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

- (void)windowClosed:(NSNotification*)notification;
- (void)inputTextDidChange:(NSNotification*)notification;
@property (weak) IBOutlet NSTextField *inputTextField;

@end

