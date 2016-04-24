//
//  AppsFlowLayout.m
//  CollectionViewDemo
//
//  Created by VKS on 4/23/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "AppsFlowLayout.h"

@implementation AppsFlowLayout

-(UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    NSIndexPath *indexPath = self.appearingItemIndexPath;
    if(attributes != nil){
        if(indexPath == itemIndexPath){
            attributes.alpha = 1.0;
            attributes.center = CGPointMake(CGRectGetWidth(self.collectionView.frame) - 23.5, -24.5);
            attributes.transform = CGAffineTransformMakeScale(0.15, 0.15);
            attributes.zIndex = 99;
        }
    }
    return attributes;
}

-(UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    NSMutableArray *indexPaths = self.disappearingItemIndexpaths;
    if(attributes != nil){
        if([indexPaths containsObject:itemIndexPath]){
            attributes.alpha = 1.0;
            attributes.transform = CGAffineTransformMakeScale(0.1, 0.1);
            attributes.zIndex = -1;
        }
    }
    return attributes;
}
@end
