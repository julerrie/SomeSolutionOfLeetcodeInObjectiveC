//
//  rodCuttingDP.m
//  pratices
//
//  Created by Lan Luo on 2020/03/09.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "rodCuttingDP.h"

@implementation rodCuttingDP

-(int)solveRodCuttingDP:(NSArray *)price andRodLength:(int)rodLength {
    NSMutableArray *ans = [NSMutableArray new];
    for (int i = 0; i<=rodLength; i++){
        [ans addObject:[NSNumber numberWithInt:0]];
    }
    
    for(int i = 1; i<=rodLength; i++){
        for(int s = 1; s<=i; s++){
            int temp = MAX([[ans objectAtIndex:i] intValue], [[ans objectAtIndex: i-s] intValue] + [[price objectAtIndex:s-1] intValue]);
            [ans replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:temp]];
        }
    }
    return [[ans objectAtIndex:rodLength] intValue];
}

@end
