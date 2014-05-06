//
//  PlayingCard.m
//  Matchcard
//
//  Created by Junjie Su on 4/28/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count ==1)
    {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit])
        {
            score = 1;
        }
        else if (otherCard.rank == self.rank)
        {
            score = 4;
        }
    }
    else if (otherCards.count == 2) {
        PlayingCard *card1 = [otherCards objectAtIndex:0];
        PlayingCard *card2 = [otherCards lastObject];
        if ([card1.suit isEqualToString:self.suit] && [card2.suit isEqualToString:self.suit])
        {
            score = 3;
        }
        else if ((card1.rank == self.rank) && (card2.rank == self.rank))
        {
            score = 9;
        }
            
    }
    return score;
}

@synthesize suit = _suit; //because we provide setter AND getter


+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}


+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


+ (NSUInteger) maxRank
{
    return [self rankStrings].count-1;
}


- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}


@end
