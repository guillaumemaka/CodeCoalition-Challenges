//
//  PAWeapon.h
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
//! PAWeapon describes the representùation of weapon in the game
@interface PAWeapon : NSObject
//! Store the name of the weapon
@property (strong, nonatomic) NSString *name;
//! Store the damage of the weapon
@property (nonatomic) NSUInteger damage;

/*! Convenience method for creating weapon
 \param name the name of the weaoon
 \param damage the damage of the weapon
 \returns a PAWeapon object
 */
+ (instancetype) weaponWithName:(NSString*)name damage:(NSUInteger) dammage;
@end
