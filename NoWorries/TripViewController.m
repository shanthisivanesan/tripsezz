//
//  TripViewController.m
//  NoWorries
//
//  Created by user on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "TripViewController.h"
#import "CarViewController.h"
#import "SettingsViewController.h"
#import "DetailsViewController.h"
#import "SearchViewController.h"
#import "ExpediaClient.h"
#import "TripsEzModel.h"


@interface TripViewController ()
- (void)updatevalues;
@end

@implementation TripViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"TripsEzz";    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Check Car" style:UIBarButtonItemStylePlain target:self action:@selector(onCarDiagnoseButton)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onbtnSearch)];
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onbtnCurrLoc)];
    self.srcZipTextField.text = @"94102";
    self.destZipTextField.text = @"94133";
    [self.btnSearch addGestureRecognizer:tapGesture];
    [self.btnCurrLoc addGestureRecognizer:tapGesture1];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma  mark - private methods

-(void)onbtnSearch
{
    NSLog(@"Search button clicked");
   // [[TripsEzModel instance] setSrcZip:self.srcZipTextField.text];
   // [[TripsEzModel instance] setDestZip:self.srcZipTextField.text];
    DetailsViewController *searchVC = [[DetailsViewController alloc] init];
    [[self navigationController] pushViewController:searchVC
                                           animated:YES];
}

-(void)onbtnCurrLoc
{
    NSLog(@"Current Location button clicked");
    DetailsViewController *detailsVC = [[DetailsViewController alloc] init];
    [[self navigationController] pushViewController:detailsVC
                                           animated:YES];
}
- (void)onCarDiagnoseButton
{
    NSLog(@"Car Report  Tapped");
    CarViewController *carVC = [[CarViewController alloc] init];
    //[carVC carReportLabel:self.cardiagnoseAlertLabel.text];
    [[self navigationController] pushViewController:carVC
                                           animated:YES];
}

- (void)onSettingsButton
{
    NSLog(@"Settings Button Tapped");
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    [[self navigationController] pushViewController:settingsVC
                                           animated:YES];
}

-(void) updatevalues {
    NSString *srcZip = self.srcZipTextField.text;
    NSString *destZip = self.destZipTextField.text;
    int carOption = self.carSegementField.selectedSegmentIndex;
    if(carOption==0){
        //if own, do the car diagnose
        
    }
    else
    {
        //rental, then look for option 
    }
    
    int daysStay = [self.daysStayTextField.text intValue];
    
    self.cardiagnoseAlertLabel.text = @"Car has Issues. Do you want to rent a car through Expedia?";
}


@end
