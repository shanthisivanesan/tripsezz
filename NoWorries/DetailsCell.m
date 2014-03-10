//
//  DetailsCell.m
//  NoWorries
//
//  Created by Sairam Sankaran on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "DetailsCell.h"

@implementation DetailsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)onButton:(id)sender {
    NSLog(@"Settings Button Tapped");

   }
@end
