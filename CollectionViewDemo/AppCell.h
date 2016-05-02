//
//  AppCell.h
//  CollectionViewDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientView.h"

@interface AppCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet GradientView *gradientView;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (assign,nonatomic) BOOL editing;
@property (assign,nonatomic) BOOL moving;
@property (readonly,nonatomic) UIView *snapshot;
@property (weak, nonatomic) IBOutlet UIImageView *checkImageView;


@end
