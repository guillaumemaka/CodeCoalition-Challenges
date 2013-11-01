//
//  PAArmor.m
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "PAArmor.h"

@implementation PAArmor
+(instancetype)armorWithName:(NSString *)name health:(NSUInteger)health{
  PAArmor *armor = [[PAArmor alloc] init];
  if (armor) {
    armor.name = name;
    armor.health = health;
  }
  return armor;
}
@end
