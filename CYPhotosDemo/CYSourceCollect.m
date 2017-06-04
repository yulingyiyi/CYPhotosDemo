//
//  CYSourceCollect.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/2.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "CYSourceCollect.h"

@implementation CYSourceCollect
- (void)addObject:(id)object{
    if (!_set) {
        _set = [NSMutableArray arrayWithCapacity:1];
    }
    [_set addObject:object];
    self.countKey = _set.count;

}
- (void)removeObject:(id)object{
    if (!_set) {
        _set = [NSMutableArray arrayWithCapacity:1];
    }
    [_set removeObject:object];
    self.countKey = _set.count;
}
@end
