//
//  MCDebugBar.h
//  Example
//
//  Created by Kevin Renskers on 13-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCDebugBar : NSObject

+ (MCDebugBar *)sharedInstance;

- (void)setup;
- (void)addButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock;

- (void)show;
- (void)hide;
- (void)toggle;

@end
