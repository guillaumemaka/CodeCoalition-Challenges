//
//  PAWeapon.m
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "PAWeapon.h"

@implementation PAWeapon
+ (instancetype)weaponWithName:(NSString *)name damage:(NSUInteger)dammage {
  PAWeapon *weapon = [[PAWeapon alloc] init];
  if (weapon) {
    weapon.name = name;
    weapon.damage = dammage;
  }
  return weapon;
}
@end
