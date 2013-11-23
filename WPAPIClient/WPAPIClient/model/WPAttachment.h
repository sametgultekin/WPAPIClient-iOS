//
//  WPAttachment.h
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AttachmentImages;
@class WPImageSet;

@interface WPAttachment : NSObject <NSCoding> {
    NSNumber *attachmentID;
    NSString *caption;
    NSString *descriptionText;
    AttachmentImages *images;
    WPImageSet *imageSet;
    NSString *mimeType;
    NSNumber *parent;
    NSString *slug;
    NSString *title;
    NSString *url;
}

@property (nonatomic, copy) NSNumber *attachmentID;
@property (nonatomic, copy) NSString *caption;
@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, strong) AttachmentImages *images;
@property (nonatomic ,strong) WPImageSet *imageSet;
@property (nonatomic, copy) NSString *mimeType;
@property (nonatomic, copy) NSNumber *parent;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;

+ (WPAttachment *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
