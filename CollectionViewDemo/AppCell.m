//
//  AppCell.m
//  CollectionViewDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "AppCell.h"

@implementation AppCell

-(void)awakeFromNib{
    [super awakeFromNib];
    _checkImageView.layer.cornerRadius = 10.0;
}

-(UIView *)snapshot{
    UIView *snapshot = [self snapshotViewAfterScreenUpdates:true];
    CALayer *layer = snapshot.layer;
    layer.masksToBounds = false;
    layer.shadowOffset = CGSizeMake(0.0, 0.0);
    layer.shadowRadius = 5.0;
    layer.shadowOpacity = 0.4;
    return snapshot;
}

-(void)setEditing:(BOOL)editing{
    self->_editing = editing;
   // _companyNameLabel.hidden = editing;
    _checkImageView.hidden = !editing;
}

-(void)setMoving:(BOOL)moving{
    self->_moving = moving;
    CGFloat alpha = moving ? 0.0 : 1.0;
    _imageView.alpha = alpha;
    _gradientView.alpha = alpha;
    _companyNameLabel.alpha = alpha;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (self.editing){
        _checkImageView.image = [UIImage imageNamed:selected ? @"Checked" : @"Unchecked"];
    }
}



@end
