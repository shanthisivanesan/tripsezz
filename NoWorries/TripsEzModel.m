//
//  TripsEzModel.m
//  NoWorries
//
//  Created by user on 2/23/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "TripsEzModel.h"

@implementation TripsEzModel

+ (TripsEzModel *)instance {
    static dispatch_once_t once;
    static TripsEzModel *instance;
    
    dispatch_once(&once, ^{
        instance = [[TripsEzModel alloc] init];
    });
    
    return instance;
}

- (void) setLongitude: (NSString*)string {
    self.latitude = string;
}

- (void) setLatitude: (NSString*)string
{
    self.longitude = string;
}

- (void) setSrcZip: (NSString*)string {
    self.srcZip = string;
}

- (void) setDestZip: (NSString*)string
{
    self.destZip = string;
}

@end
