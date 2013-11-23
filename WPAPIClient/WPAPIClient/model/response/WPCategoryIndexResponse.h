//
//  WPCategoryIndexResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPCategoryIndexResponse : NSObject <NSCoding> {
    NSArray *categories;
    NSNumber *categoryCount;
    NSString *status;
}

@property (nonatomic, copy) NSArray *categories;
@property (nonatomic, copy) NSNumber *categoryCount;
@property (nonatomic, copy) NSString *status;

+ (WPCategoryIndexResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
