# ios-debugbar

Simply swipe down with 2 fingers to show a debug bar with customizable buttons. I use it for example to create or delete test data, force a reload, clean the cache, etc.

![Screenshots](https://raw.github.com/kevinrenskers/ios-debugbar/master/screenshot.png)

## Example

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

## Custom activation methods

The default activation method is a two finger swipe down, but this is easily changed:

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // ...
    [[KRDebugBar sharedInstance] setupWithDelegate:self];
    // ...
    return YES;
}

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
```

You could also very easily add shake detection by adding this to your AppDelegate:

```objective-c
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype==UIEventSubtypeMotionShake) {
        [[KRDebugBar sharedInstance] toggle];
    }
}
```
