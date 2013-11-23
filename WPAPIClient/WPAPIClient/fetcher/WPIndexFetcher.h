//
//  WPIndexFetcher.h
//  WP-API
//
//  Created by Samet Gültekin on 23/11/13.
//
//

#import <Foundation/Foundation.h>

@class WPCategoryIndexResponse;
@class WPAuthorIndexResponse;
@class WPTagIndexResponse;

typedef  void (^WPCategoryIndexCompletion)(WPCategoryIndexResponse *response, NSError *error);
typedef  void (^WPTagIndexCompletion)(WPTagIndexResponse *response, NSError *error);
typedef  void (^WPAuthorIndexCompletion)(WPAuthorIndexResponse *response, NSError *error);


@interface WPIndexFetcher : NSObject

/**
 *  Returns Category Index Response Object
 */

- (void)fetchCategoryIndexWithCompletion:(WPCategoryIndexCompletion)completion;

/**
 *  returns tag index response object
 */

- (void)fetchTagIndexWithCompletion:(WPTagIndexCompletion)completion;

/**
 *  returns author index response object
 */

- (void)fetchAuthorIndexWithCompletion:(WPAuthorIndexCompletion)completion;

@end
