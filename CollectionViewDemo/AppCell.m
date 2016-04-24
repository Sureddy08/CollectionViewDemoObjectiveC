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

-(void)setEditing:(BOOL)editing{
    self->_editing = editing;
    _companyNameLabel.hidden = editing;
    _checkImageView.hidden = !editing;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (self.editing){
        _checkImageView.image = [UIImage imageNamed:selected ? @"Checked" : @"Unchecked"];
    }
}



@end
