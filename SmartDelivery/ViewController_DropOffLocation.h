//
//  UIViewController+ViewController_DropOffLocation.h
//  SmartDelivery
//
//  Created by Dulan Dias on 3/12/17.
//  Copyright © 2017 Dulan Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController_DropOffLocation : UIViewController<GMSMapViewDelegate>

@property (strong, nonatomic) IBOutlet GMSMapView *mapContainerView;
@property (strong, nonatomic) IBOutlet UIImageView *marker;
@property (weak, nonatomic) IBOutlet UILabel *dropOffLocation;

@end
