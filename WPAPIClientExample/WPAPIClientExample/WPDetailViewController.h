//
//  WPDetailViewController.h
//  WPAPIClientExample
//
//  Created by Samet Gültekin on 23/11/13.
//  Copyright (c) 2013 Samet Gültekin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
