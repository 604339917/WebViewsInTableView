//
//  ViewController.m
//  TableViewTest
//
//  Created by titantse MAC on 12/16/2013.
//  Copyright (c) 2013年 titantse. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    
}
@end

@implementation ViewController

@synthesize dataArray;
@synthesize tableView;


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataArray = [[NSMutableArray array] init];
    
    NSMutableDictionary *row19 = [NSMutableDictionary dictionary];
    [row19 setObject:@"的铁丝分为两部分每一部分均弯曲成一个正方形这里全部都是中文字体看看中文字体几个" forKey:@"text"];
    [self.dataArray addObject:row19];
    
    [self.tableView setSeparatorColor:[UIColor redColor]];
    
    
    /*NSMutableDictionary *row21 = [NSMutableDictionary dictionary];
     [row21 setObject:@"<font size = 20>Which browser is the best?</font>\n<img src='firefox.jpg'>Firefox<a href='http://windows.microsoft.com/en-US/internet-explorer/products/ie/home'><img src='ie.jpg'>IE</a><a href='http://www.chrome.com'><img src='chrome.jpg'>Chrome</a><a href='http://www.apple.com/safari'><img src='safari.png'>Safari</a>" forKey:@"text"];
     [self.dataArray addObject:row21];
    */
    /*
     NSMutableDictionary *row22 = [NSMutableDictionary dictionary];
     [row22 setObject:@"<font size = 20>Images with different sizes</font>\n<img src='dynamic.gif'><img src='http://cn.bing.com/fd/s/a/k_zh_cn_s2.png' ><img src='ThumbNail.ashx.jpeg'><br/><span class=\"exerimg\" style=\"display:inline-block;width:51px;height:15px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s_r.png) no-repeat -6px -0px;\"></span>" forKey:@"text"];
     [self.dataArray addObject:row22];
     */
     
     NSMutableDictionary *row1 = [NSMutableDictionary dictionary];
     NSString *rowstr=@"把一根长<span class=\"exerimg\" style=\"display:inline-block;width:46px;height:12px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/091/555/000091555_s.png) no-repeat -0px -0px;\"></span>的铁丝分为两部分,每一部分均弯曲成一个正方形,它们的面积和最小是_________<span class=\"exerimg\" style=\"display:inline-block;width:27px;height:16px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/091/555/000091555_s_r.png) no-repeat -82px -0px;\"></span>.<br/>";
     
     //rowstr=[rowstr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
     //rowstr=[rowstr stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
     [row1 setObject:rowstr forKey:@"text"];
     [self.dataArray addObject:row1];
    
    NSMutableDictionary *row2 = [NSMutableDictionary dictionary];
    NSString *newstr=@"求证:<span class=\"exerimg\" style=\"display:inline-block;width:239px;height:34px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s.png) no-repeat -107px -0px;\"></span>.<img class=\"docpic\" src=\"http://next.qiujieda.com:8080/img/docpic/000/501/docpic000501958.png\" imgwidth=\"141\" imgheight=\"114\"/><br/>证明:在<span class=\"exerimg\" style=\"display:inline-block;width:48px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s.png) no-repeat -346px -0px;\"></span>中有<span class=\"exerimg\" style=\"display:inline-block;width:99px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s_r.png) no-repeat -394px -0px;\"></span><br/>在<span class=\"exerimg\" style=\"display:inline-block;width:49px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s.png) no-repeat -493px -0px;\"></span>中有_________,<br/>在<span class=\"exerimg\" style=\"display:inline-block;width:51px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s.png) no-repeat -645px -0px;\"></span>中有_________,<br/>在<span class=\"exerimg\" style=\"display:inline-block;width:13px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s.png) no-repeat -800px -0px;\"></span>_________中有_________,<br/><span class=\"exerconnectionimg\" style=\"display:inline-block;width:11px;height:10px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s.png) no-repeat -947px -0px;\"></span><span class=\"exerimg\" style=\"display:inline-block;width:400px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s_r.png) no-repeat -958px -0px;\"></span><br/>即:_________,<br/>即:<span class=\"exerimg\" style=\"display:inline-block;width:239px;height:34px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/375/953/000375953_s.png) no-repeat -1646px -0px;";
    //newstr=[newstr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    //newstr=[newstr stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    [row2 setObject:newstr forKey:@"text"];
    [self.dataArray addObject:row2];
    
    
    
     NSString *str2=@"下列事件中,发生的可能性为<span class=\"exerimg\" style=\"display:inline-block;width:6px;height:11px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s_r.png) no-repeat -0px -0px;\"></span>的是(       )<br/>A、若<span class=\"exerimg\" style=\"display:inline-block;width:51px;height:15px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s.png) no-repeat -6px -0px;\"></span>,则<span class=\"exerimg\" style=\"display:inline-block;width:35px;height:13px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s.png) no-repeat -57px -0px;\"></span><br/>B、若<span class=\"exerimg\" style=\"display:inline-block;width:35px;height:13px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s.png) no-repeat -92px -0px;\"></span>,则<span class=\"exerimg\" style=\"display:inline-block;width:51px;height:15px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s.png) no-repeat -127px -0px;\"></span><br/>C、掷一枚均匀的骰子,<span class=\"exerimg\" style=\"display:inline-block;width:8px;height:12px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s.png) no-repeat -178px -0px;\"></span>点朝上<br/>D、射击时,射中<span class=\"exerimg\" style=\"display:inline-block;width:15px;height:12px;background:url(http://qiujieda.xicp.net:9999/qiujieda/resources/image/jmath/mixtexpic/000/000/036/000000036_s.png) no-repeat -186px -0px;\"></span>环<br/>";
     
     //str2=[str2 stringByReplacingOccurrencesOfString:@"\"" withString:@""];
     //str2=[str2 stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
     
     NSMutableDictionary *row4 = [NSMutableDictionary dictionary];
     [row4 setObject:str2 forKey:@"text"];
     [self.dataArray addObject:row4];

    NSMutableDictionary *row5=[NSMutableDictionary dictionary];
    [row5 setObject:@"已知<span class=\"exerimg\" style=\"display:inline-block;width:47px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/345/988/000345988_s.png) no-repeat -0px -0px;\"></span>,求代数式<span class=\"exerimg\" style=\"display:inline-block;width:42px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/345/988/000345988_s_r.png) no-repeat -47px -0px;\"></span>的值.<br/>" forKey:@"text"];
    
    [self.dataArray addObject:row5];
    
    
    NSMutableDictionary *row6=[NSMutableDictionary dictionary];
    [row6 setObject:@"已知<span class=\"exerimg\" style=\"display:inline-block;width:14px;height:9px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -0px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:9px;height:9px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -14px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:10px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -23px -0px;\"></span>为正整数,<span class=\"exerimg\" style=\"display:inline-block;width:40px;height:10px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -33px -0px;\"></span>.设<span class=\"exerimg\" style=\"display:inline-block;width:63px;height:14px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -73px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:46px;height:14px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -136px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:48px;height:19px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -182px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:12px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -230px -0px;\"></span>为坐标原点.若<span class=\"exerimg\" style=\"display:inline-block;width:86px;height:15px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -242px -0px;\"></span>,且<span class=\"exerimg\" style=\"display:inline-block;width:256px;height:17px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s_r.png) no-repeat -328px -0px;\"></span>.<br/><span class=\"exerconnectionimg\" style=\"display:inline-block;width:16px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -584px -0px;\"></span>证明:<span class=\"exerimg\" style=\"display:inline-block;width:89px;height:15px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -600px -0px;\"></span>;<br/><span class=\"exerconnectionimg\" style=\"display:inline-block;width:16px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -689px -0px;\"></span>求图象经过<span class=\"exerimg\" style=\"display:inline-block;width:12px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -705px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -717px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/567/532/000567532_s.png) no-repeat -728px -0px;\"></span>三点的二次函数的解析式.<br/>" forKey:@"text"];
    [self.dataArray addObject:row6];
    
    
    NSMutableDictionary *row7=[NSMutableDictionary dictionary];
    [row7 setObject:@"已知抛物线<span class=\"exerimg\" style=\"display:inline-block;width:187px;height:35px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -0px -0px;\"></span>与<span class=\"exerimg\" style=\"display:inline-block;width:9px;height:9px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -187px -0px;\"></span>轴交于<span class=\"exerimg\" style=\"display:inline-block;width:52px;height:14px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -196px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:112px;height:14px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -248px -0px;\"></span>两点,与<span class=\"exerimg\" style=\"display:inline-block;width:10px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -360px -0px;\"></span>轴交于点<span class=\"exerimg\" style=\"display:inline-block;width:45px;height:15px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -370px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:12px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -415px -0px;\"></span>为原点.<br/><span class=\"exerconnectionimg\" style=\"display:inline-block;width:16px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -427px -0px;\"></span>求<span class=\"exerimg\" style=\"display:inline-block;width:14px;height:9px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -443px -0px;\"></span>的取值范围;<br/><span class=\"exerconnectionimg\" style=\"display:inline-block;width:16px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -457px -0px;\"></span>若<span class=\"exerimg\" style=\"display:inline-block;width:49px;height:35px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -473px -0px;\"></span>,且<span class=\"exerimg\" style=\"display:inline-block;width:109px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s_r.png) no-repeat -522px -0px;\"></span>,求抛物线解析式及<span class=\"exerimg\" style=\"display:inline-block;width:12px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -631px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -643px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -654px -0px;\"></span>的坐标;<br/><span class=\"exerconnectionimg\" style=\"display:inline-block;width:16px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -665px -0px;\"></span>在<span class=\"exerconnectionimg\" style=\"display:inline-block;width:16px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -681px -0px;\"></span>情形下,点<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -697px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:12px;height:15px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -708px -0px;\"></span>分别从<span class=\"exerimg\" style=\"display:inline-block;width:12px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -720px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:12px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -732px -0px;\"></span>两点同时出发(如图)以相同的速度沿<span class=\"exerimg\" style=\"display:inline-block;width:22px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -744px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:23px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -766px -0px;\"></span>向<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -789px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -800px -0px;\"></span>运动,连接<span class=\"exerimg\" style=\"display:inline-block;width:23px;height:15px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -811px -0px;\"></span>与<span class=\"exerimg\" style=\"display:inline-block;width:23px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -834px -0px;\"></span>交于<span class=\"exerimg\" style=\"display:inline-block;width:16px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -857px -0px;\"></span>,设<span class=\"exerimg\" style=\"display:inline-block;width:49px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -873px -0px;\"></span>,问是否存在<span class=\"exerimg\" style=\"display:inline-block;width:9px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -922px -0px;\"></span>值,使以<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -931px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:11px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -942px -0px;\"></span>,<span class=\"exerimg\" style=\"display:inline-block;width:16px;height:11px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -953px -0px;\"></span>为顶点的三角形与<span class=\"exerimg\" style=\"display:inline-block;width:47px;height:12px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -969px -0px;\"></span>相似,若存在,求所有<span class=\"exerimg\" style=\"display:inline-block;width:9px;height:13px;background:url(http://next.qiujieda.com:8080/img/mixtexpic/000/007/004/000007004_s.png) no-repeat -1016px -0px;\"></span>值;若不存在,请说明理由.<br/><img class=\"docpic\" src=\"http://next.qiujieda.com:8080/img/docpic/000/005/docpic000005051.png\"/><br/>" forKey:@"text"];
    [self.dataArray addObject:row7];
     /*
        [self.dataArray addObject:row2];
         [self.dataArray addObject:row4];
        [self.dataArray addObject:row2];
         [self.dataArray addObject:row4];
    */
     /*
     NSMutableDictionary *row5 = [NSMutableDictionary dictionary];
     [row5 setObject:@"<font size=20 stroke=1>Text with strokes</font> " forKey:@"text"];
     [self.dataArray addObject:row5];
     
     NSMutableDictionary *row6 = [NSMutableDictionary dictionary];
     [row6 setObject:@"<font size=20 kern=35>KERN</font> " forKey:@"text"];
     [self.dataArray addObject:row6];
     
     NSMutableDictionary *row7 = [NSMutableDictionary dictionary];
     [row7 setObject:@"<font size=14><p align=justify><font color=red>JUS<font color=red>T</font>IFY</font> It’s been almost a decade since the publication of “Moneyball,”</p>\n <p align=left><font color=red>LEFT ALIGNED</font>  Michael Lewis’s famous book-turned-movie about how the small-market Oakland Athletics used statistical artistry to compete against their (much) richer rivals. </p>\n<p align=right><font color=red>RIGHT ALIGNED</font> Billy Beane is still the A’s general manager, but here’s a modest proposal for his next act.</p>\n<p align=center><font color=red>CENTER ALIGNED</font> He could become the head of another budget-strapped sports organization like, say, the Olympic Committee of Kyrgyzstan — or another small-market country with limited resources. Bishkek is nice this time of year!</p></font> " forKey:@"text"];
     [self.dataArray addObject:row7];
     
     NSMutableDictionary *row20 = [NSMutableDictionary dictionary];
     [row20 setObject:@"<p indent=20>Indented bla bla bla bla bla bla bla bla bla bla bla bla bla</p>" forKey:@"text"];
     [self.dataArray addObject:row20];
    */
  }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataArray count];
}


