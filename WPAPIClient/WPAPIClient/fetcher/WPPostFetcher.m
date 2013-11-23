//
//  WPPostFetcher.m
//  WP-API
//
//  Created by Samet Gültekin on 21/11/13.
//
//

#import "WPPostFetcher.h"
#import "AFNetworking.h"
#import "WPClient.h"
#import "WPPostResponse.h"
#import "WPPost.h"
#import "WPRecentPostsResponse.h"
#import "WPPostsResponse.h"
#import "WPPostsByDateResponse.h"
#import "WPPostsByCategoryResponse.h"
#import "WPPostsByTagResponse.h"
#import "WPPostsByAuthorResponse.h"
#import "WPSearchResultsResponse.h"

@implementation WPPostFetcher

#pragma mark - 
#pragma mark get_post methods

- (void)fetchPostWithPostID:(NSNumber *)postID completion:(WPPostFetcherCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [[NSString stringWithFormat:@"get_post?id=%@", postID] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [client GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostResponse *postRequest = [WPPostResponse instanceFromDictionary:responseObject];
        completion(postRequest.post, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

- (void)fetchPostWithSlug:(NSString *)slug completion:(WPPostFetcherCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [[NSString stringWithFormat:@"get_post?slug=%@", slug] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [client GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostResponse *postRequest = [WPPostResponse instanceFromDictionary:responseObject];
        completion(postRequest.post, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

#pragma mark - 
#pragma mark get_recent_post methods


- (void)fetchRecentPostsWithOptions:(NSDictionary *)options completion:(WPRecentPostsCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    NSString *urlString = [NSString stringWithFormat:@"get_recent_posts?count=%@&page=%@&post_type=%@",
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [client GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPRecentPostsResponse *response = [WPRecentPostsResponse instanceFromDictionary:responseObject];

        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
    
    
}


#pragma mark -
#pragma mark get_posts methods

- (void)fetchPostsWithOptions:(NSDictionary *)options completion:(WPPostsCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    NSString *urlString = [NSString stringWithFormat:@"get_posts?count=%@&page=%@&post_type=%@",
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    if (options[@"ignore_sticky_posts"] != nil) {
        urlString = [urlString stringByAppendingFormat:@"&ignore_sticky_posts=%@", options[@"ignore_sticky_posts"]];
    }
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [client GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostsResponse *response = [WPPostsResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

#pragma mark -
#pragma mark get_date_posts methods

- (void)fetchPostsByDate:(NSString *)dateString options:(NSDictionary *)options completion:(WPPostsByDateCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [NSString stringWithFormat:@"get_date_posts?date=%@&count=%@&page=%@&post_type=%@", dateString,
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    [client  GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostsByDateResponse *response = [WPPostsByDateResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];

    
}

#pragma mark -
#pragma mark get_category_posts methods

- (void)fetchPostsByCategoryID:(NSNumber *)categoryID options:(NSDictionary *)options completion:(WPPostsByCategoryCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [NSString stringWithFormat:@"get_category_posts?id=%@&count=%@&page=%@&post_type=%@", categoryID,
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    [client  GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostsByCategoryResponse *response = [WPPostsByCategoryResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

- (void)fetchPostsByCategorySlug:(NSString *)categorySlug options:(NSDictionary *)options completion:(WPPostsByCategoryCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [NSString stringWithFormat:@"get_category_posts?slug=%@&count=%@&page=%@&post_type=%@", categorySlug,
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    [client  GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostsByCategoryResponse *response = [WPPostsByCategoryResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}


#pragma mark -
#pragma mark get_tag_posts methods


- (void)fetchPostsByTagID:(NSNumber *)tagID options:(NSDictionary *)options completion:(WPPostsByTagCompletion)completion{
    
    [self fetchPostsByTagID:tagID slug:nil options:options completion:completion];
}

- (void)fetchPostsByTagSlug:(NSString *)slug options:(NSDictionary *)options completion:(WPPostsByTagCompletion)completion{
    
    [self fetchPostsByTagID:nil slug:slug options:options completion:completion];

}


- (void)fetchPostsByTagID:(NSNumber*)tagIDOrNil slug:(NSString*)slugOrNil options:(NSDictionary*)options completion:(WPPostsByTagCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [NSString stringWithFormat:@"get_tag_posts?"];
    
    if (tagIDOrNil) {
        urlString = [urlString stringByAppendingFormat:@"id=%@&", tagIDOrNil];
    }
    else if(slugOrNil){
        urlString = [urlString stringByAppendingFormat:@"slug=%@&", slugOrNil];
    }
    else{
        urlString = [urlString stringByAppendingFormat:@"id=&"];
    }
    
    urlString = [urlString stringByAppendingFormat:@"count=%@&page=%@&post_type=%@",
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    [client  GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostsByTagResponse *response = [WPPostsByTagResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
    
    
}


#pragma mark -
#pragma mark get_author_posts methods


- (void)fetchPostsByAuthorID:(NSNumber *)authorID options:(NSDictionary *)options completion:(WPPostsByAuthorCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [NSString stringWithFormat:@"get_author_posts?id=%@&count=%@&page=%@&post_type=%@", authorID,
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    [client  GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostsByAuthorResponse *response = [WPPostsByAuthorResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
    
}

- (void)fetchPostsByAuthorSlug:(NSString *)slug options:(NSDictionary *)options completion:(WPPostsByAuthorCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [NSString stringWithFormat:@"get_author_posts?slug=%@&count=%@&page=%@&post_type=%@", slug,
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    [client  GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPPostsByAuthorResponse *response = [WPPostsByAuthorResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}


#pragma mark -
#pragma mark get_search_results methods

- (void)fetchSearchResultsWithKeywords:(NSString *)keywords options:(NSDictionary *)options completion:(WPSearchResultsCompletion)completion{
    
    WPClient *client = [WPClient sharedClient];
    
    NSString *urlString = [NSString stringWithFormat:@"get_search_results?search=%@&count=%@&page=%@&post_type=%@", keywords,
                           nullToEmptyString(options[@"count"]),
                           nullToEmptyString(options[@"page"]),
                           nullToEmptyString(options[@"post_type"])];
    
    [client  GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        WPSearchResultsResponse *response = [WPSearchResultsResponse instanceFromDictionary:responseObject];
        
        completion(response, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

#pragma mark - Helper Functions

NSString* nullToEmptyString(NSString* string){
    
    if ([string isEqual:[NSNull null]] || string == nil) {
        
        string = [NSString stringWithFormat:@""];
    }
    
    return string;
}


@end
