//
//  AppDelegate.m
//  Example
//
//  Created by Kevin Renskers on 13-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import "AppDelegate.h"
#import "KRDebugBar.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#if DEBUG
    [[KRDebugBar sharedInstance] setup];

    [[KRDebugBar sharedInstance] addButtonWithTitle:@"Action 1" action:^{
        NSLog(@"Pressed action 1");
    }];

    [[KRDebugBar sharedInstance] addButtonWithTitle:@"Action 2" action:^{
        NSLog(@"Pressed action 2");
    }];

    [[KRDebugBar sharedInstance] addButtonWithTitle:@"Action 3" action:^{
        NSLog(@"Pressed action 3");
    }];

    [[KRDebugBar sharedInstance] addButtonWithTitle:@"Action 4" action:^{
        NSLog(@"Pressed action 4");
    }];

    [[KRDebugBar sharedInstance] addButtonWithTitle:@"Action 5" action:^{
        NSLog(@"Pressed action 5");
    }];
#endif

    return YES;
}
							
@end
