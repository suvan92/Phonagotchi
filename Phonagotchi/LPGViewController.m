//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "Pet.h"

@interface LPGViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *petImageView;
@property (nonatomic, strong) UIImageView *appleImageView;
@property (nonatomic, strong) UIImageView *bucketImageView;
@property (nonatomic, strong) IBOutlet UIPanGestureRecognizer *panGR;
@property (nonatomic, strong) Pet *pet;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.petImageView.userInteractionEnabled = YES;
    
    
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    self.panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                         action:@selector(handlePettingGesture:)];
    
    [self.petImageView addGestureRecognizer:self.panGR];
    
    self.pet = [[Pet alloc] init];
    
    
}

-(void)handlePettingGesture:(UIPanGestureRecognizer *)panGesture {
    CGPoint petVelocity = [panGesture velocityInView:self.petImageView];
    
    [self.pet petting:petVelocity];
    
    if (self.pet.isGrumpy) {
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
    } else if (!self.pet.isGrumpy) {
        self.petImageView.image = [UIImage imageNamed:@"default"];
    }
}



@end
