//
//  CYPhotosItemViewController.h
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "CYConst.h"
@interface CYPhotosItemViewController : UIViewController
@property (nonatomic, strong) PHAssetCollection *assetCollection;
@end
