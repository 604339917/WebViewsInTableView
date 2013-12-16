//
//  HtmlParserAndHeightCalculator.h
//  WebViewInTableView
//
//
// a simple html parser to calculate height, the <img /> should have attribute of "imgwidth" representing image width
// and "imgheight" representing height. Otherwise, the parser will asume them to be 100px

//  Created by titantse on 12/16/13.
//  Copyright (c) 2013 x. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTHtmlComponent : NSObject
{
	NSString *_text;
	NSString *_tagLabel;
	NSMutableDictionary *_attributes;
	int _position;
	int _componentIndex;
    BOOL _isClosure;
    UIImage *img_;
}

@property (nonatomic, assign) int componentIndex;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *tagLabel;
@property (nonatomic, retain) NSMutableDictionary *attributes;
@property (nonatomic, assign) int position;
@property (nonatomic, assign) BOOL isClosure;
@property (nonatomic, retain) UIImage *img;


- (id)initWithString:(NSString*)aText tag:(NSString*)aTagLabel attributes:(NSMutableDictionary*)theAttributes;
+ (id)componentWithString:(NSString*)aText tag:(NSString*)aTagLabel attributes:(NSMutableDictionary*)theAttributes;
- (id)initWithTag:(NSString*)aTagLabel position:(int)_position attributes:(NSMutableDictionary*)_attributes;
+ (id)componentWithTag:(NSString*)aTagLabel position:(int)aPosition attributes:(NSMutableDictionary*)theAttributes;

@end


@interface RTHtmlComponentsStructure :NSObject {
    NSArray *components_;
    NSString *plainTextData_;
    NSArray *linkComponents_;
    NSArray *imgComponents_;
}
@property(nonatomic,retain) NSArray *components;
@property(nonatomic,retain) NSArray *linkComponents;
@property(nonatomic,retain) NSArray *imgComponents;
@property(nonatomic, copy) NSString *plainTextData;
@end


@interface HtmlParserAndHeightCalculator : NSObject
{
    
}

+(CGSize) calculateHeightQJD:(RTHtmlComponentsStructure *) components;
+ (RTHtmlComponentsStructure*)extractTextStyleQJD:(NSString*)data;
+ (NSString*)stripURL:(NSString*)url;


@end
