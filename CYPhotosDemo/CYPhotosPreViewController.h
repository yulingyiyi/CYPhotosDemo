//
//  CYPhotosPreViewController.h
//  CYPhotosDemo
//
//  Created by SX on 2017/6/3.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface CYPhotosPreViewController : UIViewController

@property (nonatomic, strong) NSMutableArray<PHAsset *> *dataSource;

@end
