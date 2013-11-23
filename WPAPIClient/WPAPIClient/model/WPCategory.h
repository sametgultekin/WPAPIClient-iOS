//
//  WPCategory.h
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPCategory : NSObject <NSCoding> {
    NSNumber *categoryID;
    NSString *descriptionText;
    NSNumber *parent;
    NSNumber *postCount;
    NSString *slug;
    NSString *title;
}

@property (nonatomic, copy) NSNumber *categoryID;
@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSNumber *parent;
@property (nonatomic, copy) NSNumber *postCount;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *title;

+ (WPCategory *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
