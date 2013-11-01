//
//  GMViewController.m
//  UIScrollView Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-21.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "GMImageViewController.h"

@interface GMImageViewController ()

@end

@implementation GMImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  _globalImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"worldMap.jpeg"]];
  _scrollView.contentSize = _globalImageView.frame.size;
  _scrollView.delegate = self;
  _scrollView.minimumZoomScale = 0.5;
  _scrollView.maximumZoomScale = 4.0;
  
  [_scrollView addSubview:_globalImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate  method

-(UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView{
  return _globalImageView;
}
@end
