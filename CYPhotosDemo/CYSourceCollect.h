//
//  CYSourceCollect.h
//  CYPhotosDemo
//
//  Created by SX on 2017/6/2.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CYSourceCollect : NSObject
@property (nonatomic, strong) NSMutableArray *set;
@property (assign) NSUInteger  countKey;
- (void)addObject:(id)object;
- (void)removeObject:(id)object;
@end
