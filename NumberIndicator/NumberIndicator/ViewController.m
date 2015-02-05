//
//  ViewController.m
//  NumberIndicator
//
//  Created by Masakiyo on 2015/02/05.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import "ViewController.h"
#import "NumberIndicator.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *niView;
@property (nonatomic, weak) NumberIndicator *ni;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.ni = [NumberIndicator instance];
	[self.niView addSubview:self.ni];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)incrementTapped:(id)sender {
	[self.ni increment];
}

- (IBAction)decrementTapped:(id)sender {
	[self.ni decrement];
}

@end
