//
//  PACharacter.m
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "PACharacter.h"

@implementation PACharacter
+ (instancetype)characterWithHealth:(NSUInteger)health
                            damage:(NSUInteger)dammage
                             weapon:(PAWeapon *)weapon
                              armor:(PAArmor *)armor{
  PACharacter *character = [[PACharacter alloc] init];
  if (character) {
    character.health = health;
    character.damage = dammage;
    character.weapon = weapon;
    character.armor = armor;
  }
  
  return character;
}
@end
