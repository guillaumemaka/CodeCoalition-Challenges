//
//  PAArmor.h
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
//! PAArmor describes the representùation of a armor in the game
@interface PAArmor : NSObject
//! Store the name of the armor
@property (strong, nonatomic) NSString *name;
//! Store the health of the armor
@property (nonatomic) NSUInteger health;

/*! Convenience method for creating a armor
 \param name the name of the armor
 \param health the health of the armor
 \returns a PAArmor object
 */
+(instancetype) armorWithName:(NSString*) name health:(NSUInteger) health;
@end
