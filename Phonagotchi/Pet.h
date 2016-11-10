//
//  Pet.h
//  Phonagotchi
//
//  Created by Suvan Ramani on 2016-11-10.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic) BOOL isGrumpy;

-(void)petting:(NSTimeInterval *)velocity;

@end
