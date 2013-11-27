//
//  WPClient.h
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//


#import "AFHTTPSessionManager.h"

@interface WPClient : AFHTTPSessionManager

+ (instancetype)instanceWithOptions:(NSDictionary*)options;
+ (instancetype)sharedClient;
+ (NSString*)baseURL;
@end
