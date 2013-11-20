//
//  ViewController.h
//  WhereAmI?
//
//  Created by Matthew Chiappa on 7/13/13.
//  Copyright (c) 2013 Matthew Chiappa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIButton *locateMe;
@property (strong, nonatomic) IBOutlet UILabel *latLabel;
@property (strong, nonatomic) IBOutlet UILabel *longLabel;
@property (strong, nonatomic) IBOutlet UILabel *altLabel;
@property (strong, nonatomic) IBOutlet UIButton *resetLabel;

- (IBAction)buttonPress:(UIButton *)sender;
- (IBAction)resetPress:(UIButton *)sender;

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;
- (void)displayLatAndLong:(NSString *) lat lon:(NSString *)lon;
- (void)displayAlt:(NSString *)alt;

@end
