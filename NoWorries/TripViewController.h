//
//  TripViewController.h
//  NoWorries
//
//  Created by user on 2/22/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic,strong) IBOutlet UITextField *srcZipTextField;
@property(nonatomic,strong) IBOutlet UITextField *destZipTextField;
@property(nonatomic,strong) IBOutlet UITextField *daysStayTextField;
@property(nonatomic,strong) IBOutlet UISegmentedControl *carSegementField;
@property(nonatomic,strong) IBOutlet UILabel *cardiagnoseAlertLabel;
@property(nonatomic,strong) IBOutlet UIButton *btnSearch;
@property(nonatomic,strong) IBOutlet UIButton *btnCurrLoc;
@end
