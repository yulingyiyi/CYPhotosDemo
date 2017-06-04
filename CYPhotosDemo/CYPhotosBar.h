//
//  CYPhotosBar.h
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYPhotosBar : UITabBar
@property (nonatomic, strong) UIButton *editBtn;//编辑
@property (nonatomic, strong) UIButton *preBtn;// 预览
@property (nonatomic, strong) UIButton *finishBtn;//完成
@property (nonatomic, strong) UILabel *numL;//数量
- (void)updateBottomBar:(NSUInteger)count;
@end
