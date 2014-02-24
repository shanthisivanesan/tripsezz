//
//  TripsEzModel.h
//  NoWorries
//
//  Created by user on 2/23/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TripsEzModel : NSObject

@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *srcZip;
@property (strong, nonatomic) NSString *destZip;

+ (TripsEzModel *)instance;
- (void) setLatitude: (NSString*)string;
- (void) setLongitude: (NSString*)string;
- (void) setSrcZip: (NSString*)string;
- (void) setDestZip: (NSString*)string;
@end
