//
//  ViewController.m
//  Receiver
//
//  Created by Grzegorz Krukiewicz-Gacek on 8/1/13.
//  Copyright (c) 2013 Estimote, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CoreBluetoothDelegate>

@property (nonatomic, strong) CoreBluetoothController *bluetoothController;
@property (nonatomic, strong) IBOutlet UILabel *infoLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _bluetoothController = [CoreBluetoothController sharedInstance];
    _bluetoothController.delegate = self;
    /*if (!_bluetoothController.isConnected)
        [_bluetoothController findPeripherals];*/
    
    [_bluetoothController startReadingRSSI];
}

#pragma mark - CoreBluetooth delegate methods

- (void)didUpdateRSSI:(int)RSSI
{
    _infoLabel.text = [NSString stringWithFormat:@"%d", RSSI];
    NSLog(@"%d", RSSI);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
