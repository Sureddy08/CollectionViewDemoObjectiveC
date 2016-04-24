//
//  AppsDataSource.m
//  CollectionViewDemo
//
//  Created by VKS on 4/23/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "AppsDataSource.h"
#import "App.h"

@implementation AppsDataSource

-(instancetype)init{
    if ((self = [super init])) {
        if(_favApps == nil){
            _favApps = [[App favApps] mutableCopy];
        }
    }
    
    return self;
}

-(NSIndexPath *)indexPathForNewRandomApp{
    
    int index = arc4random_uniform((int)[App favApps].count);
    App *appToCopy = [App favApps][index];
    App *newApp = [[App alloc] initWithName:appToCopy.name companyName:appToCopy.companyName image:appToCopy.image index:appToCopy.index];
    [self.favApps addObject:newApp];
    NSSortDescriptor *aSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"index" ascending:YES];
    [self.favApps sortUsingDescriptors:[NSArray arrayWithObject:aSortDescriptor]];
    __block int item = 0;
    [self.favApps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(obj == newApp){
            item = (int)idx;
        }
    }];
    return [NSIndexPath indexPathForItem:item inSection:0];
}

@end
