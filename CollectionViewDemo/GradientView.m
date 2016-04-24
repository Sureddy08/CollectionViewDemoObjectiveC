//
//  GradientView.m
//  CollectionViewDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "GradientView.h"

@interface GradientView()
@property (strong) CAGradientLayer *gradientLayer;
-(void)setup;
@end

@implementation GradientView

-(void)setup{
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.colors = [NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,[UIColor colorWithWhite:0.0 alpha:0.75], nil];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
    self.backgroundColor = [UIColor clearColor];
    [[self layer] addSublayer:_gradientLayer];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _gradientLayer.frame = [self bounds];
}
@end
