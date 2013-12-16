//
//  TableCellWebView.h
//  TableViewTest
//
//  Created by qiujieda on 12/15/13.
//  Copyright (c) 2013 x. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TableCellWebViewDelegate
- (void)setHeadViewFrame:(int)contentHeight index:(int)index;
@end

@interface TableCellWebView : UIView<UIWebViewDelegate>
{
    UIWebView *webView;
    NSString *content;
    id<TableCellWebViewDelegate> tcdelegate;
    int contentHeight;
    int index;
}

@property (nonatomic,retain) UIWebView *webView;
@property (nonatomic,retain) NSString *content;
@property (nonatomic,assign) id<TableCellWebViewDelegate> tcdelegate;
@property (nonatomic,assign) int contentHeight;
@property (nonatomic,assign) int index;

-(void) setContent:(int) index contentHtml:(NSString *)contentHtml;
@end
