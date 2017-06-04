//
//  CYPhotosItemCollectionViewCell.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "CYPhotosItemCollectionViewCell.h"

@implementation CYPhotosItemCollectionViewCell

- (void)dealloc{

    _blok = nil;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_imageView];
        _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedBtn.frame = CGRectMake(frame.size.width - 20, 2, 18, 18);
        [_selectedBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
        [_selectedBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
        [self addSubview:_selectedBtn];
        [_selectedBtn addTarget:self action:@selector(selectedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)selectedBtnClick:(UIButton *)sender{

    if (_blok) {
        sender.selected = _blok(_imageView.image, sender.selected);
    }
}
@end
