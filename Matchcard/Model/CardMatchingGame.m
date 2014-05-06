//
//  CardMatchingGame.m
//  Matchcard
//
//  Created by Junjie Su on 5/10/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
//@property (strong, nonatomic) NSMutableArray *prevCards;
@property (nonatomic) int score;

@end

@implementation CardMatchingGame

-(NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
/*
-(NSMutableArray *) prevCards
{
    if (!_prevCards) _prevCards = [[NSMutableArray alloc] init];
    return _prevCards;
}
*/
-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i=0; i<count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            }
            else {
                self.cards[i] = card;
            }
        }
    }
    self.message = nil;
    self.score = 0;
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENTALTY 2
#define MATCH_BOUNS 4


-(void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    BOOL pair = NO;
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            //create game logic
            //two card game logic
            if (!self.threeCardGame) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BOUNS;
                        self.message = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, otherCard.contents, matchScore*MATCH_BOUNS];
                    
                    }
                    else {
                        otherCard.faceUp = NO;
                        self.score -= FLIP_COST;
                        self.message = [NSString stringWithFormat:@"%@ & %@ don't matched! %d point penalty", card.contents, otherCard.contents, FLIP_COST];
                    }
                    pair = YES;
                    //break;
                }
            }
            if(!pair) {
                self.message = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            }
            }
            //three card game logic
            else {
                //self.prevCards = nil;
                NSArray *prevCards = @[];
                //loop through all card find upFace and playable cards
                for (Card *otherCard in self.cards) {
                    if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                        //push the card in array
                        prevCards = [prevCards arrayByAddingObject:otherCard];
                    }
                }
                //find 3 cards
                if (prevCards.count == 2) {
                    int matchScore = [card match:prevCards];
                    Card *card1 = [prevCards objectAtIndex:0];
                    Card *card2 = [prevCards lastObject];
                    if (matchScore) {
                        card1.unplayable = YES;
                        card2.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BOUNS;
                        self.message = [NSString stringWithFormat:@"Matched %@ & %@ & %@ for %d points", card.contents, card1.contents, card2.contents, matchScore*MATCH_BOUNS];
                    }
                    else {
                        card1.faceUp = NO;
                        self.score -= FLIP_COST;
                        self.message = [NSString stringWithFormat:@"%@ & %@ & %@ don't matched! %d point penalty", card.contents, card1.contents, card2.contents, FLIP_COST];
                    }
                }
                else {
                    self.message = [NSString stringWithFormat:@"Flipped up %@, %d", card.contents, prevCards.count];
                }
            }
            
        }
        card.faceUp = !card.isFaceUp;
    }
}


@end
