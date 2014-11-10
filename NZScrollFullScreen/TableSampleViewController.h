//
//  TableSampleViewController.h
//  NZScrollFullScreen
//
//  Created by Anonymous on 11/10/14.
//  Copyright (c) 2014 Nazrin Almi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableSampleViewController : UIViewController <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UINavigationBarDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrolly;
@property (strong, nonatomic) IBOutlet UITableView *tableLoad;

@end
