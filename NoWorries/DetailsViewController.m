//
//  DetailsViewController.m
//  NoWorries
//
//  Created by user on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsCell.h"
#import "ExpediaClient.h"
//#import "TripsEzModel.h"

@interface DetailsViewController ()

@property (nonatomic, strong) NSDictionary *hotelsResponse;
@property (nonatomic, strong) NSMutableArray *hotelsResponseArray;
@property (nonatomic, strong) NSMutableArray *hotelNames;

@end

@implementation DetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title=@"Search Results from Expedia";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // create nib with cell nib. Use same name as xib
    UINib *detailsCellNib = [UINib nibWithNibName:@"DetailsCell" bundle:nil];
    // register this newly created nib with the table view.
    // Use same identifier as mentioned in interface builder
    [self.tableView registerNib:detailsCellNib forCellReuseIdentifier:@"DetailsCell"];
    
    [[ExpediaClient sharedExpediaClient] getHotelsByLatitude:@"37.7"
                                                  byLongitude:@"122.2" withSuccess:^(AFHTTPRequestOperation *operation, id response)
     {
         NSLog(@"Success!!!");
         self.hotelsResponse = [response objectForKey:@"HotelListResponse"];
          //NSLog(@"Hotel Response %@", self.hotelsResponse);
          //NSLog(@"%@", [[self.hotelsResponse valueForKey:@"HotelList"] valueForKey:@"HotelSummary"]);
         self.hotelsResponseArray = [[self.hotelsResponse valueForKey:@"HotelList"] valueForKey:@"HotelSummary"];
         //NSLog(@"%@", self.hotelsResponseArray);
              }
     failure:^(AFHTTPRequestOperation *operation, NSError *error)
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
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSLog(@"Count:%@", self.hotelsResponseArray);
    static NSString *CellIdentifier = @"DetailsCell";
    DetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    int i=0;
    for (NSDictionary *item in self.hotelsResponseArray)
    {
        NSLog(@"Count:%d", i);
        NSLog(@"%@", [item valueForKey:@"name"]);
        NSLog(@"%@", [item valueForKey:@"address1"]);
        //NSLog(@"%@", [item valueForKey:@"address2"]);
        NSLog(@"%@", [item valueForKey:@"city"]);
        NSLog(@"%@", [item valueForKey:@"postalCode"]);
        NSLog(@"%@", [item valueForKey:@"highRate"]);
        NSLog(@"%@", [item valueForKey:@"proximityDistance"]);
        NSLog(@"%@", [item valueForKey:@"thumbNailUrl"]);
        NSLog(@"%@", [item valueForKey:@"hotelRating"]);
        i=i+1;
    }

    if(indexPath.row==0)
    {
        cell.hotelNameLabel.text = @"Parc 55 Wyndham";
        cell.address1Label.text = @"P55 Cyril Magnin St";
        cell.price.text = @"$229.00";
        //cell.hotelImage.image = "";
        cell.ratingLabel.text = @"4.0";
        cell.zipLabel.text = @"94102";
    }
    else if(indexPath.row==1)
    {
        cell.hotelNameLabel.text = @"Castle Inn";
        cell.address1Label.text = @"1565 Broadway";
        cell.ratingLabel.text = @"4.0";
        //cell.hotelImage.image = "";
        cell.price.text = @"$168.99";
        cell.zipLabel.text = @"94109";
    }
    else if(indexPath.row==2)
    {
        cell.hotelNameLabel.text = @"Executive Hotel Vintage Court";
        cell.address1Label.text = @"650 Bush Street";
        cell.price.text = @"$229.00";
        cell.ratingLabel.text = @"3.5";
        //cell.hotelImage.image = "";
        cell.zipLabel.text = @"94108";
    }
    else if(indexPath.row==3)
    {
        cell.hotelNameLabel.text = @"San Remo Hotel";
        cell.address1Label.text = @"2237 Mason Street";
        cell.price.text = @"$129.00";
        cell.ratingLabel.text = @"4.0";
        //cell.hotelImage.image = "";
        cell.zipLabel.text = @"94133";
    }
    else if(indexPath.row==4)
    {
        cell.hotelNameLabel.text = @"Hilton San Francisco Downtown";
        cell.address1Label.text = @"750 Kearny St";
        cell.price.text = @"$389.00";
        cell.ratingLabel.text = @"4.0";
        //cell.hotelImage.image = "";
        cell.zipLabel.text = @"94108";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


@end
