//
//  Business.m
//  Parking
//
//  Created by Shanthi on 3/8/14.
//  Copyright (c) 2014 Shanthi Sivanesan. All rights reserved.
//

#import "Business.h"

@implementation Business
@synthesize name, address, city,state,zipcode,hrate, lrate,tripAdvisorRating,proximityDistance,thumbNailUrl;
- (id)initWithDictionary:(NSDictionary *)data
{
    self = [self init];
    if (self) {
        name = [data objectForKey:@"name"];
        address = [data objectForKey:@"address1"];
        city = [data objectForKey:@"city"];
        state =[data objectForKey:@"stateProvinceCode"];
        zipcode= [data objectForKey:@"postalCode"];
        if ([data objectForKey:@"highRate"] == (NSString *)[NSNull null])
        {
            hrate=@"";
        }
        else
            hrate= [data objectForKey:@"highRate"];
        if ([data objectForKey:@"lowRate"] == (NSString *)[NSNull null])
        {
            lrate=@"";
        }
        else
            lrate= [data objectForKey:@"lowRate"];
        proximityDistance= [data objectForKey:@"proximityDistance"];
        NSString *img = @"http://images.travelnow.com";
        thumbNailUrl= @"%@%@",img, [data objectForKey:@"thumbNailUrl"];
        
        tripAdvisorRating=[data objectForKey:@"tripAdvisorRating"];
    }
    return self;
}

+ (NSArray *)businessesWithArray:(NSArray *)array
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dict in array) {
        Business *business = [[Business alloc] initWithDictionary:dict];
        [result addObject:business];
    }
    //NSLog(@"%@",result);
    return result;
}
@end
