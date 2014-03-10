//
//  Business.h
//  Parking
//
//  Created by Shanthi on 3/8/14.
//  Copyright (c) 2014 Shanthi Sivanesan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Business : NSObject

- (id)initWithDictionary:(NSDictionary *)data;

@property (strong, nonatomic, readonly) NSString *id;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *thumbNailUrl;
@property (strong, nonatomic, readonly) NSString *address;
@property (strong, nonatomic, readonly) NSString *city;
@property (strong, nonatomic, readonly) NSString *state;
@property (strong, nonatomic, readonly) NSString *zipcode;
@property (strong, nonatomic, readonly) NSString *proximityDistance;
@property (strong, nonatomic, readonly) NSString *hrate;
@property (strong, nonatomic, readonly) NSString *lrate;
@property (strong, nonatomic, readonly) NSString *tripAdvisorRating; 

+ (NSArray *)businessesWithArray:(NSArray *)array;

@end
