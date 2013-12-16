//
//  TableCellWebView.m
//  TableViewTest
//
//  Created by qiujieda on 12/15/13.
//  Copyright (c) 2013 x. All rights reserved.
//

#import "TableCellWebView.h"
#import "ViewController.h"

@implementation TableCellWebView
@synthesize webView;
@synthesize content;
@synthesize tcdelegate;
@synthesize contentHeight;
@synthesize index;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        webView = [[UIWebView alloc] initWithFrame:frame];
        webView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void) setContent:(int) index contentHtml:(NSString *)contentHtml
{
    self.content=contentHtml;
    self.index=index;
    [webView loadHTMLString:content baseURL:nil];
    UIScrollView *scroller = [webView.subviews objectAtIndex:0];
    if (scroller) {
        scroller.bounces = NO;
        scroller.alwaysBounceVertical = NO;
        scroller.scrollEnabled = YES;
    }
    
    webView.delegate = self;
    [self addSubview:webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)_webView {
    if (_webView.loading)
        return;
    
   // NSLog(@"height: %@", [_webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]);
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.fontSize= 16"];
    contentHeight = [[_webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] intValue];
    contentHeight= contentHeight+10;
    //调整webview大小
    CGSize actualSize = [webView sizeThatFits:CGSizeZero];
    CGRect newFrame = webView.frame;
    
    newFrame.size.height = actualSize.height;
    
    //webView.frame = newFrame;
    
    if(tcdelegate !=Nil)
    {
        [tcdelegate setHeadViewFrame:contentHeight index:index];
    }
    
}

- (void)dealloc {
    //    [newsModel release];
    [webView release];
    [super dealloc];
}

@end
