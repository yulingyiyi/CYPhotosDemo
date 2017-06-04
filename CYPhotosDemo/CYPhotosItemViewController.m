//
//  CYPhotosItemViewController.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "CYPhotosItemViewController.h"
#import "CYPhotosItemCollectionViewCell.h"
#import "CYPhotosBar.h"
#import "CYCollectionViewFlowLayout.h"
#import "CYSourceCollect.h"
#import "CYPhotosPreViewController.h"
@interface CYPhotosItemViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)    PHFetchResult<PHAsset *> *fetchResult;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CYPhotosBar *photosBar;
@property (nonatomic, strong) CYSourceCollect *collect;

@end

@implementation CYPhotosItemViewController
- (void)dealloc{

    [_collect removeObserver:self forKeyPath:@"countKey"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.photosBar];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = _assetCollection.localizedTitle;
    
    _collect = [CYSourceCollect new];
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate"ascending:YES]];
    
    _fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
    
    [_fetchResult enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
    [self.collectionView reloadData];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(rightBarButtonItemClick:)];
    [_collect addObserver:self forKeyPath:@"countKey" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:@"countKey"]) {
        [self.photosBar updateBottomBar:[change[@"new"] integerValue]];

    }
}



- (CYPhotosBar *)photosBar{

    if (!_photosBar) {
        _photosBar = [[CYPhotosBar alloc] initWithFrame:CGRectMake(0, Khieght - 50, Kwidth, 50)];
        [_photosBar.preBtn addTarget:self action:@selector(preBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _photosBar;
}
//预览
- (void)preBtnClick:(UIButton *)sender{
   
    CYPhotosPreViewController *pre = [[CYPhotosPreViewController alloc] init];
    pre.dataSource = _collect.set;
    [self.navigationController pushViewController:pre animated:YES];
    
}
//取消
- (void)rightBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (UICollectionView *)collectionView{

    if (!_collectionView) {
    
        CYCollectionViewFlowLayout *layout = [CYCollectionViewFlowLayout new];
        layout.maximumInteritemSpacing = 2.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(2, 66, Kwidth - 4, Khieght - 118) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[CYPhotosItemCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _fetchResult.count;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 1.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{

    return 1.0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(Kwidth / 4 - 2, Kwidth / 4 - 2);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CYPhotosItemCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    PHAsset *asset = _fetchResult[indexPath.row];
   
    
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(Kwidth / 4 - 2, Kwidth / 4 - 2) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.imageView.image = result;
    }];
    cell.selected = [_collect.set containsObject:asset];
    cell.blok = ^BOOL(UIImage *image, BOOL selected) {
        if (!selected) {
            ![_collect.set containsObject:asset]? [_collect addObject:asset] : nil ;
        }else{
           [_collect.set containsObject:asset]? [_collect removeObject:asset] : nil ;
        }
        return !selected;
    };
    return cell;
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
