//
//  WPImage.h
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WPImageSize){
    WPImageSizeUndefined = 0,
    WPImageSizeFull,
    WPImageSizeMedium,
    WPImageSizePostThumbnail,
    WPImageSizeThumbnail
    
};


@interface WPImage : NSObject <NSCoding> {
    NSNumber *height;
    NSString *url;
    NSNumber *width;
    WPImageSize imageSize;
}

@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSNumber *width;
@property (nonatomic) WPImageSize imageSize;



+ (WPImage *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;
@end
