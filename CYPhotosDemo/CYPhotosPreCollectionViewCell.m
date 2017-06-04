//
//  CYPhotosPreCollectionViewCell.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/3.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "CYPhotosPreCollectionViewCell.h"
#import "CYConst.h"
@implementation CYPhotosPreCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, Khieght)];
        _scrollView.delegate = self;
        _scrollView.contentSize = _scrollView.frame.size;
        [_scrollView setMaximumZoomScale:2.0];
        [_scrollView setMinimumZoomScale:1.0];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _imageView = [[UIImageView alloc] initWithFrame:_scrollView.frame];
        [self addSubview:_scrollView];
        [self.scrollView addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = YES;
        _imageView.multipleTouchEnabled = YES;
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap:)];
        [singleTapGestureRecognizer setNumberOfTapsRequired:1];
        [_imageView addGestureRecognizer:singleTapGestureRecognizer];
        
        UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
        [doubleTapGestureRecognizer setNumberOfTapsRequired:2];
        [_imageView addGestureRecognizer:doubleTapGestureRecognizer];
        
        //这行很关键，意思是只有当没有检测到doubleTapGestureRecognizer 或者 检测doubleTapGestureRecognizer失败，singleTapGestureRecognizer才有效
        [singleTapGestureRecognizer requireGestureRecognizerToFail:doubleTapGestureRecognizer];
  
        
    }
    return self;
}
- (void)singleTap:(UIGestureRecognizer*)gestureRecognizer
{
    
//    NSLog(@"-----singleTap-----");
//    [self setBackgroundColor:[UIColor redColor]];
}

- (void)doubleTap:(UIGestureRecognizer*)gestureRecognizer
{
   
    if (_scrollView.zoomScale == 1.0) {
         [_scrollView setZoomScale:2.0 animated:YES];
    }else{
       [_scrollView setZoomScale:1.0 animated:YES];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
