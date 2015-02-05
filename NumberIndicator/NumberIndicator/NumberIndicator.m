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
	NSInteger _num;
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
	if (_num == 99) {
		return;
	}
	self.label2.text = [NSString stringWithFormat:@"%ld", _num];
	self.label2.frame = _middle;
	_num++;
	self.label1.text = [NSString stringWithFormat:@"%ld", _num];
	self.label1.frame = _upper;
	[UIView animateWithDuration:0.5f
						  delay:0.0f
						options:UIViewAnimationOptionCurveEaseIn
					 animations:^{
						 self.label2.frame = _lower;
						 self.label1.frame = _middle;
					 } completion:^(BOOL finished) {
						 
					 }];
}

- (void)decrement {
	if (_num == 0) {
		return;
	}
	self.label2.text = [NSString stringWithFormat:@"%ld", _num];
	self.label2.frame = _middle;
	_num--;
	self.label1.text = [NSString stringWithFormat:@"%ld", _num];
	self.label1.frame = _lower;
	[UIView animateWithDuration:0.5f
						  delay:0.0f
						options:UIViewAnimationOptionCurveEaseIn
					 animations:^{
						 self.label2.frame = _upper;
						 self.label1.frame = _middle;
					 } completion:^(BOOL finished) {
						 
					 }];
}

@end
