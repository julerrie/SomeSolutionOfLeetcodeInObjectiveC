//
//  ListNode.m
//  pratices
//
//  Created by Lan Luo on 2020/03/05.
//  Copyright © 2020 Lan. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

-(instancetype)init:(NSInteger)x {
    self = [super init];
    if (self) {
        self.val = x;
    }
    return self;
}

@end
