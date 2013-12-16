//
//  HtmlParserAndHeightCalculator.m
//  WebViewInTableView
//
//
// the main parser function extractTextStyle function is copied and modifed from honcheng's RTLabel
//  Created by titantse on 12/16/13.
//  Copyright (c) 2013 x. All rights reserved.
//

#import "HtmlParserAndHeightCalculator.h"

@implementation RTHtmlComponent

@synthesize text = _text;
@synthesize tagLabel = _tagLabel;
@synthesize attributes = _attributes;
@synthesize position = _position;
@synthesize componentIndex = _componentIndex;
@synthesize isClosure = _isClosure;
@synthesize img = img_;

- (id)initWithString:(NSString*)aText tag:(NSString*)aTagLabel attributes:(NSMutableDictionary*)theAttributes;
{
    self = [super init];
	if (self) {
		self.text = aText;
		self.tagLabel = aTagLabel;
		self.attributes = theAttributes;
        self.isClosure = NO;
        
	}
	return self;
}

+ (id)componentWithString:(NSString*)aText tag:(NSString*)aTagLabel attributes:(NSMutableDictionary*)theAttributes
{
	return [[[self alloc] initWithString:aText tag:aTagLabel attributes:theAttributes] autorelease];
}

- (id)initWithTag:(NSString*)aTagLabel position:(int)aPosition attributes:(NSMutableDictionary*)theAttributes
{
    self = [super init];
    if (self) {
        self.tagLabel = aTagLabel;
		self.position = aPosition;
		self.attributes = theAttributes;
        self.isClosure = NO;
    }
    return self;
}

+(id)componentWithTag:(NSString*)aTagLabel position:(int)aPosition attributes:(NSMutableDictionary*)theAttributes
{
	return [[[self alloc] initWithTag:aTagLabel position:aPosition attributes:theAttributes] autorelease];
}



- (NSString*)description
{
	NSMutableString *desc = [NSMutableString string];
	[desc appendFormat:@"text: %@", self.text];
	[desc appendFormat:@", position: %i", self.position];
	if (self.tagLabel) [desc appendFormat:@", tag: %@", self.tagLabel];
	if (self.attributes) [desc appendFormat:@", attributes: %@", self.attributes];
	return desc;
}

- (void)dealloc
{
    self.text = nil;
    self.tagLabel = nil;
    self.attributes = nil;
    self.img = nil;
    [super dealloc];
}

@end

@implementation RTHtmlComponentsStructure


@end


@implementation HtmlParserAndHeightCalculator
#define DEFAULT_LINE_HEIGHT 21
#define DEFAULT_CELL_WIDTH 305


+(CGSize) sizeForText:(NSString *) text font:(UIFont *) font
{
    CGSize size=[text sizeWithFont:font forWidth:MAXFLOAT lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"font width :%d, height: %d", (int)size.width, (int)size.height);
    return size;
}



+(CGSize) calculateHeightQJD:(RTHtmlComponentsStructure *) components
{
    UIFont *font=[UIFont  systemFontOfSize:17];
    float totalHeight=0;float indicator=0; float lineheight=DEFAULT_LINE_HEIGHT;
    for(RTHtmlComponent *component in components.components)
    {
        if([component.tagLabel isEqualToString:@"br"])
        {
            totalHeight+=lineheight;
            lineheight=DEFAULT_LINE_HEIGHT;
            indicator=0;
        }
        if([component.tagLabel isEqualToString:@"img"])
        {
            CGSize size;
            size.width=[[component.attributes objectForKey:@"width"] intValue];
            size.height=[[component.attributes objectForKey:@"height"] intValue];
            if(size.width>DEFAULT_CELL_WIDTH)
            {
                //如果超过屏幕宽度，直接换行，从第三行开始。
                if(indicator>0)
                {
                    totalHeight+=lineheight;
                }
                totalHeight+=size.height;
                indicator=0;
                lineheight=DEFAULT_LINE_HEIGHT;
            }
            else{
                
                if(indicator+ size.width> DEFAULT_CELL_WIDTH)
                {
                    indicator=size.width;
                    totalHeight+=lineheight;
                    lineheight=DEFAULT_LINE_HEIGHT;
                }
                else{
                    indicator+=size.width;
                }
                lineheight=lineheight<size.height?size.height:lineheight;
            }
        }
        if([component.tagLabel isEqualToString:@"rawText"])
        {
            CGSize size=  [HtmlParserAndHeightCalculator sizeForText:component.text font:font];
            if(indicator+ size.width> DEFAULT_CELL_WIDTH)
            {
                int lines=(int)((indicator+ size.width)/DEFAULT_CELL_WIDTH);
                indicator= indicator+ size.width- (int)lines*DEFAULT_CELL_WIDTH;
                totalHeight+=lineheight;
                totalHeight+= DEFAULT_LINE_HEIGHT *(lines-1);
                lineheight=DEFAULT_LINE_HEIGHT;
            }
            else{
                indicator+=size.width;
            }
            
        }
    }
    totalHeight+=lineheight;
    NSLog(@"totalHeight:%f, indicator:%f, lineHeight:%f", totalHeight, indicator, lineheight);
    
    return  CGSizeMake(320, totalHeight);
}



