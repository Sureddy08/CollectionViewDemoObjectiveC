//
//  MainViewController.m
//  CollectionViewDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "MainViewController.h"
#import "App.h"
#import "AppCell.h"
#import "AppsDataSource.h"
#import "AppsFlowLayout.h"

@interface MainViewController()
@property (strong) AppsDataSource *appsDataSource;
@end

@implementation MainViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.appsDataSource = [[AppsDataSource alloc] init];
    self.navigationController.toolbarHidden = true;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];

    self.collectionView.allowsMultipleSelection = editing;
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
    for(NSIndexPath *indexpath in indexPaths){
        [self.collectionView deselectItemAtIndexPath:indexpath animated:false];
        AppCell *cell = (AppCell *)[self.collectionView cellForItemAtIndexPath:indexpath];
        cell.editing = editing;
    }
    
    if (!editing){
        [self.navigationController setToolbarHidden:true animated:animated];
    }
}
- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    NSIndexPath *indexPath = [self.appsDataSource indexPathForNewRandomApp];
    AppsFlowLayout *layout = (AppsFlowLayout *)self.collectionViewLayout;
    layout.appearingItemIndexPath = indexPath;
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.65 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObjects:(id)indexPath,nil]];
    }
    completion:^(BOOL finished) {
        layout.appearingItemIndexPath = nil;
    }];
    
}
- (IBAction)deleteButtonTapped:(UIBarButtonItem *)sender {
    NSMutableArray *indexPaths = [[self.collectionView indexPathsForSelectedItems] mutableCopy];
    AppsFlowLayout *layout = (AppsFlowLayout *)self.collectionViewLayout;
    layout.disappearingItemIndexpaths = indexPaths;
    [self.appsDataSource deleteItemsAtIndexPaths:indexPaths];
    [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.collectionView deleteItemsAtIndexPaths:indexPaths];
    }completion:^(BOOL finished) {
        layout.disappearingItemIndexpaths = nil;
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.appsDataSource.favApps.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AppCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"AppCell" forIndexPath:indexPath];
    App *app = self.appsDataSource.favApps[indexPath.row];
    cell.imageView.image = app.image;
    cell.companyNameLabel.text = app.name;
    cell.editing = self.editing;
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.editing){
        [self.navigationController setToolbarHidden:false animated:true];
    }
    else{
        [self collectionView:collectionView didDeselectItemAtIndexPath:indexPath];
    }
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.editing){
        if(collectionView.indexPathsForSelectedItems.count == 0){
            [self.navigationController setToolbarHidden:true animated:true];
        }
    }

}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = CGRectGetWidth(self.collectionView.frame)/3;
    CGSize cellSize = CGSizeMake(width, width);
    return cellSize;
}


@end
