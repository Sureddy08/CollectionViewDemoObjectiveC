//
//  App.h
//  CALayerDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface App : NSObject
@property(strong) NSString *name;
@property(strong) NSString *companyName;
@property(strong) UIImage *image;
@property(assign) int index;

- (id)initWithName:(NSString *)name companyName:(NSString *)companyName image:(UIImage *)image index:(int)index;
+(NSArray *)favApps;

@end
