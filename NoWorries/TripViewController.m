//
//  TripViewController.m
//  NoWorries
//
//  Created by user on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "TripViewController.h"

@interface TripViewController ()
- (void)updatevalues;
@end

@implementation TripViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"TripEz";    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.carSegementField.selectedSegmentIndex=0;
    [self.carSegementField addTarget:self action:@selector(updatevalues) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - private methods
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
