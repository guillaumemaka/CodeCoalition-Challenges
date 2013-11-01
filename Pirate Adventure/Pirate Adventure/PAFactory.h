//
//  PAFactory.h
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-11.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACharacter.h"
//! PAFactory class provides convenience factories for the game
@interface PAFactory : NSObject
/*! Create a 3 * 4 tile for the game
 \return An NSArray of PATile object
*/
- (NSArray*) tiles;
/*! Create a default character for the game
 \returns A PACharacter object
 */
- (PACharacter*) character;
@end
