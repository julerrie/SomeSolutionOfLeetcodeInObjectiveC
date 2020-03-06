//
//  sodokuQuestion.m
//  pratices
//
//  Created by Lan Luo on 2020/03/06.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "sodokuQuestion.h"

@implementation sodokuQuestion

-(BOOL)isInRow:(NSMutableArray *)board andChar:(NSString *)ch andI:(int)i{
    NSMutableArray *subArray = [board objectAtIndex:i];
    for (NSString *element in subArray){
        if ([element isEqualToString:ch]){
            return true;
        }
    }
    return false;
}

-(BOOL)isInColoum:(NSMutableArray *)board andChar:(NSString *)ch andJ:(int)j{
    for (NSMutableArray *subArray in board) {
        if ([[subArray objectAtIndex:j] isEqualToString:ch]) {
            return true;
        }
    }
    return false;
}

-(BOOL)isInSquare:(NSMutableArray *)board andChar:(NSString *)ch andI:(int)i andJ:(int)j {
    int lastRow = ((int)i/3 + 1) * 3;
    int lastColoum = (j/3 + 1) *3;
    for (int row = (int)i/3 * 3; row < lastRow; row++) {
        for (int coloum = (int)j/3 * 3; coloum < lastColoum; coloum++) {
            if ([[[board objectAtIndex:row] objectAtIndex:coloum] isEqualToString:ch]) {
                return true;
            }
        }
    }
    return false;
}

-(BOOL)checkSodokuAvaliable:(NSMutableArray *)board andIndex:(int)index{
    if (index >= 81){
        return true;
    } else {
        int i = index/9;
        int j = index%9;
        if (![[[board objectAtIndex:i] objectAtIndex:j] isEqualToString:@"."]) {
            return [self checkSodokuAvaliable:board andIndex:(index+1)];
        } else {
            NSArray *charArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
            for (NSString *s in charArray) {
                if (![self isInRow:board andChar:s andI:i] && ![self isInColoum:board andChar:s andJ:j] && ![self isInSquare:board andChar:s andI:i andJ:j]) {
                    NSString *beforeArray = [board objectAtIndex:i];
                    NSMutableArray *subArray = [beforeArray mutableCopy];
                    [subArray replaceObjectAtIndex:j withObject:s];
                    [board replaceObjectAtIndex:i withObject:subArray];
                    if ([self checkSodokuAvaliable:board andIndex:(index + 1)]) {
                        return true;
                    } else {
                        [board replaceObjectAtIndex:i withObject:beforeArray];
                    }
                }
            }
            return false;
        }
    }
}


-(NSMutableArray *)solveSodokuQuestion:(NSMutableArray *)arr {
    [self checkSodokuAvaliable:arr andIndex:0];
    return [arr copy];
}

@end
