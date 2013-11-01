//
//  GMViewController.h
//  UIScrollView Challenge Solution
//
//  Created by Guillaume Maka on 2013-10-21.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMImageViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic) UIImageView *globalImageView;
@end
