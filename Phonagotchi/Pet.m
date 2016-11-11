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
    }
    return self;
}

-(void)petting:(CGPoint)velocity {
    
    if (velocity.x > 10000) {
        self.isGrumpy = YES;
    } else if ((velocity.x > 1000) && (velocity.x < 10000)) {
        self.isGrumpy = NO;
    }
}

@end
