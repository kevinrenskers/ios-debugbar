//
//  KRDebugBar.h
//  Example
//
//  Created by Kevin Renskers on 13-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIWindow, KRDebugBar;
@protocol KRDebugBarDelegate <NSObject>

@optional
- (void)debugBar:(KRDebugBar *)debugBar addActivationMethodToWindow:(UIWindow *)window;

@end


@interface KRDebugBar : NSObject

+ (KRDebugBar *)sharedInstance;

- (void)setup;
- (void)setupWithDelegate:(id<KRDebugBarDelegate>)delegate;

- (void)addButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock;

- (void)show;
- (void)hide;
- (void)toggle;

@end
