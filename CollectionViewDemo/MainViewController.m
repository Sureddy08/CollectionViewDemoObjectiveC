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
    return cell;

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
