//
//  KRDebugBarButton.h
//  Example
//
//  Created by Kevin Renskers on 20-11-13.
//  Copyright (c) 2013 mixedCase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRDebugBarButton : UIBarButtonItem

- (instancetype)initWithTitle:(NSString *)title action:(void (^)(void))actionBlock;

@end
