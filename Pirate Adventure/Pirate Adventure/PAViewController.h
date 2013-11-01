//
//  PAViewController.h
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-09.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
/*! PAViewController handle the pirate adventure game logic */
@interface PAViewController : UIViewController

#pragma mark - IBOutlet definition
//! outlet for the background image
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
//! outlet for the health label
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
//! outlet for the damage label
@property (weak, nonatomic) IBOutlet UILabel *damageLabel;
//! outlet for the weapon label
@property (weak, nonatomic) IBOutlet UILabel *weaponLabel;
//! outlet for the armor label
@property (weak, nonatomic) IBOutlet UILabel *armorLabel;

//! outlet for the action button
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
//! outlet for the north button
@property (weak, nonatomic) IBOutlet UIButton *northButton;
//! outlet for the east button
@property (weak, nonatomic) IBOutlet UIButton *eastButton;
//! outlet for the south button
@property (weak, nonatomic) IBOutlet UIButton *southButton;
//! outlet for the west button
@property (weak, nonatomic) IBOutlet UIButton *westButton;
//! outlet for the story label
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;

#pragma mark - IBAction definition

/*! Target when the button action is pressed
 \param sender The UIButton that was pressed
 */
- (IBAction)buttonActionPressed:(UIButton *)sender;

/*! Target when the button reset game is pressed
 \param sender The UIButton that was pressed
 */
- (IBAction)buttonResetGamePressed:(UIButton *)sender;

/*! Target when the north button is pressed
 */
- (IBAction)moveToNorth;

/*! Target when the east button is pressed
 */
- (IBAction)moveToEast;

/*! Target when the south button is pressed
 */
- (IBAction)moveToSouth;

/*! Target when the west button is pressed
 */
- (IBAction)moveToWest;

@end
