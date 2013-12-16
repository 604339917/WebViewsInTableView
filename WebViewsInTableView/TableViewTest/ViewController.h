//
//  ViewController.h
//  TableViewTest
//
//  Created by titantse MAC on 12/16/2013.
//  Copyright (c) 2013年 titantse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HtmlParserAndHeightCalculator.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDelegate>
{
    NSMutableDictionary *tcWebViews;
    
}
@property(strong,nonatomic)NSArray *listData;
@property(strong,nonatomic)NSArray *listData2;
@property(strong,nonatomic)NSMutableArray *dataArray;
@property(strong,nonatomic) NSMutableDictionary *cell_height;
@property(nonatomic,retain) IBOutlet UITableView *tableView;

@end
