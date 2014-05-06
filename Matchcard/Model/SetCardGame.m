//
//  SetCardGame.m
//  Matchcard
//
//  Created by Junjie Su on 5/23/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "SetCardGame.h"

@implementation SetCardGame

/*
-(void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable) {
        if(!card.isFaceUp) {
            NSArray *prevCards = @[];
            for (Card *otherCard in self.card) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    prevCards = [prevCards arrayByAddingObject:otherCard];
                }
            }
            if (prevCards.count == 2) {
                int matchScore = [card match:prevCards];
                Card *card1 = [prevCards objectAtIndex:0];
                Card *card2 = [prevCards lastObject];
                if (matchScore) {
                    card1.
                }
            }
        }
    }
}
*/

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    
    self.threeCardGame = 1;
    
    return self;
}


@end
