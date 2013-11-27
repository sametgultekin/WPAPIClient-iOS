//
//  WPClient.m
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//

#import "WPClient.h"
static NSString *baseURLString;

@implementation WPClient



+ (instancetype)instanceWithOptions:(NSDictionary *)options{
    
    baseURLString = options[@"baseURL"];
    
    WPClient * client = [WPClient sharedClient];
    
    return client;

}

+ (instancetype)sharedClient{
    
    NSAssert(baseURLString, @"baseURL is not given");
    
    static WPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    });
    
    return _sharedClient;
}

+ (NSString*)baseURL{
    return baseURLString;
}
@end
