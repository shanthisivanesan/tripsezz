//
//  SearchViewController.m
//  NoWorries
//
//  Created by user on 2/23/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SearchViewController.h"
#import "DetailsCell.h"
#import "ExpediaClient.h"
#import "Business.h"

@interface SearchViewController ()
@property (nonatomic, strong) NSDictionary *hotelsResponse;
@property (nonatomic, strong) NSArray *hotelsResponseArray;
@property (nonatomic, strong) NSArray *hotelNames;
@end

@implementation SearchViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshData];
}

- (void)refreshData
{
    // create nib with cell nib. Use same name as xib
    UINib *detailsCellNib = [UINib nibWithNibName:@"DetailsCell" bundle:nil];
    // register this newly created nib with the table view.
    // Use same identifier as mentioned in interface builder
    [self.tableView registerNib:detailsCellNib forCellReuseIdentifier:@"DetailsCell"];
    
    [[ExpediaClient sharedExpediaClient] listHotelsForCity:@"San Francisco"
                                                  forState:@"CA"
                                                forCountry:@"US"
                                               withSuccess:^(AFHTTPRequestOperation *operation, id response)
     {
         NSLog(@"Success!!!");
         self.hotelsResponse = [response objectForKey:@"HotelListResponse"];
         // NSLog(@"Hotel Response %@", self.hotelsResponse);
         // NSLog(@"%@", [[self.hotelsResponse valueForKey:@"HotelList"] valueForKey:@"HotelSummary"]);
         id businesses = [[self.hotelsResponse objectForKey:@"HotelList"]
                            objectForKey:@"HotelSummary"];
         if([businesses isKindOfClass:[NSArray class]]) {
             self.hotelsResponseArray = [Business businessesWithArray:businesses];
             [self.tableView reloadData];
        }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Failure!!!");
     }
     ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.hotelsResponseArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetailsCell";
    DetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Business *b = [self.hotelsResponseArray objectAtIndex:indexPath.row];
    
    cell.hotelNameLabel.text =b.name;
    cell.address1Label.text = b.address;
    cell.ratingLabel.text = b.tripAdvisorRating;
    cell.zipLabel.text = b.zipcode;
    return cell;
    
}

  /*if(indexPath.row==0)
    {
        cell.hotelNameLabel.text = @"Parc 55 Wyndham";
        cell.address1Label.text = @"P55 Cyril Magnin St";
        cell.ratingLabel.text = @"$229.00";
        cell.zipLabel.text = @"Rating:4";
    }
    else if(indexPath.row==1)
    {
        cell.hotelNameLabel.text = @"Castle Inn";
        cell.address1Label.text = @"1565 Broadway";
        cell.ratingLabel.text = @"$168.99";
        cell.zipLabel.text = @"Rating:4";
    }
    else if(indexPath.row==2)
    {
        cell.hotelNameLabel.text = @"Executive Hotel Vintage Court";
        cell.address1Label.text = @"650 Bush Street";
        cell.ratingLabel.text = @"$229.00";
        cell.zipLabel.text = @"Rating:3.5";
    }
    else if(indexPath.row==3)
    {
        cell.hotelNameLabel.text = @"San Remo Hotel";
        cell.address1Label.text = @"2237 Mason Street";
        cell.ratingLabel.text = @"$129.00";
        cell.zipLabel.text = @"Rating:4";
    }
    else if(indexPath.row==4)
    {
        cell.hotelNameLabel.text = @"Hilton San Francisco Downtown";
        cell.address1Label.text = @"750 Kearny St";
        cell.ratingLabel.text = @"$389.00";
        cell.zipLabel.text = @"Rating:4";
    }*/


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
@end
