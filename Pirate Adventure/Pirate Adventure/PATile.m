//
//  PATile.m
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "PATile.h"

@implementation PATile
+ (instancetype)tileWithArmor:(PAArmor *)armor
                       weapon:(PAWeapon *)weapon
                       action:(NSString *)action
                        story:(NSString *)story
                        image:(UIImage *)image
                         boss:(PABoss *)boss{
  PATile *tile = [[PATile alloc] init];
  
  if (tile) {
    tile.armor = armor;
    tile.weapon = weapon;
    tile.boss = boss;
    tile.buttonActionTitle = action;
    tile.backgroundImage = image;
    tile.story = story;
  }
  
  return tile;
}
@end
