//
//  AppsDataSource.h
//  CollectionViewDemo
//
//  Created by VKS on 4/23/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppsDataSource : NSObject
@property (strong) NSMutableArray *favApps;
-(NSIndexPath *)indexPathForNewRandomApp;
-(void)deleteItemsAtIndexPaths:(NSArray *)indexPaths;
@end
