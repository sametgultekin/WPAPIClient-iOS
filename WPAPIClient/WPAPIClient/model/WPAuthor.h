//
//  WPAuthor.h
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPAuthor : NSObject <NSCoding> {
    NSNumber *authorID;
    NSString *descriptionText;
    NSString *firstName;
    NSString *lastName;
    NSString *name;
    NSString *nickname;
    NSString *slug;
    NSString *url;
}

@property (nonatomic, copy) NSNumber *authorID;
@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *url;

+ (WPAuthor *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
