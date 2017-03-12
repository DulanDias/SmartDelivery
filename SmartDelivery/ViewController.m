//
//  ViewController.m
//  SmartDelivery
//
//  Created by Dulan Dias on 2/28/17.
//  Copyright © 2017 Dulan Dias. All rights reserved.
//

#import "ViewController.h"
#import "ViewController_CourierDetails.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@implementation ViewController

// You don't need to modify the default initWithNibName:bundle: method.

- (void)loadView {
    [super loadView];
    
}

GMSCameraPosition *camera;
CLLocationManager *locationManager;

double lati;
double longi;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [locationManager requestAlwaysAuthorization];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [locationManager startUpdatingLocation];
    
    //Latitude and longitude of the current location of the device.
    lati = locationManager.location.coordinate.latitude;
    longi = locationManager.location.coordinate.longitude;
    //NSLog(@"Latitude = %f", lati);
    //NSLog(@"Longitude = %f", longi);
    
    //CLLocation *myLocation = [[CLLocation alloc] initWithLatitude:lati longitude:longi];
    
    /*
    //Dummy Longitude and Latitude for Wijerama [TODO: REMOVE]
    lati = 6.857758;
    longi = 79.908473;*/
    
    camera = [GMSCameraPosition cameraWithLatitude:lati longitude:longi  zoom:15];

    
    self.mapContainerView.camera = camera;
    
    self.mapContainerView.myLocationEnabled = YES;

    self.mapContainerView.myLocationEnabled = YES;
    self.mapContainerView.mapType = kGMSTypeNormal;
    self.mapContainerView.settings.zoomGestures = YES;
    self.mapContainerView.settings.rotateGestures = YES;
    
    self.marker.layer.zPosition = 5;
    _mapContainerView.delegate = self;
    
    [self.mapContainerView setMinZoom:10 maxZoom:18];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

double latitude;
double longitude;

- (void) mapView: (GMSMapView *)mapView
idleAtCameraPosition: (GMSCameraPosition *)camera
{
    latitude = mapView.camera.target.latitude;
    longitude = mapView.camera.target.longitude;
    
    //from Google Map SDK
    CLLocation *location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    //from Google Map SDK
    GMSGeocoder *geocode=[[GMSGeocoder alloc]init];
    GMSReverseGeocodeCallback handler=^(GMSReverseGeocodeResponse *response,NSError *error)
    {
        GMSAddress *address=response.firstResult;
        if (address)
        {
            self.pickupLocation.text = [NSString stringWithFormat:@"%@, %@",[address.lines objectAtIndex:0],[address.lines objectAtIndex:1]];
        }
    };
    [geocode reverseGeocodeCoordinate:location.coordinate completionHandler:handler];
}


NSString *packageType = nil;

- (IBAction)nextButton:(UIButton *)sender {
    if (packageType!=nil)
    {
        //[self getGoogleAdrressFromLatLong:(CGFloat)longi lon:(CGFloat)lati];
    }
}

- (IBAction)smallPackageButton:(UIButton *)sender {
    packageType = @"small";
    [self.smallPackageView setBackgroundColor:[UIColor colorWithRed:0.84 green:0.87 blue:0.91 alpha:1.0]];
    [self.largePackageView setBackgroundColor:[UIColor colorWithRed:0.84 green:0.87 blue:0.91 alpha:0.0]];
}

- (IBAction)largePackageButton:(UIButton *)sender {
    packageType = @"large";
    [self.largePackageView setBackgroundColor:[UIColor colorWithRed:0.84 green:0.87 blue:0.91 alpha:1.0]];
    [self.smallPackageView setBackgroundColor:[UIColor colorWithRed:0.84 green:0.87 blue:0.91 alpha:0.0]];
}


- (IBAction)btnNextTouchDown:(UIButton *)sender {
    
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:];

    
    if (packageType!=nil)
    {
    ViewController_CourierDetails *viewControllerB = [[ViewController_CourierDetails alloc] initWithNibName:@"ViewController_CourierDetails" bundle:nil];
    
        viewControllerB.type = packageType;
        viewControllerB.pickup = self.pickupLocation.text;
        viewControllerB.longi = &(longitude);
        viewControllerB.lati = &(latitude) ;
    
    //[self.view addSubview:viewControllerB.view];
    [self.navigationController pushViewController:viewControllerB animated:YES];
     
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Smart Delivery" message:@"Choose the type of package to deliver, to continue." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"showCourierDetails"]){
        
        if (packageType!=nil)
        {
            ViewController_CourierDetails *controller = (ViewController_CourierDetails *)segue.destinationViewController;
        
            controller.type = packageType;
            controller.pickup = self.pickupLocation.text;
            controller.longi = &(longitude);
            controller.lati = &(latitude) ;
        }
        else
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Smart Delivery" message:@"Choose the type of package to deliver, to continue." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }

    }
}

- (IBAction)unwindToContainerVC:(UIStoryboardSegue *)segue {
    
}

@end
