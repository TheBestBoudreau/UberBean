//
//  ViewController.m
//  UberBean
//
//  Created by Tyler Boudreau on 2018-04-27.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
@property CLLocationManager *locationManager;
@property CLLocation *currentLocation;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [[CLLocationManager alloc]init];
    [self.locationManager requestWhenInUseAuthorization];
    _myMapView = [[MKMapView alloc] init];
    
    self.locationManager.delegate=self;
    [self.myMapView setShowsUserLocation:true];
    MKCoordinateSpanMake(0.06,0.06);
    self.currentLocation = self.locationManager.location;
    MKCoordinateRegion myRegion = MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate,100, 100);
    [self.myMapView setRegion:myRegion animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    self.currentLocation = locations.firstObject;
    NSLog(@" Hey this is my location :%@",locations);
    
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    if (status == (kCLAuthorizationStatusAuthorizedWhenInUse | kCLAuthorizationStatusAuthorizedAlways)){
        [self.locationManager requestLocation];
        
    }
    NSLog(@" This is the status :%d",status);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{

}



@end
