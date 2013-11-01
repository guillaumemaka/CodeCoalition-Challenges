//
//  PACharacter.h
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAWeapon.h"
#import "PAArmor.h"
//! The PACharacter describes the character of the game 
@interface PACharacter : NSObject
//! Store the health of the character
@property (nonatomic) NSUInteger health;
//! Store the damage of the character
@property (nonatomic) NSUInteger damage;
//! Store the current weapon of the character
@property (strong, nonatomic) PAWeapon *weapon;
//! Store the current armor of the character
@property (strong, nonatomic) PAArmor *armor;

/*! Convenience method for creating a character
 \param health the health of the character
 \param damage the damage of the character
 \param weapon the weapon of the character
 \param armor the armor of the character
 \returns a character object
 */
+(instancetype) characterWithHealth:(NSUInteger) health
                            damage:(NSUInteger) dammage
                             weapon:(PAWeapon*) weapon
                              armor:(PAArmor*) armor;
@end
