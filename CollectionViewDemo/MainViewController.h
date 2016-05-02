//
//  MainViewController.h
//  CollectionViewDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>

-(void)handleLongPress:(UILongPressGestureRecognizer *)recognizer;

@end
