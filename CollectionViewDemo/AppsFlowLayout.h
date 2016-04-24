//
//  AppsFlowLayout.h
//  CollectionViewDemo
//
//  Created by VKS on 4/23/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppsFlowLayout : UICollectionViewFlowLayout
@property (strong) NSIndexPath *appearingItemIndexPath;
@property (strong) NSMutableArray *disappearingItemIndexpaths;
@end
