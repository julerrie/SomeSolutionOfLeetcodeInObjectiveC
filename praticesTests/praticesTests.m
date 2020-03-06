//
//  praticesTests.m
//  praticesTests
//
//  Created by Lan Luo on 2020/03/03.
//  Copyright © 2020 Lan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "pratices.h"
#import "NQueenProblem.h"
#import "RecursiveProblem.h"
#import "reverseNodes.h"
#import "sumOfThreeValue.h"
#import "sodokuQuestion.h"


@interface praticesTests : XCTestCase
@property (strong, nonatomic) NSArray *sortedArray;
@property (strong, nonatomic) NSMutableArray *unsortedArray;
@end

@implementation praticesTests

- (void)setUp {
    [super setUp];
    self.sortedArray = [NSArray arrayWithObjects:@0, @1, @4, @10, @23, @34, @34, @35, @66, @75, @87, @98, @687, @809, @9324, nil];
    self.unsortedArray = [NSMutableArray arrayWithObjects:@23, @87, @1, @0, @34, @687, @34, @75, @10, @9324, @809, @98, @35, @4, @66, nil];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    self.sortedArray = nil;
    self.unsortedArray = nil;
    [super tearDown];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testSelectionSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    selectionSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testBubbleSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    bubbleSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testInsersionSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray]);
    insersionSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray]);
}

- (void)testMergeSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray]);
    mergeSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray]);
}

- (void)testQuickSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray]);
    quickSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray]);
}

- (void)testNQueenProblem
{
    NQueen *test = [[NQueen alloc] init];
    [test nQueenAlgorithm:4];
}

//- (void)testRecursiveProblem
//{
//    RecursiveProblem *test = [RecursiveProblem new];
//    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.sortedArray];
//    [test recursiveProblem:arr];
//}

- (void)testReverseNodes {
    ListNode *t1 = [[ListNode alloc]init:1];
    ListNode *t2 = [[ListNode alloc]init:2];
    ListNode *t3 = [[ListNode alloc]init:3];
    ListNode *t4 = [[ListNode alloc]init:4];
    ListNode *t5 = [[ListNode alloc]init:5];
    ListNode *t6 = [[ListNode alloc]init:6];
    t1.next = t2;
    t2.next = t3;
    t3.next = t4;
    t4.next = t5;
    t5.next = t6;
    
    reverseNodes *test = [[reverseNodes alloc] init];
    [test reverseNodes:2 andListNode:t1];
    
}

- (void)testSumOfThreeValue {
    NSArray *arr = [NSArray arrayWithObjects: @(-1), @0, @1, @2, @(-1), @(-4), nil];
    sumOfThreeValue *test = [[sumOfThreeValue alloc] init];
    [test sumOfThreeValue:arr];
    
}

-(void)testSodokuQuestion {
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@[@"5",@"3",@".",@".",@"7",@".",@".",@".",@"."],
                                                    @[@"6",@".",@".",@"1",@"9",@"5",@".",@".",@"."],
                                                    @[@".",@"9",@"8",@".",@".",@".",@".",@"6",@"."],
                                                    @[@"8",@".",@".",@".",@"6",@".",@".",@".",@"3"],
                                                    @[@"4",@".",@".",@"8",@".",@"3",@".",@".",@"1"],
                                                    @[@"7",@".",@".",@".",@"2",@".",@".",@".",@"6"],
                                                    @[@".",@"6",@".",@".",@".",@".",@"2",@"8",@"."],
                                                    @[@".",@".",@".",@"4",@"1",@"9",@".",@".",@"5"],
                                                    @[@".",@".",@".",@".",@"8",@".",@".",@"7",@"9"]]];
    sodokuQuestion *test = [[sodokuQuestion alloc]init];
    [test solveSodokuQuestion:arr];
}

@end
