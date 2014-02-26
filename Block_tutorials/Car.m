//
//  Car.m
//  Block_tutorials
//
//  Created by ygl10 on 13-11-21.
//  Copyright (c) 2013年 ygl10. All rights reserved.
//

#import "Car.h"

@implementation Car

@synthesize odometer = _odometer;

- (void)driveForDuration:(double)duration
        withVariableSeep:(SpeedFunction)speedFunction
                   steps:(int)numSteps
{
    double dt = duration / numSteps;
    
    for (int i = 1; i <= numSteps; i++) {
        
        _odometer += speedFunction(i * dt) * dt;
    }
}

@end
