//
//  CollectViewVC.m
//  RACNet
//
//  Created by charles on 16/7/20.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "CollectViewVC.h"
#import "ProductCVCell.h"

@interface CollectViewVC ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *productCV;

@end

@implementation CollectViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.productCV.dataSource=self;
    self.productCV.delegate=self;
    [self.productCV registerNib:[UINib nibWithNibName:@"ProductCVCell" bundle:nil] forCellWithReuseIdentifier:productCVCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:productCVCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [UIScreen mainScreen].bounds.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