+(RTHtmlComponentsStructure*)extractTextStyle:(NSString*)data
{
    
    NSScanner *scanner = nil;
	NSString *text = nil;
	NSString *tag = nil;
    //These two variable are used to handle the unclosed tags.
    BOOL isBeginTag = NO;
    NSInteger beginTagCount = 0;
    
    //plainData is used to store the current plain result during the parse process,
    //such as <a>link to yahoo!</a> </font> (the start tag <font size=30> has
    //been parsed)
    NSString *plainData = [NSString stringWithString:data];
	
	NSMutableArray *components = [NSMutableArray array];
    NSMutableArray *linkComponents = [NSMutableArray array];
    NSMutableArray *imgComponents = [NSMutableArray array];
	
	int last_position = 0;
	scanner = [NSScanner scannerWithString:data];
	while (![scanner isAtEnd])
    {
        //Begin element(such as <font size=30>) or end element(such as </font>)
		[scanner scanUpToString:@"<" intoString:&text];
        
        if(beginTagCount <= 0 && !isBeginTag && text) { //This words even can handle the unclosed tags elegancely
            
            NSRange subRange;
            //Decipher
            do {
                subRange = [plainData rangeOfString:@"&lt;" options:NSCaseInsensitiveSearch range:NSMakeRange(last_position, [text length])];
                if (subRange.location == NSNotFound) {
                    break;
                }
                
                plainData = [plainData stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<" options:NSCaseInsensitiveSearch range:subRange];
                text = [text stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<" options:NSCaseInsensitiveSearch range:NSMakeRange(subRange.location - last_position,subRange.length)];
                
                
            }
            while (true);
            do {
                subRange = [plainData rangeOfString:@"&gt;" options:NSCaseInsensitiveSearch range:NSMakeRange(last_position, [text length])];
                if (subRange.location == NSNotFound) {
                    break;
                }
                
                plainData = [plainData stringByReplacingOccurrencesOfString:@"&gt;" withString:@">" options:NSCaseInsensitiveSearch range:subRange];
                text = [text stringByReplacingOccurrencesOfString:@"&gt;" withString:@">" options:NSCaseInsensitiveSearch range:NSMakeRange(subRange.location - last_position,subRange.length)];
            }
            while (true);
            
            
            
            
            
            
        }
        
        if(text)
        {
            RTHtmlComponent *component = [RTHtmlComponent componentWithString:text tag:@"rawText" attributes:nil];
            component.isClosure = YES;
            component.position = last_position;
            [components addObject:component];
        }
        
        text = nil;
		
        [scanner scanUpToString:@">" intoString:&text];
		if (!text || [scanner isAtEnd]) {
            
            if (text) {
                plainData = [plainData stringByReplacingOccurrencesOfString:text withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange([plainData length] - [text length], [text length])];
                //NSLog(@"%@",plainData);
            }
            break;
        }
        else {
            
            [scanner setScanLocation:[scanner scanLocation] + 1];
        }
        //delimiter now equals to a start tag(such as <font size=30>) or end tag(such as </font>)
        
        
		NSString *delimiter = [NSString stringWithFormat:@"%@>", text];
		int position = [plainData rangeOfString:delimiter options:NSCaseInsensitiveSearch range:NSMakeRange(last_position, [plainData length] - last_position)].location;
        
		if (position != NSNotFound && position >= last_position)
		{
            isBeginTag = YES;
            beginTagCount++;
            //Only replace the string behind the position, so no need to
            //recalculate the position
            plainData = [plainData stringByReplacingOccurrencesOfString:delimiter withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(position, delimiter.length)];
		}
        else {//NOTE:This will never happen!
            //NSLog(@"Some Error happen in parsing");
            break;
            
        }
        
        //Strip the white space in both end
        NSString *tempString = [text substringFromIndex:1];
		text = [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        
        //That means a end tag, we should store the plain text after parsing the tag
		if ([text rangeOfString:@"/"].location==0)
		{
            isBeginTag = NO;
            beginTagCount --;
			// tag name
            
            //This can handle the awful white space too
            NSArray *textComponents = [[text substringFromIndex:1]componentsSeparatedByString:@" "];
            
            
			tag = [textComponents objectAtIndex:0];
			
			//NSLog(@"end of tag: %@", tag);
			
            NSRange subRange;
            //Decipher
            do {
                subRange = [plainData rangeOfString:@"&lt;" options:NSCaseInsensitiveSearch range:NSMakeRange(last_position, position - last_position)];
                if (subRange.location == NSNotFound) {
                    break;
                }
                plainData = [plainData stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<" options:NSCaseInsensitiveSearch range:subRange];
                //Length of @"&lt;" substract length of @"<"
                position -= 3;
            }
            while (true);
            do {
                subRange = [plainData rangeOfString:@"&gt;" options:NSCaseInsensitiveSearch range:NSMakeRange(last_position, position - last_position)];
                if (subRange.location == NSNotFound) {
                    break;
                }
                plainData = [plainData stringByReplacingOccurrencesOfString:@"&gt;" withString:@">" options:NSCaseInsensitiveSearch range:subRange];
                //Length of @"&gt;" substract length of @">"
                position -= 3;
            }
            while (true);
            
            //Find the latest tag
            //Do not use stack, because the overlapping tags are meaningful
            //This algrithm can handle the overlapping tags
            for (int i=[components count]-1; i>=0; i--)
            {
                RTHtmlComponent *component = [components objectAtIndex:i];
                if (!component.isClosure && [component.tagLabel isEqualToString:tag])
                {
                    NSString *text2 = [plainData substringWithRange:NSMakeRange(component.position, position - component.position)];
                    component.text = text2;
                    component.isClosure = YES;
                    break;
                }
            }
			
			
			
		}
		else // start tag
		{
			//tag name and tag attributes
            //These words can handle if the tag is a self-closed one
            BOOL isClosure = NO;
            NSRange range = [text rangeOfString:@"/" options:NSBackwardsSearch];
            
            if (range.location == [text length] - 1) {
                isClosure = YES;
                text = [text substringToIndex:[text length] - 1];
            }
            RTHtmlComponent *component = nil;
            //These words can handle if the attribute string are concacted with awful white space
            NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
            NSRange subRange;
            //You can not simply use text = [text stringByReplacingOccurrencesOfString:@"= " withString:@"="]; instead,
            //since this function can not execute incursively
            do{
                subRange = [text rangeOfString:@"= "];
                if (subRange.location == NSNotFound) {
                    break;
                }
                text = [text stringByReplacingOccurrencesOfString:@"= " withString:@"=" options:NSCaseInsensitiveSearch range:subRange];
                
            }while(true);
            
            do{
                subRange = [text rangeOfString:@" ="];
                if (subRange.location == NSNotFound) {
                    break;
                }
                text = [text stringByReplacingOccurrencesOfString:@" =" withString:@"=" options:NSCaseInsensitiveSearch range:subRange];
                
            }while(true);
            
            
            NSArray *textComponents = [text componentsSeparatedByString:@" "];
            
            
			tag = [textComponents objectAtIndex:0];
            
            if (tag != nil && [tag length]) { //That means the tag starts with a white space, ignore it, treat it as a raw text
                
                //modifyed by titantse
                if([tag isEqualToString:@"span"])
                {
                    NSString *stylestr=[text substringFromIndex:[text rangeOfString:@"style"].location];
                    NSArray *stylekeyvalue=[stylestr componentsSeparatedByString:@"="];
                    NSString *value=[stylekeyvalue objectAtIndex:1];
                    [attributes setObject:[value substringWithRange:NSMakeRange(1, value.length-2)] forKey:[stylekeyvalue objectAtIndex:0]];
                    component = [RTHtmlComponent componentWithString:nil tag:tag attributes:attributes];
                }
                else{
                    for (int i=1; i<[textComponents count]; i++)
                    {
                        //NSLog(@"textComponents %d:%@",i,[textComponents objectAtIndex:i]);
                        
                        NSArray *pair = [[textComponents objectAtIndex:i] componentsSeparatedByString:@"="];
                        if ([pair count]>=2)
                        {
                            [attributes setObject:[[pair subarrayWithRange:NSMakeRange(1, [pair count] - 1)] componentsJoinedByString:@"="] forKey:[pair objectAtIndex:0]];
                        }
                    }
                    component = [RTHtmlComponent componentWithString:nil tag:tag attributes:attributes];
                }
            }
            else {
                component = [RTHtmlComponent componentWithString:nil tag:@"rawText" attributes:attributes];
            }
			//如果component 是span，则换成img by titantse
            if([component.tagLabel isEqualToString:@"span"])
            {
                //deal with width,height,url,off x,y
                NSString *style=[component.attributes objectForKey:@"style"];
                NSArray *styles=[style componentsSeparatedByString:@";"];
                [component.attributes setObject:[NSNumber numberWithBool:true] forKey:@"isspan"];
                //extract width ,height, background url, offx,offy
                NSString *regex=@"/width\s*=<\S+?>\)/";
                
                for(NSString * ss in styles)
                {
                    int p=[ss rangeOfString:@":"].location;
                    if(p!=NSNotFound)
                    {
                        NSString *key=[[ss substringToIndex:p] lowercaseString];
                        NSString *value=[ss substringFromIndex:p+1];
                        if([key isEqualToString:@"width"] || [key isEqualToString:@"height"])
                        {
                            NSString *numvalue=[value substringToIndex:[value rangeOfString:@"px"].location];
                            [component.attributes setObject:numvalue forKey:key];
                        }
                        if([key isEqualToString:@"background"])
                        {
                            NSArray *values=[value componentsSeparatedByString:@" "];
                            NSString *text=[values objectAtIndex:0];
                            int http_start=4;//[text rangeOfString:@"http"].location;
                            NSString *url=[text substringWithRange:NSMakeRange(http_start, text.length-http_start-1)];
                            [component.attributes setObject:url forKey:@"src"];
                            text=[values objectAtIndex:2];
                            [component.attributes setObject: [text substringToIndex:[text rangeOfString:@"px"].location] forKey:@"offx"];
                            text=[values objectAtIndex:3];
                            [component.attributes setObject: [text substringToIndex:[text rangeOfString:@"px"].location] forKey:@"offy"];
                        }
                    }
                }
                [component.attributes setObject:[NSNumber numberWithBool:YES] forKey:@"ishttp"];
                
                component.tagLabel=@"img";
            }
            else if([component.tagLabel isEqualToString:@"img"])
            {
                NSString *src=[component.attributes objectForKey:@"src"];
                bool ishttp=false;
                if([src rangeOfString:@"http"].location!=NSNotFound)
                {
                    [component.attributes setObject:[NSNumber numberWithBool:YES] forKey:@"ishttp"];
                    ishttp=true;
                }
                if(ishttp)
                {
                    NSCharacterSet *set=[NSCharacterSet characterSetWithCharactersInString:@"\""];
                    NSString *imgwidth= [component.attributes objectForKey:@"imgwidth"];
                    NSString *imgheight=[component.attributes objectForKey:@"imgheight"];
                    
                    if(imgwidth==nil)
                    {
                        imgwidth=@"100";
                        imgheight=@"100";
                    }
                    imgwidth=[imgwidth stringByTrimmingCharactersInSet:set];
                    imgheight=[imgheight stringByTrimmingCharactersInSet:set];
                    [component.attributes setObject:imgwidth forKey:@"width"];
                    [component.attributes setObject:imgheight forKey:@"height" ];
                }
                [component.attributes setObject:[HtmlParserAndHeightCalculator stripURL:src] forKey:@"src"];
            }
            
            if([component.tagLabel isEqualToString:@"img"] && [component.attributes objectForKey:@"ishttp"]!=nil)
            {
                
                NSString *width=[component.attributes objectForKey:@"width"];
                NSString *height=[component.attributes objectForKey:@"height"];
                CGRect rect=[[UIScreen mainScreen] bounds];
                //不是公式图，并且是docpick的，且超出屏幕范围，则拉伸
                if(![component.attributes objectForKey:@"isspan"] && ([width intValue]>rect.size.width|| [height intValue]>rect.size.height))
                {
                    float scale=[width intValue]>rect.size.width?rect.size.width/[width intValue]:rect.size.height/[height intValue];
                    width= [NSString stringWithFormat:@"%d",(int)(scale*[width intValue])];
                    height=[NSString stringWithFormat:@"%d",(int)(scale*[height intValue])];
                    [component.attributes setObject:width forKey:@"width"];
                    [component.attributes setObject:height forKey:@"height"];
                }
                NSString *parastr=[NSString stringWithFormat:@"?width=%@&height=%@",width,height];
                NSString *newurl= [[component.attributes objectForKey:@"src"] stringByAppendingString:parastr];
                if([component.attributes objectForKey:@"isspan"])
                {
                    newurl=[newurl stringByAppendingString:@"&isspan=1"];
                }
                [component.attributes setObject:[HtmlParserAndHeightCalculator stripURL:newurl] forKey:@"src"];
            }
            
            
			
            //Store the start position, which will be used to calculate
            //the plain text inside of a tag
			component.position = position;
            component.isClosure = isClosure;
            BOOL isSizeTooSmall = NO;
            if ([component.tagLabel isEqualToString:@"img"]) {
                
                NSString *url =  [component.attributes objectForKey:@"src"];
                /*NSString *inlineStyleWidth = [component.attributes objectForKey:@"width"];
                 NSString *inlineStyleHeight = [component.attributes objectForKey:@"height"];
                 */
                
                NSString *tempURL = url;
                if (tempURL) {
                    
                    //deleted by titantse
                }
                
                if (!isSizeTooSmall) {
                    
                    NSMutableString *tempString = [NSMutableString stringWithString:plainData];
                    [tempString insertString:@"`" atIndex:position];
                    
                    
                    plainData = [NSString stringWithString:tempString];
                    
                    component.text = [plainData substringWithRange:NSMakeRange(component.position, 1)];
                    component.isClosure = YES;
                    
                    [components addObject:component];
                }
                
            }
            else {
                [components addObject:component];
            }
            
			
            if ([component.tagLabel isEqualToString:@"a"]) {
                [linkComponents addObject:component];
            }
            if ([component.tagLabel isEqualToString:@"img"]) {
                [imgComponents addObject:component];
            }
		}
		
		last_position = position;
		text = nil;
	}
	
	
    for (RTHtmlComponent *item in components) {
        if (!item.isClosure) {
            
            NSString *text2 = [plainData substringWithRange:NSMakeRange(item.position, [plainData length] - item.position)];
            item.text = text2;
        }
        
    }
    
    RTHtmlComponentsStructure *componentsDS = [[RTHtmlComponentsStructure alloc] init];
    componentsDS.components = components;
    componentsDS.linkComponents = linkComponents;
    componentsDS.imgComponents = imgComponents;
    componentsDS.plainTextData = plainData;
    
    return [componentsDS autorelease];
}

+ (NSString*)stripURL:(NSString*)url {
    
    if([url rangeOfString:@"'"].location==0)
    {
        url=[url substringWithRange:NSMakeRange(1, url.length-2)];
    }
    
    NSString *tempURL = [url stringByReplacingOccurrencesOfRegex:@"^\\\\?[\"\']" withString:@""];
    tempURL = [tempURL stringByReplacingOccurrencesOfRegex:@"\\\\?[\"\']$" withString:@""];
    return tempURL;
}

@end
