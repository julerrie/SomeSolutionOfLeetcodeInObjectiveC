//
//  NQueenProblem.m
//  pratices
//
//  Created by Lan Luo on 2020/03/04.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "NQueenProblem.h"

@interface NQueen ()
@property (nonatomic, assign) NSInteger n;
@end

@implementation NQueen



- (void)doNQueenWith:(NSMutableArray *)queen andSum:(NSMutableArray *)sum anddif:(NSMutableArray *)dif arrayList:(NSMutableArray *)arr {
    if (queen.count == self.n) {
        [arr addObject:[queen copy]];
        return;
    }
    for (NSInteger i = 0; i < self.n; i++) {
        Boolean possibleAns = true;
        NSInteger tempSum = i + queen.count;
        NSInteger tempDif = i - queen.count;
        for (NSInteger j = 0; j < queen.count; j++) {
            if ([[queen objectAtIndex:j] integerValue] == i) {
                possibleAns = false;
                break;
            }
        }
        for (NSInteger j = 0; j < sum.count; j++) {
            if ([[sum objectAtIndex:j] integerValue] == tempSum) {
                possibleAns = false;
                break;
            }
        }
        for (NSInteger j = 0; j < dif.count; j++) {
            if ([[dif objectAtIndex:j] integerValue] == tempDif) {
                possibleAns = false;
                break;
            }
        }
        if (possibleAns) {
            [queen addObject:[NSNumber numberWithInteger:i]];
            [sum addObject:[NSNumber numberWithInteger:tempSum]];
            [dif addObject:[NSNumber numberWithInteger:tempDif]];
            [self doNQueenWith:queen andSum:sum anddif:dif arrayList:arr];
            [queen removeLastObject];
            [sum removeLastObject];
            [dif removeLastObject];
        }
    }
}

- (NSMutableArray *)nQueenAlgorithm:(NSInteger)num {
    NSMutableArray *arr = [NSMutableArray new];
    self.n = num;
    [self doNQueenWith:[NSMutableArray new] andSum:[NSMutableArray new] anddif:[NSMutableArray new] arrayList:arr];
    return [arr copy];
}


@end
