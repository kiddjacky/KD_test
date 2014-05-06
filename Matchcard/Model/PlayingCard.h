//
//  PlayingCard.h
//  Matchcard
//
//  Created by Junjie Su on 4/28/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger)maxRank;

@end
