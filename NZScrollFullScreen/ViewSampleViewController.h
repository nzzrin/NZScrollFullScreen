//
//  ViewSampleViewController.h
//  NZScrollFullScreen
//
//  Created by Anonymous on 11/10/14.
//  Copyright (c) 2014 Nazrin Almi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewSampleViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrolly;
@property (weak, nonatomic) IBOutlet UILabel *subText;

@end
