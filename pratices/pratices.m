//
//  praticves.m
//  pratices
//
//  Created by Lan Luo on 2020/03/03.
//  Copyright © 2020 Lan. All rights reserved.
//

#import <Foundation/Foundation.h>

void selectionSort(NSMutableArray *arr) {
    NSUInteger index = 0;
    for (NSUInteger i = 0; i < arr.count - 1; i++) {
        index = i;
        for(NSUInteger j = i + 1; j < arr.count; j++) {
            if ([[arr objectAtIndex:j] integerValue] < [[arr objectAtIndex:index] integerValue]) {
                index = j;
            }
        }
        if (index != i) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:index];
        }
    }
}


void bubbleSort(NSMutableArray *arr) {
    for (NSUInteger i = 0; i < arr.count-1; i++) {
        for(NSUInteger j = 0; j < arr.count - i -1; j++) {
            if ([[arr objectAtIndex:j] integerValue] > [[arr objectAtIndex: j+1] integerValue]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
}


void insersionSort(NSMutableArray *arr) {
    for (NSUInteger i = 0; i < arr.count; i++) {
        NSUInteger j = i;
        NSNumber *target = [arr objectAtIndex:i];
        while (j > 0 && (target.integerValue < [[arr objectAtIndex: j - 1] integerValue])) {
            [arr exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            j--;
        }
        [arr replaceObjectAtIndex:j withObject:target];
    }
}

void doMerge(NSMutableArray *arr, NSUInteger arr1, NSUInteger mid, NSUInteger arr2) {
    NSMutableArray *newMergeArray = [[NSMutableArray alloc] init];
    NSUInteger i1 = arr1;
    NSUInteger i2 = mid;
    while (i1 != mid && i2 != arr2) {
        if ([[arr objectAtIndex:i1] integerValue] < [[arr objectAtIndex:i2] integerValue]) {
            NSNumber *ans = [arr objectAtIndex:i1];
            [newMergeArray addObject:ans];
            i1++;
        } else {
            NSNumber *ans = [arr objectAtIndex:i2];
            [newMergeArray addObject:ans];
            i2++;
        }
    }
    
    if (i1 < mid) {
        for (NSUInteger i = i1; i < mid; i++) {
            [newMergeArray addObject:[arr objectAtIndex:i]];
        }
    }
    if (i2 < arr2) {
        for (NSUInteger i = i2; i < arr2; i++) {
            [newMergeArray addObject:[arr objectAtIndex:i]];
        }
    }
    
    i1 = arr1;
    
    for (NSUInteger i =0; i < newMergeArray.count; i++) {
        [arr replaceObjectAtIndex:i1 withObject:[newMergeArray objectAtIndex:i]];
        i1++;
    }
}

void midMergeProcess(NSMutableArray *arr, NSUInteger first, NSUInteger last) {
    if (first + 1 < last) {
        NSUInteger mid = (first + last)/2;
        midMergeProcess(arr, first, mid);
        midMergeProcess(arr, mid, last);
        doMerge(arr, first, mid, last);
    }
}

void mergeSort(NSMutableArray *arr) {
    midMergeProcess(arr, 0, arr.count);
}

void midQuickSort(NSMutableArray *arr, NSInteger start, NSInteger end) {
    if (start < end) {
        NSNumber *pivot = [arr objectAtIndex:end];
        NSInteger startPoint = start;
        NSInteger endPoint = end - 1;
        while (startPoint <= endPoint) {
            if ([[arr objectAtIndex:startPoint] integerValue] > pivot.integerValue && [[arr objectAtIndex:endPoint] integerValue] < pivot.integerValue) {
                [arr exchangeObjectAtIndex:startPoint withObjectAtIndex:endPoint];
                startPoint++;
                endPoint--;
            } else {
                if ([[arr objectAtIndex:startPoint] integerValue] <= pivot.integerValue){
                    startPoint ++;
                }
                if ([[arr objectAtIndex:endPoint] integerValue] >= pivot.integerValue) {
                    endPoint --;
                }
            }
        }
        [arr exchangeObjectAtIndex:startPoint withObjectAtIndex:end];
        if (start < (startPoint - 1)) {
            midQuickSort(arr, start, startPoint-1);
        }
        if ((startPoint + 1) < end) {
            midQuickSort(arr, startPoint+1, end);
        }
    }
}


void quickSort(NSMutableArray *arr) {
    midQuickSort(arr, 0, arr.count - 1);
}


void objcSort(NSMutableArray *arr) {
    [arr sortUsingComparator:^NSComparisonResult(NSNumber *n1, NSNumber *n2) {
        return [n1 compare:n2];
    }];
}
