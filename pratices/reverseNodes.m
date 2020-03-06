//
//  reverseNodes.m
//  pratices
//
//  Created by Lan Luo on 2020/03/05.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "reverseNodes.h"

@implementation reverseNodes

- (ListNode *)reverseNodes:(NSInteger)k andListNode:(ListNode *)listNode {
    ListNode *ansNode = [[ListNode alloc] init:0];
    ListNode *result = ansNode;
    [self doReverse:listNode andk:k ansNode:ansNode];
    return result.next;
    
}

-(void)doReverse:(ListNode *)listNode andk:(NSInteger)k ansNode:(ListNode *)ansNode {
    ListNode *rest = listNode;
    ListNode *tempNode = [[ListNode alloc] init:0];
    for (NSInteger i = 0; i < k; i++) {
        if (rest == nil) {
            ansNode.next = listNode;
            ansNode = ansNode.next;
            return;
        } else {
            if (i == 0){
                tempNode = [[ListNode alloc] init:rest.val];
                rest = rest.next;
            } else {
                ListNode *next = rest.next;
                rest.next = tempNode;
                tempNode = rest;
                rest = next;
            }
        }
    }
    ansNode.next = tempNode;
    ansNode = tempNode.next;
    [self doReverse:rest andk:k ansNode:ansNode];
    
}


@end
