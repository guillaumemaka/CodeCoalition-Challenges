//
//  PATile.h
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAArmor.h"
#import "PAWeapon.h"
#import "PABoss.h"

/*! The PATile object describes a tile element on the board.
 */
@interface PATile : NSObject
//! Store the story for the tile
@property (strong, nonatomic) NSString *story;
//! Store the background image for the tile
@property (strong, nonatomic) UIImage *backgroundImage;
//! Store the action title of the tile
@property (strong, nonatomic) NSString *buttonActionTitle;
//! Store the armor equipment of the tile (Can be nill)
@property (strong, nonatomic) PAArmor *armor;
//! Store the weapon equipment of the tile (Can be nill)
@property (strong, nonatomic) PAWeapon *weapon;
//! Store the boss of the tile (Can be nill)
@property (strong, nonatomic) PABoss *boss;

/*! Convenience method for creating a tile
 \param armor the armor object of the tile (can be nill)
 \param weapon the weapon object of the (can be nill)
 \param action the action of the tile
 \param story the story of the tile
 \param image an UIImage representing the background of the tile
 \param boss the boss of the tile (can be nill)
 \returns a tile
 */
+ (instancetype) tileWithArmor:(PAArmor*) armor
                        weapon:(PAWeapon *) weapon
                        action:(NSString*) action
                         story:(NSString*) story
                         image:(UIImage*) image
                          boss:(PABoss*) boss;
@end
