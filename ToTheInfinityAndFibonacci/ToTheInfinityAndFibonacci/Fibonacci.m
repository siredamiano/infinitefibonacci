//
//  Fibonacci.m
//  ToTheInfinityAndFibonacci
//
//  Created by Damian A Torres on 4/28/15.
//  Copyright (c) 2015 El Pueblito. All rights reserved.
//

#import "Fibonacci.h"
#import "JKBigInteger.h"

@interface Fibonacci()


@property (nonatomic, strong) JKBigInteger *previousValue;
@property (nonatomic, strong) JKBigInteger *value;
@end

@implementation Fibonacci

- (id)init{
    self = [super init];
    if (self) {
        self.previousValue = [[JKBigInteger alloc] initWithString:@"0"];
        self.value = [[JKBigInteger alloc] initWithString:@"0"];
    }
    
    return self;
}

- (JKBigInteger *)nextSequence {
    
    JKBigInteger *tempPreviousValue = self.previousValue;
    self.previousValue = self.value;
    
    JKBigInteger *result = [self.value add:tempPreviousValue];
    self.value = result;
    
    if ([[result stringValue] isEqualToString:@"0"] && [[self.previousValue stringValue] isEqualToString:@"0"]) {
        result = [[JKBigInteger alloc] initWithString:@"1"];
        self.value = result;
    }
    
    return result;
}



@end
