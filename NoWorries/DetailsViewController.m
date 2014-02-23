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
    
    [[ExpediaClient sharedExpediaClient] listHotelsForCity:@"San Francisco"
                                                  forState:@"CA"
                                                forCountry:@"US"
                                               withSuccess:^(AFHTTPRequestOperation *operation, id response)
     {
         NSLog(@"Success!!!");
         self.hotelsResponse = [response objectForKey:@"HotelListResponse"];
         //NSLog(@"Hotel Response %@", self.hotelsResponse);
         //NSLog(@"%@", [[self.hotelsResponse valueForKey:@"HotelList"] valueForKey:@"HotelSummary"]);
         self.hotelsResponseArray = [[self.hotelsResponse valueForKey:@"HotelList"] valueForKey:@"HotelSummary"];
         for (NSDictionary *item in self.hotelsResponseArray)
         {
             NSLog(@"%@", [item valueForKey:@"address1"]);
         }
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
    static NSString *CellIdentifier = @"DetailsCell";
    DetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.hotelNameLabel.text = @"Parc 55 Wyndham";
    cell.address1Label.text = @"P55 Cyril Magnin St";
    cell.ratingLabel.text = @"4";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
