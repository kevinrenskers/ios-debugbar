//
//  KRDebugBar.m
//  Example
//
//  Created by Kevin Renskers on 13-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import "KRDebugBar.h"
#import "KRDebugBarButton.h"


@interface KRDebugBar ()
@property (strong, nonatomic) UIScrollView *containerView;
@property (strong, nonatomic) UIToolbar *toolBar;
@property (strong, nonatomic) NSMutableArray *toolbarItems;
@property (weak, nonatomic) id<KRDebugBarDelegate> delegate;
@end


@implementation KRDebugBar

+ (KRDebugBar *)sharedInstance {
    static dispatch_once_t pred;
    static KRDebugBar *sharedInstance = nil;
    dispatch_once(&pred, ^{ sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

#pragma mark - Setup, showing and hiding

- (void)setup {
    [self setupWithDelegate:nil];
}

- (void)setupWithDelegate:(id<KRDebugBarDelegate>)delegate {
    self.delegate = delegate;

    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window makeKeyAndVisible];

    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -44, window.frame.size.width, 44)];
    self.containerView.hidden = YES;

    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.containerView.frame.size.width, self.containerView.frame.size.height)];
    self.toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    [self.containerView setContentSize:self.toolBar.frame.size];
    [self.containerView addSubview:self.toolBar];

    self.toolbarItems = [NSMutableArray array];

    [window addSubview:self.containerView];

    if (self.delegate && [self.delegate respondsToSelector:@selector(debugBar:addActivationMethodToWindow:)]) {
        [self.delegate debugBar:self addActivationMethodToWindow:window];
    } else {
        // Default activation method is a two-finger swipe down, and up to dismiss.
        UISwipeGestureRecognizer *swipeDownRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
        swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
        swipeDownRecognizer.numberOfTouchesRequired = 2;
        [window addGestureRecognizer:swipeDownRecognizer];

        UISwipeGestureRecognizer *swipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
        swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
        swipeUpRecognizer.numberOfTouchesRequired = 2;
        [window addGestureRecognizer:swipeUpRecognizer];
    }
}

- (void)swipeDown:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self show];
    }
}

- (void)swipeUp:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self hide];
    }
}

- (BOOL)isVisible {
    return !self.containerView.hidden;
}

- (void)show {
    if (![self isVisible]) {
        self.containerView.hidden = NO;

        [UIView animateWithDuration:0.5 animations:^{
            self.containerView.frame = CGRectMake(self.containerView.frame.origin.x, 20, self.containerView.frame.size.width, self.containerView.frame.size.height);
        }];
    }
}

- (void)hide {
    if ([self isVisible]) {
        [UIView animateWithDuration:0.5 animations:^{
            self.containerView.frame = CGRectMake(self.containerView.frame.origin.x, -self.containerView.frame.size.height, self.containerView.frame.size.width, self.containerView.frame.size.height);
        } completion:^(BOOL finished) {
            self.containerView.hidden = YES;
        }];
    }
}

- (void)toggle {
    if ([self isVisible]) {
        [self hide];
    } else {
        [self show];
    }
}

#pragma mark - Actions

- (void)addButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock {
    KRDebugBarButton *item = [[KRDebugBarButton alloc] initWithTitle:title action:actionBlock];
    [self.toolbarItems addObject:item];

    self.toolBar.items = self.toolbarItems;

    UIView *lastItem = self.toolBar.subviews.lastObject;
    float newWidth = lastItem.frame.origin.x + lastItem.frame.size.width + 5;
    newWidth = MAX(newWidth, self.containerView.frame.size.width);

    self.toolBar.frame = CGRectMake(0, 0, newWidth, self.containerView.frame.size.height);

    [self.containerView setContentSize:self.toolBar.bounds.size];
}

@end
