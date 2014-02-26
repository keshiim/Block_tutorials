//
//  Car.h
//  Block_tutorials
//
//  Created by ygl10 on 13-11-21.
//  Copyright (c) 2013年 ygl10. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef double (^SpeedFunction)(double time);

@interface Car : NSObject

@property (assign) double odometer;

- (void)driveForDuration:(double) duration
        withVariableSeep:(SpeedFunction) speedFunction
                   steps:(int) numSteps;

@end
