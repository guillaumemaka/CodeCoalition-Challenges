//
//  PAViewController.m
//  Pirate Adventure
//
//  Created by Guillaume Maka on 2013-10-09.
//  Copyright (c) 2013 G.Maka Ltd. All rights reserved.
//

#import "PAViewController.h"
#import "PACharacter.h"
#import "PAFactory.h"
#import "PATile.h"

@interface PAViewController ()
//! Store the current position of the player on the board
@property (nonatomic) CGPoint currentPosition;
//! Store the current player
@property (strong, nonatomic) PACharacter *player;
//! Store a PAFacroty object
@property (strong, nonatomic) PAFactory *factory;
//! Store all tile of the game
@property (strong, nonatomic) NSArray *tiles;

/*! Setup the game
 */
-(void) setUp;

//! Update the UI
-(void) updateUI;

/*! Check if we can move to a point on the board
 \param destination point from where we want to move
 \returns A Boolean YES if we can move, NO if we can't
 */
-(BOOL) canMoveToPoint:(CGPoint) point;

/*! Update the character stats 
 \params health the new health of the character
 \param samage the new damage of the character
 \param tile the current tile
 */
-(void) updateCharacterStatsWithHealth:(int) health
                          damage:(int) damage
                          tile:(PATile*) tile;

/*! Retrieve a tile for a given position
 \param point the coordinate of a tile
 \returns A PATile object
 */
- (PATile *)tileAtPoint:(CGPoint) point;
@end

@implementation PAViewController

#pragma mark - PAViewController Life Cycle

- (BOOL)prefersStatusBarHidden{
  return YES;
}

- (void)setUp
{
  _factory = [[PAFactory alloc] init];
  _tiles = [_factory tiles];
  _player = [_factory character];
  _currentPosition = CGPointMake(0, 0);

}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self setUp];
  [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (PATile *)tileAtPoint:(CGPoint) point {
  PATile* tile = (PATile*) _tiles[(int)point.x ][(int)point.y];
  return tile;
}

- (IBAction)buttonActionPressed:(UIButton *) sender {
  PATile *tile;
  tile = [self tileAtPoint:_currentPosition];
  
  [self updateCharacterStatsWithHealth:0 damage:0 tile:tile];
  [self updateUI];
}

- (IBAction)buttonResetGamePressed:(UIButton *) sender{
  [self setUp];
  [self updateUI];
}

- (IBAction)moveToNorth {
  _currentPosition.y -= 1.0;
  [self updateUI];
}

- (IBAction)moveToEast{
  _currentPosition.x += 1.0;
  [self updateUI];
}

- (IBAction)moveToSouth{
  _currentPosition.y += 1.0;
  [self updateUI];
}

- (IBAction)moveToWest{
  _currentPosition.x -= 1.0;
  [self updateUI];
}
#pragma mark - UI management

- (void)updateUI{
  PATile* tile = [self tileAtPoint:_currentPosition];
  
  _backgroundImage.image = tile.backgroundImage;
  _healthLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)_player.health];
  _damageLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long) _player.damage];
  _weaponLabel.text = _player.weapon.name;
  _armorLabel.text = _player.armor.name;
  [_actionButton setTitle:tile.buttonActionTitle forState:UIControlStateNormal];
  _storyLabel.text = tile.story;
  
  _northButton.hidden = ![self canMoveToPoint:CGPointMake(_currentPosition.x, _currentPosition.y - 1 )];
  _eastButton.hidden = ![self canMoveToPoint:CGPointMake(_currentPosition.x + 1 , _currentPosition.y )];
  _southButton.hidden = ![self canMoveToPoint:CGPointMake(_currentPosition.x, _currentPosition.y + 1 )];
  _westButton.hidden = ![self canMoveToPoint:CGPointMake(_currentPosition.x - 1, _currentPosition.y )];
}

#pragma mark - Game logic

- (BOOL)canMoveToPoint:(CGPoint) point {
  BOOL canMove = NO;
  if (point.y >= 0 &&
      point.x >= 0 &&
      point.y < [_tiles[(int)_currentPosition.x] count] &&
      point.x < [_tiles count] ) {
    canMove = YES;
  }
  return canMove;
}

- (void)updateCharacterStatsWithHealth:(int)health
                                damage:(int)damage
                                  tile:(PATile *)tile {
  if (tile.armor != nil) {    
    // Check for negative health assignement
    _player.health = (_player.health - _player.armor.health + tile.armor.health > 0) ? _player.health - _player.armor.health + tile.armor.health : 0;
    _player.armor = tile.armor;
  }else if (tile.weapon != nil){
    // Check for negative damage assignement
    _player.damage = (_player.damage - _player.damage + tile.weapon.damage  > 0) ? _player.damage - _player.damage + tile.weapon.damage : 0;
    _player.weapon = tile.weapon;
  }
//  }else if (effect != 0){
//    _player.health = _player.health - effect;
//  }
}
@end
