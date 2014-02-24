//
//  ExpediaClient.h
//  NoWorries
//
//  Created by Sairam Sankaran on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "AFHTTPClient.h"

@interface ExpediaClient : AFHTTPClient

+ (ExpediaClient *)sharedExpediaClient;

- (void) listHotelsForCity:(NSString *) city
                  forState:(NSString *) state
                forCountry:(NSString *) country
               withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void) getHotelsByLatitude:(NSString *) latitude
                byLongitude:(NSString *) longitude
               withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