//新建某一行并返回
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier"; 
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: 
                             TableSampleIdentifier]; 
    if (cell == nil) { 
        cell = [[[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:TableSampleIdentifier]autorelease];
        
    }
    NSMutableDictionary *dict=[dataArray objectAtIndex:indexPath.row];
    
    float height_value=[self cellHeight:indexPath.row] ;
    
    UIWebView *webview=[[UIWebView alloc] initWithFrame:CGRectMake(0,0,320, height_value)];
    [webview loadHTMLString:[dict objectForKey:@"text"] baseURL:nil];
    UIScrollView *scroller = [webview.subviews objectAtIndex:0];
    if (scroller) {
        scroller.bounces = NO;
        scroller.alwaysBounceVertical = NO;
        scroller.scrollEnabled = YES;
    }
    [[cell contentView] addSubview:webview];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    CGRect rect=cell.frame;
    rect.size.height=height_value+5;
    rect.size.width=320;
    cell.frame=rect;
	return cell;
}

-(float)cellHeight:(NSInteger *) index
{
    NSMutableDictionary *rowInfo = [self.dataArray objectAtIndex:index];
	if ([rowInfo objectForKey:@"cell_height"])
	{
		return [[rowInfo objectForKey:@"cell_height"] floatValue];
	}
	else
	{
        NSString *dataStr=[rowInfo objectForKey:@"text"];
        dataStr=[dataStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        RTHtmlComponentsStructure *componentsHtml=[HtmlParserAndHeightCalculator extractTextStyle:dataStr];
        CGSize size= [HtmlParserAndHeightCalculator calculateHeightQJD:componentsHtml];
        
        NSLog(@"cellHeight:%d width:%f, height:%f ",index, size.width,size.height);
        
        [rowInfo setObject:[NSNumber numberWithFloat:size.height + 8] forKey:@"cell_height"];
		return [[rowInfo objectForKey:@"cell_height"] floatValue];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellHeight:indexPath.row];
}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *rowInfo=[self.dataArray objectAtIndex:indexPath.row];
    NSLog(@"selected :%d , height:%f", indexPath.row, [[rowInfo objectForKey:@"cell_height"] floatValue]);
    
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.listData = nil;
    self.listData2 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
