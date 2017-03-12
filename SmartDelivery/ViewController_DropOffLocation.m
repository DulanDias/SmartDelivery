//
//  UIViewController+ViewController_DropOffLocation.m
//  SmartDelivery
//
//  Created by Dulan Dias on 3/12/17.
//  Copyright © 2017 Dulan Dias. All rights reserved.
//

#import "ViewController_DropOffLocation.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@implementation  ViewController_DropOffLocation

- (void)loadView {
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    double lati;
    double longi;
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [locationManager startUpdatingLocation];
    
    //Latitude and longitude of the current location of the device.
    lati = locationManager.location.coordinate.latitude;
    longi = locationManager.location.coordinate.longitude;
    //NSLog(@"Latitude = %f", lati);
    //NSLog(@"Longitude = %f", longi);
    
    //CLLocation *myLocation = [[CLLocation alloc] initWithLatitude:lati longitude:longi];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lati longitude:longi  zoom:15];
    
    
    self.mapContainerView.camera = camera;
    
    self.mapContainerView.myLocationEnabled = YES;
    
    self.mapContainerView.myLocationEnabled = YES;
    self.mapContainerView.mapType = kGMSTypeNormal;
    self.mapContainerView.settings.zoomGestures = YES;
    self.mapContainerView.settings.rotateGestures = YES;
    
    self.marker.layer.zPosition = 5;
    self.mapContainerView.delegate = self;
    
    [self.mapContainerView setMinZoom:10 maxZoom:18];
}

- (void) mapView: (GMSMapView *)mapView
idleAtCameraPosition: (GMSCameraPosition *)camera
{
    double latitude = mapView.camera.target.latitude;
    double longitude = mapView.camera.target.longitude;
    
    //from Google Map SDK
    CLLocation *location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    //from Google Map SDK
    GMSGeocoder *geocode=[[GMSGeocoder alloc]init];
    GMSReverseGeocodeCallback handler=^(GMSReverseGeocodeResponse *response,NSError *error)
    {
        GMSAddress *address=response.firstResult;
        if (address)
        {
            self.dropOffLocation.text = [NSString stringWithFormat:@"%@, %@",[address.lines objectAtIndex:0],[address.lines objectAtIndex:1]];
        }
    };
    [geocode reverseGeocodeCoordinate:location.coordinate completionHandler:handler];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
