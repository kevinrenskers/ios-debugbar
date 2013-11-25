//
//  AppDelegate.m
//  Example
//
//  Created by Kevin Renskers on 13-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import "AppDelegate.h"
#import "KRDebugBar.h"

@interface AppDelegate () <KRDebugBarDelegate>
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#if DEBUG
    [[KRDebugBar sharedInstance] setup];

    // Use this (instead of `setup` above) to have a custom gesture
    // recognizer rather then the default two finger swipes
    //[[KRDebugBar sharedInstance] setupWithDelegate:self];

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

/*
 * Enable to get custom activationg gesture.
 * Also uncomment the [[KRDebugBar sharedInstance] setupWithDelegate:self]; line above.
 *
- (void)debugBar:(KRDebugBar *)debugBar addActivationMethodToWindow:(UIWindow *)window {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    longPress.numberOfTouchesRequired = 3;
    [window addGestureRecognizer:longPress];
}

- (void)longPressed:(UIGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [[KRDebugBar sharedInstance] toggle];
    }
}
 */

@end
