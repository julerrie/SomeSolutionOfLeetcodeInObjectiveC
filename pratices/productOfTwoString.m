//
//  productOfTwoString.m
//  pratices
//
//  Created by Lan Luo on 2020/03/10.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "productOfTwoString.h"

@implementation productOfTwoString



-(int)productOfTwoString:(NSString *)str1 andStr2:(NSString *)str2 {
    int length1 = (int)[str1 length];
    int length2 = (int)[str2 length];
    NSMutableArray *ansArray = [NSMutableArray new];
    for(int i = 0; i<length1 + length2; i++) {
        [ansArray addObject: [NSNumber numberWithInt: 0]];
    }
    int index = length1 + length2 -1;
    for (int i = length1 - 1; i>=0; i--) {
        int tempIndex = index;
        for (int j = length2 - 1; j>=0; j--) {
            int temp = [[str1 substringWithRange:NSMakeRange(i, 1)] intValue] * [[str2 substringWithRange:NSMakeRange(j, 1)] intValue];
            int smallerDecimal = [[ansArray objectAtIndex:tempIndex] intValue];
            int biggerDecimal = [[ansArray objectAtIndex: tempIndex-1] intValue];
            temp = temp + smallerDecimal;
            smallerDecimal = temp%10;
            biggerDecimal = biggerDecimal + temp/10;
            [ansArray replaceObjectAtIndex:tempIndex withObject:[NSNumber numberWithInt:smallerDecimal]];
            [ansArray replaceObjectAtIndex:tempIndex-1 withObject:[NSNumber numberWithInt:biggerDecimal]];
            tempIndex = tempIndex -1;
        }
        index = index -1;
    }
    
    int times = 0;
    int ans = 0;
    for (int i = length2 + length2 -1; i >= 0; i--) {
        ans = ans + [[ansArray objectAtIndex:i] intValue] * pow(10, times);
        times = times+1;
    }
    return ans;
}
@end
