//
//  RecursiveProblem.m
//  pratices
//
//  Created by Lan Luo on 2020/03/04.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "RecursiveProblem.h"

@implementation RecursiveProblem

- (void)doRecursive:(NSMutableArray *)num andPath:(NSMutableArray *)path andAns:(NSMutableArray *)ans {
    if (num.count == 0) {
        [ans addObject:[path copy]];
        return;
    } else {
        for (NSInteger i = 0; i < num.count; i++) {
            NSInteger target = [[num objectAtIndex:i] integerValue];
            [num removeObjectAtIndex:i];
            [path addObject:[NSNumber numberWithInteger:target]];
            [self doRecursive:num andPath:path andAns:ans];
            [num insertObject:[NSNumber numberWithInteger:target] atIndex:i];
            [path removeLastObject];
        }
    }
}

- (NSMutableArray *)recursiveProblem:(NSMutableArray *)array {
    NSMutableArray *ans = [NSMutableArray new];
    [self doRecursive:array andPath:[NSMutableArray new] andAns:ans];
    return [ans copy];
}

@end
