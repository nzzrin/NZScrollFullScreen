//
//  TableSampleViewController.m
//  NZScrollFullScreen
//
//  Created by Anonymous on 11/10/14.
//  Copyright (c) 2014 Nazrin Almi. All rights reserved.
//

#import "TableSampleViewController.h"
#import "DetailViewController.h"

//IMPORT:
#import "UITabBarController+hidable.h"
#import <QuartzCore/QuartzCore.h>

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

@interface TableSampleViewController ()

@end

@implementation TableSampleViewController

{
    CGFloat startContentOffset;
    CGFloat lastContentOffset;
    BOOL hidden;
}

@synthesize scrolly,tableLoad;

- (void)viewWillDisappear:(BOOL)animated
{
    [self contract];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568.0f){
        
        UIImage * image = [UIImage imageNamed:@"navigationbar_background_tall@2x.png"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
    }else{
        
        UIImage * image = [UIImage imageNamed:@"navigationbar_background_tall@2x.png"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrolly.delegate = self;
    [scrolly setScrollEnabled:YES];
    
    if(IS_IPHONE_6){
        
        [scrolly setContentSize:CGSizeMake(280, 1900+64) ];
        scrolly.frame = CGRectMake(0, 0, 750, 1280+44);
        tableLoad.frame = CGRectMake(0, 0, 750, 1280+64);
        
    }else if(IS_IPHONE_6P){
        
        [scrolly setContentSize:CGSizeMake(280, 1920+64) ];
        scrolly.frame = CGRectMake(0, 0, 1080, 1280+44);
        tableLoad.frame = CGRectMake(0, 0, 1080, 1280+64);
        
    }else{
        [scrolly setContentSize:CGSizeMake(280, 1280+64) ];
        scrolly.frame = CGRectMake(0, 0, scrolly.frame.size.width, 568+44);
        tableLoad.frame = CGRectMake(0, 0, tableLoad.frame.size.width, 1280+64);
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - LOAD TABLE

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 21;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableLoad dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell: %ld", (long)indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:18.0];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *viewController = (DetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"detail"];
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:indexPath.row forKey:@"setInt"];
    [defaults synchronize];
    
}

#pragma mark - LOAD SCROLL FULL SCREEN

-(void)expand
{
    if(hidden)
        return;
    
    hidden = YES;
    
    [self.tabBarController setTabBarHidden:YES
                                  animated:YES];
    
    [self.navigationController setNavigationBarHidden:YES
                                             animated:YES];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

-(void)contract
{
    if(!hidden)
        return;
    
    hidden = NO;
    
    [self.tabBarController setTabBarHidden:NO
                                  animated:YES];
    
    [self.navigationController setNavigationBarHidden:NO
                                             animated:YES];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    startContentOffset = lastContentOffset = scrollView.contentOffset.y;
    //NSLog(@"scrollViewWillBeginDragging: %f", scrollView.contentOffset.y);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat currentOffset = scrollView.contentOffset.y;
    CGFloat differenceFromStart = startContentOffset - currentOffset;
    CGFloat differenceFromLast = lastContentOffset - currentOffset;
    lastContentOffset = currentOffset;
    
    
    
    if((differenceFromStart) < 0)
    {
        // scroll up
        if(scrollView.isTracking && (abs(differenceFromLast)>1))
            [self expand];
    }
    else {
        if(scrollView.isTracking && (abs(differenceFromLast)>1))
            [self contract];
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    [self contract];
    return YES;
}

@end
