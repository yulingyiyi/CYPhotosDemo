//
//  ViewController.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "ViewController.h"
#import "TZImagePickerController.h"
#import "CYPhotoNavigationViewController.h"
@interface ViewController ()<TZImagePickerControllerDelegate>

@end

@implementation ViewController
- (IBAction)btnClick:(UIButton *)sender {
    
//    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:nil];
//    
//    // You can get the photos by block, the same as by delegate.
//    // 你可以通过block或者代理，来得到用户选择的照片.
//    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOriginalPhoto) {
//        
//    }];
//    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
    CYPhotoNavigationViewController *nav = [CYPhotoNavigationViewController showPhotos];
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
