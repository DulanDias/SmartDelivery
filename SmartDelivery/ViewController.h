//
//  ViewController.h
//  SmartDelivery
//
//  Created by Dulan Dias on 2/28/17.
//  Copyright © 2017 Dulan Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController : UIViewController<GMSMapViewDelegate>

@property (strong, nonatomic) IBOutlet GMSMapView *mapContainerView;

@property (strong, nonatomic) IBOutlet UIImageView *marker;

@property (weak, nonatomic) IBOutlet UILabel *pickupLocation;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *smallPackageButton;
@property (weak, nonatomic) IBOutlet UIButton *largePackageButton;
@property (weak, nonatomic) IBOutlet UIView *smallPackageView;
@property (weak, nonatomic) IBOutlet UIView *largePackageView;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
- (IBAction)btnNextTouchDown:(UIButton *)sender;

@end

