//
//  WPClient.h
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//

#define WP_API_BASEURL @"http://localhost:8888/wordpress/api/"


#import "AFHTTPSessionManager.h"

@interface WPClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
