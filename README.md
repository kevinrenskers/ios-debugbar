# ios-debugbar

Simply swipe down with 2 fingers to show a debug bar with customizable buttons.

![Screenshots](https://raw.github.com/kevinrenskers/ios-debugbar/master/screenshot.png)

Example:

```objective-c
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
```
