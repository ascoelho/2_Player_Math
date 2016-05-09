//
//  Player.m
//  Two Player Math Game
//
//  Created by Anthony Coelho on 2016-05-09.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithPlayerNumber:(int)playerNumber{
    
    self = [super init];
    if (self) {
        _numberOfLives = 3;
        _playerNumber = playerNumber;
    }
    return self;
}

-(void)loseALife {
    
    self.numberOfLives -=1;
}

@end
