//
//  ViewController.m
//  WhereAmI?
//
//  Created by Matthew Chiappa on 7/13/13.
//  Copyright (c) 2013 Matthew Chiappa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void)findLocation{
    [locationManager startUpdatingLocation];
}

- (void)foundLocation:(CLLocation *)loc{
    CLLocationCoordinate2D coord = [loc coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 700, 700);
    [_mapView setRegion:region animated:YES];
    [_mapView setRegion:region animated:YES];
    _mapView.showsUserLocation = YES;
    [locationManager stopUpdatingLocation];
    NSString *lat = [NSString stringWithFormat:@"%4g", coord.latitude];
    NSString *lon = [NSString stringWithFormat:@"%4g", coord.longitude];
    NSString *alt = [NSString stringWithFormat:@"%4f'", loc.altitude];
    [self displayLatAndLong:lat lon:lon];
    [self displayAlt:alt];
}

- (void)displayLatAndLong:(NSString *) lat lon:(NSString *)lon{
    self.latLabel.text = lat;
    self.longLabel.text = lon;
}

- (void)displayAlt:(NSString *)alt{
    self.altLabel.text = alt;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"%@",[locations lastObject]);
    CLLocation *loc = [locations lastObject];
    [self foundLocation:loc];
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error{
    NSLog(@"%@", error);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    CLLocationCoordinate2D coord;
    coord.latitude = 39;
    coord.longitude = -98;
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, MKCoordinateSpanMake(180, 360));
    [_mapView setRegion:region animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPress:(UIButton *)sender {
    [self findLocation];
}

- (IBAction)resetPress:(UIButton *)sender {
    CLLocationCoordinate2D coord;
    coord.latitude = 39;
    coord.longitude = -98;
    _mapView.showsUserLocation = NO;
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, MKCoordinateSpanMake(180, 360));
    [_mapView setRegion:region animated:YES];
    self.latLabel.text = @" ";
    self.longLabel.text = @" ";
    self.altLabel.text = @" ";
}

- (void) dealloc{
    [locationManager setDelegate:nil];
}
@end
