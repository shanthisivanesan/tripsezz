//
//  ExpediaClient.m
//  NoWorries
//
//  Created by Sairam Sankaran on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ExpediaClient.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "APIKeys.h"
#import "AFJSONRequestOperation.h"

#define EXPEDIA_HOTELS_BASE_URL [NSURL URLWithString:@"http://api.ean.com/ean-services/rs/hotel/v3/"]

@implementation ExpediaClient

+ (ExpediaClient *)sharedExpediaClient
{
    static dispatch_once_t once;
    static ExpediaClient *sharedExpediaClient;
    dispatch_once(&once, ^{
        sharedExpediaClient = [[ExpediaClient alloc] init];
    });
    return sharedExpediaClient;
}

- (id)init
{
    self = [super initWithBaseURL:EXPEDIA_HOTELS_BASE_URL];
    
    if (self)
    {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}


- (void) getHotelsByLatitude:(NSString *) latitude
                       byLongitude:(NSString *) longitude
                  withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *params =
    [NSMutableDictionary dictionaryWithDictionary:@{
                                                    @"cid":[APIKeys expediaAPICID],
                                                    @"apiKey":[APIKeys expediaAPIKey],
                                                    @"minorRev":@"4",
                                                    @"customerUserAgent":@"MOBILE_APP",
                                                    @"customerIpAddress":@"127.0.0.1",
                                                    @"locale":@"en_US",
                                                    @"currencyCode":@"USD",
                                                    @"latitude":latitude,
                                                    @"longitude":longitude,
                                                    @"_type":@"json"
                                                    }
     ];
    [self getPath:@"list"
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id response) {
              NSLog(@"%s","getHotelsForLatitude");
              NSLog(@"%@",params);
              NSLog(@"%@",response);
          }
          failure:failure
     ];
}

- (void) listHotelsForCity:(NSString *) city
                  forState:(NSString *) state
                forCountry:(NSString *) country
               withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *params =
    [NSMutableDictionary dictionaryWithDictionary:@{
                                                    @"cid":[APIKeys expediaAPICID],
                                                    @"apiKey":[APIKeys expediaAPIKey],
                                                    @"minorRev":@"4",
                                                    @"customerUserAgent":@"MOBILE_APP",
                                                    @"customerIpAddress":@"127.0.0.1",
                                                    @"locale":@"en_US",
                                                    @"currencyCode":@"USD",
                                                    @"city":city,
                                                    @"stateProvinceCode":state,
                                                    @"countryCode":country,
                                                    @"_type":@"json"
                                                    }
     ];
    [self getPath:@"list"
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id response) {
              //NSLog(@"%@",response);
              //              NSDictionary *responseDictionary = [response objectForKey:@"response"];
              //              NSArray *hotelsArray = [responseDictionary objectForKey:@"venues"];
              success(operation, response);
          }
          failure:failure
     ];
}

@end
