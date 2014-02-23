//
//  CarViewController.h
//  NoWorries
//
//  Created by user on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic,strong) IBOutlet UILabel *brakesLabel;
@property(nonatomic,strong) IBOutlet UILabel *oilChangeLabel;
@property(nonatomic,strong) IBOutlet UILabel *tirePressureLabel;
@property(nonatomic,strong) IBOutlet UILabel *gasLabel;
@property(nonatomic,strong) IBOutlet UILabel *engineLabel;
@property(nonatomic,strong) IBOutlet UILabel *carReportLabel;
@property(nonatomic,strong) IBOutlet UISlider *carStatusslider;
@property(nonatomic,strong) IBOutlet UIButton *btncarReport;
@property(nonatomic,strong) IBOutlet UIButton *btncallDealer;
@end
