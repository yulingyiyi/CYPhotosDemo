//
//  CYPhotosPreCollectionViewCell.h
//  CYPhotosDemo
//
//  Created by SX on 2017/6/3.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYPhotosPreCollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView  *imageView;
@end
