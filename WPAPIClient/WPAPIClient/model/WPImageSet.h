//
//  WPImageSet.h
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//

#import <Foundation/Foundation.h>

@class WPImage;
@interface WPImageSet : NSObject <NSCoding> {
    
    WPImage *fullSizeImage;
    WPImage *mediumSizeImage;
    WPImage *postThumbnailSizeImage;
    WPImage *thumbnailSizeImage;
}

@property (nonatomic, strong) WPImage *fullSizeImage;
@property (nonatomic, strong) WPImage *mediumSizeImage;
@property (nonatomic, strong) WPImage *postThumbnailSizeImage;
@property (nonatomic, strong) WPImage *thumbnailSizeImage;

+ (WPImageSet *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
