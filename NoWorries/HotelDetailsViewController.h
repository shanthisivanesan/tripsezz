//
//  HotelDetailsViewController.h
//  NoWorries
//
//  Created by Shanthi on 3/9/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *highRateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)btnSave:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnBook;

@end
