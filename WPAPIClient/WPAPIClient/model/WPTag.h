//
//  WPTag.h
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPTag : NSObject <NSCoding> {
    NSString *descriptionText;
    NSNumber *postCount;
    NSString *slug;
    NSNumber *tagID;
    NSString *title;
}

@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSNumber *postCount;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSNumber *tagID;
@property (nonatomic, copy) NSString *title;

+ (WPTag *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
