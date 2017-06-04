//
//  CYPhotosViewController.m
//  CYPhotosDemo
//
//  Created by SX on 2017/6/1.
//  Copyright © 2017年 YULING. All rights reserved.
//

#import "CYPhotosViewController.h"
#import <Photos/Photos.h>
#import "CYPhotosItemViewController.h"
@interface CYPhotosViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) PHFetchResult *smartAlbums;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CYPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"照片";
    _smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(rightBarButtonItemClick:)];
    // Do any additional setup after loading the view.
}
//取消
- (void)rightBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

#pragma mark --UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _smartAlbums.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    PHAssetCollection *collect =  _smartAlbums[indexPath.row];
   
    
    cell.textLabel.text = [collect.localizedTitle stringByAppendingFormat:@"(%@)",@(collect.estimatedAssetCount)];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CYPhotosItemViewController *items = [[CYPhotosItemViewController alloc] init];
    items.assetCollection = _smartAlbums[indexPath.row];
    [self.navigationController pushViewController:items animated:YES];
    
    
    
    
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
