//
//  sumOfThreeValue.m
//  pratices
//
//  Created by Lan Luo on 2020/03/05.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "sumOfThreeValue.h"

@implementation sumOfThreeValue

- (NSComparisonResult)compare:(NSInteger *)other {
    return [self compare:other];
}


-(NSMutableArray *)sumOfThreeValue:(NSArray *)inputArray {
    NSMutableArray *result = [NSMutableArray new];
    if (inputArray.count == 0) {
        return result;
    } else {
        inputArray = [inputArray sortedArrayUsingSelector:@selector(compare:)];
        for(NSInteger i = 0; i < inputArray.count-2; i++) {
            NSInteger first = [[inputArray objectAtIndex:i] integerValue];
            if (first > 0) {
                break;
            } else if(i > 0 && [[inputArray objectAtIndex:i] integerValue] == [[inputArray objectAtIndex:i-1] integerValue]) {
                continue;
            } else {
                NSInteger left = i + 1;
                NSInteger right = inputArray.count - 1;
                while (left < right) {
                    NSInteger sum = [[inputArray objectAtIndex:left] integerValue] + [[inputArray objectAtIndex:right] integerValue]  + first;
                    if (sum > 0) {
                        right--;
                    } else if (sum < 0) {
                        left++;
                    } else {
                        NSArray *newArray = [NSArray arrayWithObjects: [inputArray objectAtIndex:i], [inputArray objectAtIndex:left], [inputArray objectAtIndex:right], nil];
                        [result addObject:newArray];
                    }
                    while (left < right && [[inputArray objectAtIndex:left] integerValue] == [[inputArray objectAtIndex:left+1] integerValue]) {
                        left++;
                    }
                    while (left < right && [[inputArray objectAtIndex:right] integerValue] == [[inputArray objectAtIndex:right-1] integerValue]) {
                        right--;
                    }
                    left++;
                    right--;
                }
            }
        }
    }
    return [result copy];
}

@end
