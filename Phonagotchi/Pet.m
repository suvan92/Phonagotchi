//
//  Pet.m
//  Phonagotchi
//
//  Created by Suvan Ramani on 2016-11-10.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isGrumpy = NO;
        _isHappy = YES;
    }
    return self;
}

-(void)petting:(CGPoint)velocity {
    
    if (velocity.x > 5000) {
        NSLog(@"%@", NSStringFromCGPoint(velocity));
    }
    
    
    if (velocity.x > 10000) {
        self.isGrumpy = YES;
        self.isHappy = NO;
    } else if ((velocity.x < 10000) && (velocity.x > 1000)) {
        self.isHappy = YES;
        self.isGrumpy = NO;
    }
    
}

@end
