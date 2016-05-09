//
//  Player.h
//  Two Player Math Game
//
//  Created by Anthony Coelho on 2016-05-09.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int numberOfLives;
@property int playerNumber;
@property int playerAnswer;
@property BOOL myTurn;

-(void)loseALife;
-(instancetype)initWithPlayerNumber:(int)playerNumber;

@end
