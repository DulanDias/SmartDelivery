//
//  ViewController_CourierDetails.h
//  SmartDelivery
//
//  Created by Dulan Dias on 2/28/17.
//  Copyright © 2017 Dulan Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController_CourierDetails : UIViewController

@property(nonatomic) NSString *type;
@property(nonatomic) NSString *pickup;
@property(nonatomic) double *longi;
@property(nonatomic) double *lati;
@property (weak, nonatomic) IBOutlet UITextField *txtPickUpAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtSenderName;
@property (weak, nonatomic) IBOutlet UITextField *txtSenderMobile;
@property (weak, nonatomic) IBOutlet UITextField *txtItemDescription;

@property (weak, nonatomic) IBOutlet UITextField *txtDropOffLocation;
@property (weak, nonatomic) IBOutlet UITextField *txtReceipientName;
@property (weak, nonatomic) IBOutlet UITextField *txtReceipientMobile;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnBack;
- (IBAction)btnBackTouchDown:(UIBarButtonItem *)sender;


@end

