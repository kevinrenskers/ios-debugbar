//
//  KRDebugBarButton.m
//  Example
//
//  Created by Kevin Renskers on 20-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import "KRDebugBarButton.h"

@interface KRDebugBarButton ()
@property (nonatomic, copy) void (^actionBlock)(void);
@end

@implementation KRDebugBarButton

- (instancetype)initWithTitle:(NSString *)title action:(void (^)(void))actionBlock {
    self = [super initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(pressed)];
    if (self) {
        self.actionBlock = actionBlock;
    }

    return self;
}

- (void)pressed {
    if (self.actionBlock) self.actionBlock();
}

@end
