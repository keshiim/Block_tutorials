//
//  main.m
//  Block_tutorials
//
//  Created by ygl10 on 13-11-21.
//  Copyright (c) 2013年 ygl10. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import <dispatch/dispatch.h>

typedef void (^BlockA)(void);

__attribute__((noinline))

void runBlockA(BlockA block) {
    
    block();
}

void doBlockA() {
    
    BlockA block = ^{
        
        //Empty block
        NSLog(@"doBlockA()");
    };
    
    runBlockA(block);
}

typedef double(^block_name)(double a, double b) ;
typedef int int_m;
//typedef double *func_nam(double a, double b);


typedef unsigned char ColorComponent;

typedef struct {
    
    unsigned char red;
    unsigned char green;
    unsigned char blue;
    
}Color;

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //////////////////////
        ColorComponent red = 255;
        ColorComponent green = 160;
        ColorComponent blue = 0;
        
        NSLog(@"Your paint job is (R: %hhu, G: %hhu, B: %hhu)", red, green, blue);
        
        ////////////////////////
        Color carColor = {255,160, 0};
        NSLog(@"Car color is (R: %hhu, G: %hhu, B: %hhu)", carColor.red, carColor.green, carColor.blue);
        
        /**********/
        doBlockA();
        /**********/
        
        // Declare the block variabel
        
        double (^distanceFromRateAndTime)(double rate, double time);
        
        // Create and assign the block
        
        distanceFromRateAndTime = ^double(double rate, double time) {
            
            return rate * time;
        };
        
        block_name blocks = ^double(double rate, double time) {
            return rate * time;
        };
        
        double block_double = blocks(220, 1.5);
        
        // Call the block
        int_m a = 1;
        double dx = distanceFromRateAndTime(20, 1.5);
        
        NSLog(@"A car driving 2 mph will travel \"%.2f\" miles in 1.5 hours."
              @" And int=%d ,,, so the blocks = %.2f", dx, a, block_double);
        
        ///////////////////////////////////////
        double (^randomPercent)(void) = ^double{
            
            return (double)arc4random() / 4294967295;
        };
        
        NSLog(@"Gas tank is %.1f%% full", randomPercent() * 100);
        
        
        ////////////////////////////////////////
        
        //  Block 的闭包性
        NSString *make = @"Honda";
        
        NSString *(^getFullCarName)(NSString *model) = ^NSString *(NSString *model){
            
            return [make stringByAppendingFormat:@" %@", model];
        };
        
        NSLog(@"%@", getFullCarName(@"Accord")); //Honda Accord
        
        // Try changing the non-local variable (it wont change the block)
        make = @"Porsche";
        NSLog(@"%@", getFullCarName(make)); // Honda 911 Turbo.
        
        // __block
        
        __block int i = 0;
        
        int (^count)(void) = ^int{
            return i += 1;
        };
        
        NSLog(@"%d", count());
        NSLog(@"%d", count());
        NSLog(@"%d", count());

        /////////////////////////////////////////////
        Car *theCar = [[Car alloc] init];
        [theCar driveForDuration:10.0
                withVariableSeep:^double(double time) {
                    return 5.0;
                }
                           steps:100];
        
        NSLog(@"The car has now driven %.2f meters", theCar.odometer);
        
        ////////////////////////////////////////////
        void (^block)(int a) = ^(int a){
            NSLog(@"Im a block! a = %i", a);
        };
        
        block(1);
        
        /////////////////////////////////////////////
        int years[4] = {2001, 2020, 23, 4};
        years[0] = 1234;
        for (int i = 0; i < 4; i++) {
            NSLog(@"The year at index %d is: %d", i, years[i]);
        }
        
        ////////////////////////////////////
        char model[5] = {'H', 'o', 'n', 'd', 'a'};
        char *modelPointer = model;
        
        for (int i=0; i<5; i++) {
            NSLog(@"Vallue at memory address %p is %c", modelPointer, *modelPointer);
            modelPointer++;
        }
        NSLog(@"The first letter is %c", *(modelPointer - 5));
        
        /////////////////////////////////////
        int year = 752;
        int *pointer = &year;
        NSLog(@"%d", *pointer);
        pointer = NULL;
    }
    return 0;
}

