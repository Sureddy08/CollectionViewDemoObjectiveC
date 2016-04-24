//
//  App.m
//  CALayerDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "App.h"
@interface App()

@end

@implementation App
-(id)initWithName:(NSString *)name companyName:(NSString *)companyName image:(UIImage *)image index:(int)index{
    if ((self = [super init])) {
        _name = name;
        _companyName = companyName;
        _image = image;
        _index = index;
    }
    return self;
}

+(NSArray *)favApps{
    App *calender = [[App alloc] initWithName:@"Calendar" companyName:@"Apple" image:[UIImage imageNamed:@"Calendar"] index:0];
    App *contacts = [[App alloc] initWithName:@"Contacts" companyName:@"Apple" image:[UIImage imageNamed:@"Contacts"] index:1];
    App *health = [[App alloc] initWithName:@"Health" companyName:@"Apple" image:[UIImage imageNamed:@"Health"] index:2];
    App *gameCenter = [[App alloc] initWithName:@"Game Center" companyName:@"Apple" image:[UIImage imageNamed:@"GameCenter"] index:3];
    App *iBook = [[App alloc] initWithName:@"iBook" companyName:@"Apple" image:[UIImage imageNamed:@"iBook"] index:4];
    App *spotlight = [[App alloc] initWithName:@"Spotlight" companyName:@"Apple" image:[UIImage imageNamed:@"Spotlight"] index:5];
    App *tips = [[App alloc] initWithName:@"Tips" companyName:@"Apple" image:[UIImage imageNamed:@"Tips"] index:6];
    return @[calender,contacts,health,gameCenter,iBook,spotlight,tips];
}



@end
