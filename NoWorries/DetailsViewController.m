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
#import "Business.h"
#import "HotelDetailsViewController.h"

@interface DetailsViewController ()

@property (nonatomic, strong) NSDictionary *hotelsResponse;
@property (nonatomic, strong) NSArray *hotelsResponseArray;
@property (nonatomic, strong) NSArray *hotelNames;

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
    [self refreshData];
}

- (void)refreshData
{
    // create nib with cell nib. Use same name as xib
    UINib *detailsCellNib = [UINib nibWithNibName:@"DetailsCell" bundle:nil];
    // register this newly created nib with the table view.
    // Use same identifier as mentioned in interface builder
    [self.tableView registerNib:detailsCellNib forCellReuseIdentifier:@"DetailsCell"];
    //NSLog(@"viewDidLoad!!!");
    [[ExpediaClient sharedExpediaClient] getHotelsByLatitude:@"37.7"
                                                 byLongitude:@"122.2" withSuccess:^(AFHTTPRequestOperation *operation, id response)
     {
         NSLog(@"Success!!!");
         self.hotelsResponse = [response objectForKey:@"HotelListResponse"];
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
    // NSLog(@"Count:%@", self.hotelsResponse);
    static NSString *CellIdentifier = @"DetailsCell";
    DetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    Business *b = [self.hotelsResponseArray objectAtIndex:indexPath.row];
    
    cell.hotelNameLabel.text =b.name;
    cell.address1Label.text = b.address;
    
    //cell.ratingLabel.text = b.tripAdvisorRating;
    cell.price.text =[NSString stringWithFormat:@"%@",b.hrate];
    
    cell.ratingLabel.text = [NSString stringWithFormat:@"%@",b.tripAdvisorRating];
    
    //cell.zipLabel.text = b.zipcode;
    //rating
    NSLog(@"%@",b.thumbNailUrl);
    NSURL *url = [NSURL URLWithString:b.thumbNailUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.hotelImage.image = [UIImage imageWithData:data];
    cell.btnConfirm.tag = indexPath.row;
    [cell.btnConfirm addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
 
}
- (void) onButtonClicked:(id)sender {
    NSLog(@"Settings Button Tapped");
    
    HotelDetailsViewController *hoteldetailsVC=[[HotelDetailsViewController alloc]initWithNibName:@"HotelDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:hoteldetailsVC animated:YES];
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


@end
