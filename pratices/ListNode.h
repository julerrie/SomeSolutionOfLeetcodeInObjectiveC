//
//  ListNode.h
//  pratices
//
//  Created by Lan Luo on 2020/03/05.
//  Copyright © 2020 Lan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic) ListNode *next;

- (instancetype)init: (NSInteger)x;

@end

NS_ASSUME_NONNULL_END
