//
//  CardMatchingGame.h
//  Matchcard
//
//  Created by Junjie Su on 5/10/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@property (nonatomic, readwrite) BOOL threeCardGame;

@property (strong, nonatomic) NSString *message;
@end
