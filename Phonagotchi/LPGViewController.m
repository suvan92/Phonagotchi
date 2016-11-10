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
@property (nonatomic, strong) IBOutlet UIPinchGestureRecognizer *pinchGR;
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
    
    self.appleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.appleImageView.userInteractionEnabled = YES;
    self.appleImageView.image = [UIImage imageNamed:@"apple"];
    
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.bucketImageView.userInteractionEnabled = YES;
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    
    [self.view addSubview:self.petImageView];
    [self.view addSubview:self.bucketImageView];
    [self.view addSubview:self.appleImageView];
    
    // PET CONSTRAINTS
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
    
    
    // APPLE CONSTRAINTS
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.appleImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:0.25
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.appleImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.6
                                                           constant:0.0]];
    
    [self.appleImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.appleImageView
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:40]];
    
    [self.appleImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.appleImageView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:40]];
    // BUCKET CONSTRAINTS
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:0.25
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.63
                                                           constant:0.0]];
    
    [self.bucketImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:50]];
    
    [self.bucketImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:50]];
    
    
    self.panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                         action:@selector(handlePettingGesture:)];
    
    self.pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                             action:@selector(handleAppleGuestures:)];
    
    [self.petImageView addGestureRecognizer:self.panGR];
    [self.view addGestureRecognizer:self.pinchGR];
    
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

-(void)handleAppleGuestures:(UIPinchGestureRecognizer *)pinchGesture {
    
}



@end
