//
//  PAFactory.m
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "PAFactory.h"
#import "PATile.h"

@interface PAFactory ()

@end
@implementation PAFactory
- (NSArray *) tiles{
  NSArray *tiles;
  PATile *tile1 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                   weapon:[PAWeapon weaponWithName:@"Buckler" damage:10]
                                   action:@"Take the starter"
                                    story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                    image:[UIImage imageNamed:@"PirateStart.jpg"]
          
                                    boss:nil];
  
  PATile *tile2 = [PATile tileWithArmor:[PAArmor armorWithName:@"Bottle of Rhum" health:50]
                                  weapon:nil
                                  action:@"Take a drink"
                                   story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                   image:[UIImage imageNamed:@"PiratePlank.jpg"]
                                    boss:nil];
  
  PATile *tile3 = [PATile tileWithArmor:[PAArmor armorWithName:@"Pirate Hat"
                                                        health:100]
                                 weapon:[PAWeapon weaponWithName:@"Grenadoes"
                                                         damage:10]
                                 action:@"Take the treasure"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateTreasure.jpeg"]
                                   boss:nil];
  
  PATile *tile4 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateTreasurer2.jpeg"]
                   
                                   boss:nil];
  
  PATile *tile6 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateWeapons.jpeg"]
                   
                                   boss:nil];
  
  PATile *tile7 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateOctopusAttack.jpg"]
                   
                                   boss:nil];
  PATile *tile8 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateShipBattle.jpeg"]
                   
                                   boss:nil];
  PATile *tile9 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateParrot.jpg"]
                   
                                   boss:nil];
  PATile *tile10 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateFriendlyDock.jpg"]
                                  boss:nil];
  
  PATile *tile11 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateBlackSmith.jpeg"]
                                   boss:nil];
  PATile *tile12 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateAttack.jpg"]
                                   boss:nil];
  
  PATile *tile13 = [PATile tileWithArmor:[PAArmor armorWithName:@"Shield Level 1" health:150]
                                 weapon:[PAWeapon weaponWithName:@"Sword Level 1" damage:10]
                                 action:@"Take the starter"
                                  story:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur lorem purus, dictum nec erat et, mollis vehicula tortor. Pellentesque vel massa viverra, venenatis enim sed, facilisis dui. Sed tincidunt viverra lectus"
                                  image:[UIImage imageNamed:@"PirateBoss.jpeg"]
                                   boss:nil];
  tiles = @[
            @[tile1,  tile2,  tile3,  tile4],
            @[tile6,  tile7,  tile8,  tile9],
            @[tile10, tile11, tile12, tile13]
            ];
  
  return tiles;
}

- (PACharacter *)character{
  return [PACharacter characterWithHealth:100
                                   damage:0
                                   weapon:[PAWeapon weaponWithName:@"Fists" damage:50]
                                    armor:[PAArmor armorWithName:@"Cloak" health:10]];
}

@end
