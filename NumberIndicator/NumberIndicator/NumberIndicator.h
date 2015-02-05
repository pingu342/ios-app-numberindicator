//
//  NumberIndicator.h
//  NumberIndicator
//
//  Created by Masakiyo on 2015/02/05.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberIndicator : UIView

+ (instancetype)instance;
- (void)setNumber:(NSInteger)num;
- (void)increment;
- (void)decrement;

@end
