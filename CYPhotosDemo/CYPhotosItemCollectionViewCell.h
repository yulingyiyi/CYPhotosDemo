//
//  CYPhotosItemCollectionViewCell.h
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CYPhotosItemCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton    *selectedBtn;
@property (copy) BOOL (^blok)(UIImage *image, BOOL selected);
@end
