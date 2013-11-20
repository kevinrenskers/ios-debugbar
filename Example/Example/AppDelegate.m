//
//  AppDelegate.m
//  Example
//
//  Created by Kevin Renskers on 13-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import "AppDelegate.h"
#import "MCDebugBar.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#if DEBUG
    [[MCDebugBar sharedInstance] setup];

    [[MCDebugBar sharedInstance] addButtonWithTitle:@"Action 1" action:^{
        NSLog(@"Pressed action 1");
    }];

    [[MCDebugBar sharedInstance] addButtonWithTitle:@"Action 2" action:^{
        NSLog(@"Pressed action 2");
    }];

    [[MCDebugBar sharedInstance] addButtonWithTitle:@"Action 3" action:^{
        NSLog(@"Pressed action 3");
    }];

    [[MCDebugBar sharedInstance] addButtonWithTitle:@"Action 4" action:^{
        NSLog(@"Pressed action 4");
    }];

    [[MCDebugBar sharedInstance] addButtonWithTitle:@"Action 5" action:^{
        NSLog(@"Pressed action 5");
    }];
#endif

    return YES;
}
							
@end
