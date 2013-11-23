//
//  WPIndexFetcher.m
//  WP-API
//
//  Created by Samet Gültekin on 23/11/13.
//
//

#import "WPIndexFetcher.h"
#import "WPAuthorIndexResponse.h"
#import "WPTagIndexResponse.h"
#import "WPCategoryIndexResponse.h"
#import "AFNetworking.h"
#import "WPClient.h"

@implementation WPIndexFetcher

#pragma mark -
#pragma mark get_category_index method

- (void)fetchCategoryIndexWithCompletion:(WPCategoryIndexCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [[NSString stringWithFormat:@"get_category_index"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [client GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPCategoryIndexResponse *response = [WPCategoryIndexResponse instanceFromDictionary:responseObject];
        completion(response, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}


#pragma mark -
#pragma mark get_tag_index method

- (void)fetchTagIndexWithCompletion:(WPTagIndexCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [[NSString stringWithFormat:@"get_tag_index"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [client GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPTagIndexResponse *response = [WPTagIndexResponse instanceFromDictionary:responseObject];
        completion(response, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
    
}


#pragma mark -
#pragma mark get_author_index method

- (void)fetchAuthorIndexWithCompletion:(WPAuthorIndexCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [[NSString stringWithFormat:@"get_author_index"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [client GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPAuthorIndexResponse *response = [WPAuthorIndexResponse instanceFromDictionary:responseObject];
        completion(response, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

@end
