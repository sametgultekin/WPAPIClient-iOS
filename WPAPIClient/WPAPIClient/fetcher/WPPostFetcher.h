//
//  WPPostFetcher.h
//  WP-API
//
//  Created by Samet Gültekin on 21/11/13.
//
//

#import <Foundation/Foundation.h>
@class WPPost;
@class WPRecentPostsResponse;
@class WPPostsResponse;
@class WPPostsByDateResponse;
@class WPPostsByCategoryResponse;
@class WPPostsByTagResponse;
@class WPPostsByAuthorResponse;
@class WPSearchResultsResponse;

typedef  void (^WPPostFetcherCompletion)(WPPost *post, NSError *error);
typedef  void (^WPRecentPostsCompletion)(WPRecentPostsResponse *response, NSError *error);
typedef  void (^WPPostsCompletion)(WPPostsResponse *response, NSError *error);
typedef  void (^WPPostsByDateCompletion)(WPPostsByDateResponse *response, NSError *error);
typedef  void (^WPPostsByCategoryCompletion)(WPPostsByCategoryResponse *response, NSError *error);
typedef  void (^WPPostsByTagCompletion)(WPPostsByTagResponse *response, NSError *error);
typedef  void (^WPPostsByAuthorCompletion)(WPPostsByAuthorResponse *response, NSError *error);

typedef  void (^WPSearchResultsCompletion)(WPSearchResultsResponse *response, NSError *error);





@interface WPPostFetcher : NSObject

/**
 @param postID
 */

- (void)fetchPostWithPostID:(NSNumber*)postID completion:(WPPostFetcherCompletion)completion;

/**
 @param slug
 */

- (void)fetchPostWithSlug:(NSString*)slug completion:(WPPostFetcherCompletion)completion;

/**
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 
 */

- (void)fetchRecentPostsWithOptions:(NSDictionary*)options completion:(WPRecentPostsCompletion)completion;

/**
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
    ignore_sticky_posts - ignore sticky posts (Default is 1);
 
 */

- (void)fetchPostsWithOptions:(NSDictionary*)options completion:(WPPostsCompletion)completion;

/**
 @param date - set to a date in the format YYYY or YYYY-MM or YYYY-MM-DD 
    (non-numeric characters are stripped from the var, so YYYYMMDD or YYYY/MM/DD are also valid)
 
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 */

- (void)fetchPostsByDate:(NSString*)dateString options:(NSDictionary*)options completion:(WPPostsByDateCompletion)completion;

/**
 @param categoryID
 
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
*/



- (void)fetchPostsByCategoryID:(NSNumber*)categoryID options:(NSDictionary*)options completion:(WPPostsByCategoryCompletion)completion;

/**
 @param slug
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 */

- (void)fetchPostsByCategorySlug:(NSString*)categorySlug options:(NSDictionary*)options completion:(WPPostsByCategoryCompletion)completion;


/**

 @param tagID - set to the tag's ID
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 
 */

- (void)fetchPostsByTagID:(NSNumber*)tagID options:(NSDictionary*)options completion:(WPPostsByTagCompletion)completion;

/**
 
 @param slug - set to the tag's URL slug
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 
 */

- (void)fetchPostsByTagSlug:(NSString*)slug options:(NSDictionary*)options completion:(WPPostsByTagCompletion)completion;

/**
 @param authorID - set to the author's ID
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 */

- (void)fetchPostsByAuthorID:(NSNumber*)authorID options:(NSDictionary*)options completion:(WPPostsByAuthorCompletion)completion;

/**
 @param slug - set to the author's Slug
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 */

- (void)fetchPostsByAuthorSlug:(NSString*)slug options:(NSDictionary*)options completion:(WPPostsByAuthorCompletion)completion;

/**
 @param keyword - set to the desired search query
 @param options
    count - determines how many posts per page are returned (default value is 10)
    page - return a specific page number from the results
    post_type - used to retrieve custom post types
 */

- (void)fetchSearchResultsWithKeywords:(NSString*)keywords options:(NSDictionary*)options completion:(WPSearchResultsCompletion)completion;




@end
