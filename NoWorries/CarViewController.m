//
//  CarViewController.m
//  NoWorries
//
//  Created by user on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "CarViewController.h"

@interface CarViewController ()
- (IBAction)btncallDealer:(id)sender;
@end

@implementation CarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Car Report";    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callDealer)];
    [self.btncallDealer addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btncallDealer:(id)sender {
    [self callDealer];
}
- (void) callDealer
{
    NSLog(@"Call Dealer Tapped");
    NSString *phoneNumber = @"1-408-203-5769"; // dynamically assigned
    NSString *phoneURLString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
    [[UIApplication sharedApplication] openURL:phoneURL];
    
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:1-408-203-5769"]];
    
}

@end
