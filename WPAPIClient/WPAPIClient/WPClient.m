//
//  WPClient.m
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//

#import "WPClient.h"

@implementation WPClient

+ (instancetype)sharedClient{
    
    static WPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WPClient alloc] initWithBaseURL:[NSURL URLWithString:WP_API_BASEURL]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    });
    
    return _sharedClient;
}
@end
