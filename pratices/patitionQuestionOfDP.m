//
//  patitionQuestionOfDP.m
//  pratices
//
//  Created by Lan Luo on 2020/03/09.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "patitionQuestionOfDP.h"

@implementation patitionQuestionOfDP

-(BOOL)checkPatition:(NSArray *)arr andNumber:(int)n andSum:(int)sum {
    int length = (int)arr.count;
    NSMutableArray *ans = [NSMutableArray new];
    for (int i = 0; i<=length; i++){
        NSMutableArray *subArr = [NSMutableArray new];
        for(int j = 0; j<=sum; j++){
            if (j == 0){
                [subArr addObject:[NSNumber numberWithBool:TRUE]];
            } else {
                [subArr addObject:[NSNumber numberWithBool:FALSE]];
            }
        }
        [ans addObject:subArr];
    }
    
    for(int i = 1; i<=length; i++){
        for(int s = 1; s<=sum; s++){
            if (s < [[arr objectAtIndex:i-1] intValue]){
                [[ans objectAtIndex:i] replaceObjectAtIndex:s withObject:[[ans objectAtIndex:i-1]objectAtIndex:s]];
            } else {
                int subIndex = s - [[arr objectAtIndex:i-1] intValue];
                BOOL temp = [[[ans objectAtIndex:i-1] objectAtIndex:s] boolValue] || [[[ans objectAtIndex:i-1] objectAtIndex:subIndex] boolValue];
                [[ans objectAtIndex:i] replaceObjectAtIndex:s withObject:[NSNumber numberWithBool:temp]];
                
            }
        }
    }
    return ans[n][sum];
}

-(BOOL)solvePatitionQuestion:(NSArray *)arr {
    int sum = 0;
    for(int i = 0; i < arr.count; i++) {
        sum = sum + [[arr objectAtIndex:i] intValue];
    }
    if (sum%2 == 0){
        sum = sum/2;
        return [self checkPatition:arr andNumber:0 andSum:sum];
    } else {
        return FALSE;
    }
}
 
@end
