//
//  DetailsCell.h
//  NoWorries
//
//  Created by Sairam Sankaran on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel *hotelNameLabel;
@property(nonatomic,strong) IBOutlet UILabel *address1Label;
@property(nonatomic,strong) IBOutlet UILabel *zipLabel;
@property(nonatomic,strong) IBOutlet UILabel *ratingLabel;
@property(nonatomic,strong) IBOutlet UILabel *price;
@property(nonatomic,strong) IBOutlet UIImageView *hotelImage;
@property(nonatomic,strong) IBOutlet UIButton *btnConfirm;

@end
