//
//  NumberIndicator.m
//  NumberIndicator
//
//  Created by Masakiyo on 2015/02/05.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import "NumberIndicator.h"

@interface NumberIndicator() {
	CGRect _upper;
	CGRect _middle;
	CGRect _lower;
	
	/// 表示すべき番号
	NSInteger _num;
	
	/// アニメーション中
	BOOL _transitioning;
}

@property (nonatomic, weak) IBOutlet UIView *view;
@property (nonatomic, weak) IBOutlet UILabel *label1;
@property (nonatomic, weak) IBOutlet UILabel *label2;

@end

@implementation NumberIndicator

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
	}
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	_num = 0;
	self.view.layer.masksToBounds = YES;
	self.label1.text = @"0";
	self.label2.text = @"0";
	CGFloat h = self.view.bounds.size.height;
	_middle = _lower = _upper = self.label1.frame;
	_lower.origin.y += h;
	_upper.origin.y -= h;
	self.label1.frame = _middle;
	self.label2.frame = _upper;
	
}

+ (instancetype)instance {
	NSString *className = NSStringFromClass([self class]);
	return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}

- (void)setNumber:(NSInteger)num {
	_num = num;
	self.label1.text = [NSString stringWithFormat:@"%ld", _num];
	self.label1.frame = _middle;
	self.label2.frame = _upper;
}

- (void)increment {
	if ([self changeNumberFrom:_num toPositive:YES]) {
		_num++;
	}
}

- (void)decrement {
	if ([self changeNumberFrom:_num toPositive:NO]) {
		_num--;
	}
}

- (BOOL)changeNumberFrom:(NSInteger)from toPositive:(BOOL)positive {
	
	__block BOOL positive_ = positive;
	__block NSInteger from_ = from;
	__block NSInteger to_ = from_ + (positive_ ? 1 : -1);
	
	if (to_ > 99 || to_ < 0) {
		return NO;
	}
	
	if (_transitioning) {
		return YES;
	}
	
	self.label2.text = [NSString stringWithFormat:@"%ld", from];
	self.label2.frame = _middle;
	
	self.label1.text = [NSString stringWithFormat:@"%ld", to_];
	self.label1.frame = (positive_ ? _upper : _lower);
	
	_transitioning = YES;
	[UIView animateWithDuration:0.5f
						  delay:0.0f
						options:UIViewAnimationOptionCurveEaseIn
					 animations:^{
						 self.label2.frame = (positive_ ? _lower : _upper);
						 self.label1.frame = _middle;
					 } completion:^(BOOL finished) {
						 _transitioning = NO;
						 if (to_ != _num) {
							 [self changeNumberFrom:to_ toPositive:(_num > to_)];
						 }
					 }];
	return YES;
}

@end
