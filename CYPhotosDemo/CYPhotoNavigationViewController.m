//
//  CYPhotoNavigationViewController.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "CYPhotoNavigationViewController.h"
#import "CYPhotosViewController.h"
@interface CYPhotoNavigationViewController ()

@end


@implementation CYPhotoNavigationViewController
+(instancetype)showPhotos{
    CYPhotosViewController *root = [[CYPhotosViewController alloc] init];
    CYPhotoNavigationViewController *nav = [[CYPhotoNavigationViewController alloc] initWithRootViewController:root];
    return nav;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setShadowImage:[UIImage new]];
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.alpha = 0.85;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
