//
//  ViewController_CourierDetails.m
//  SmartDelivery
//
//  Created by Dulan Dias on 2/28/17.
//  Copyright © 2017 Dulan Dias. All rights reserved.
//

#import "ViewController.h"
#import "ViewController_CourierDetails.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@implementation ViewController_CourierDetails

// You don't need to modify the default initWithNibName:bundle: method.

@synthesize pickup;

- (IBAction) triggerActionWithSender: (id) sender{
    
}

- (void)loadView {
    [super loadView];
    
}

- (void)viewDidLoad {
    
    self.txtPickUpAddress.text = pickup;
    
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBackTouchDown:(UIBarButtonItem *)sender {
    //[self performSegueWithIdentifier:@"unwindToSmartDelivery" sender:self];
    [self dismissViewControllerAnimated: YES completion: nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"showDropOffLocation"]){
        
            
        
    }
}


@end
