//
//  CYPhotosBar.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "CYPhotosBar.h"

@implementation CYPhotosBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _editBtn.frame = CGRectMake(0, 0, 60, frame.size.height);
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
         [_editBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_editBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        _editBtn.enabled = NO;
        
        [self addSubview:_editBtn];
       
        _preBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _preBtn.frame = CGRectMake(60, 0, 60, frame.size.height);
        [_preBtn setTitle:@"预览" forState:UIControlStateNormal];
        [_preBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_preBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        _preBtn.enabled = NO;
        [self addSubview:_preBtn];
        
        _finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishBtn.frame = CGRectMake(frame.size.width -60, 0, 60, frame.size.height);
        [_finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor colorWithRed:1 green:.5 blue:0 alpha:0.5] forState:UIControlStateDisabled];
        _finishBtn.enabled = NO;
        [self addSubview:_finishBtn];
        
        _numL = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 70, 15, 20, 20)];
        _numL.backgroundColor = [UIColor orangeColor];
        _numL.textColor = [UIColor whiteColor];
        _numL.layer.masksToBounds = YES;
        _numL.textAlignment = NSTextAlignmentCenter;
        _numL.layer.cornerRadius = 10;
        _numL.font = [UIFont systemFontOfSize:12.0];
        _numL.hidden = YES;
        [self addSubview:_numL];
    }
    return self;
}
- (void)updateBottomBar:(NSUInteger)count{
    
    if (count == 0) {
        _editBtn.enabled = NO;
        _preBtn.enabled = NO;
        _finishBtn.enabled = NO;
        _numL.hidden = YES;
        _numL.frame = CGRectMake(self.frame.size.width - 70, 15, 20, 20);
    }else if(count == 1){
        _editBtn.enabled = YES;
        _preBtn.enabled = YES;
        _finishBtn.enabled = YES;
        _numL.hidden = NO;
        _numL.text = @"1";
        _numL.frame = CGRectMake(self.frame.size.width - 70, 15, 20, 20);
    }else{
        _editBtn.enabled = NO;
        _preBtn.enabled = YES;
        _finishBtn.enabled = YES;
        _numL.hidden = NO;
        NSString *countS = [NSString stringWithFormat:@"%@", @(count)];
        CGFloat width = [self widthByString:countS].width;
        if (width > 20) {
            _numL.frame = CGRectMake(self.frame.size.width -50 - width, 15, width, 20);
        }
    
        _numL.text = countS;
        
        
    }
}

- (CGSize)widthByString:(NSString *)str{

    CGSize labelSize;
    @autoreleasepool {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textAlignment = NSTextAlignmentLeft;
        label.text = str;
        label.font = [UIFont systemFontOfSize:12.0];
        labelSize = [label sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    }
   
    
    return labelSize;
    
    
}


@end
