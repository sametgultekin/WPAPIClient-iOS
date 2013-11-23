//
//  WPDetailViewController.m
//  WPAPIClientExample
//
//  Created by Samet Gültekin on 23/11/13.
//  Copyright (c) 2013 Samet Gültekin. All rights reserved.
//

#import "WPDetailViewController.h"

@interface WPDetailViewController ()
- (void)configureView;
@end

@implementation WPDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
