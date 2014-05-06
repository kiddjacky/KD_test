//
//  SetCard.h
//  Matchcard
//
//  Created by Junjie Su on 5/23/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *pattern;
@property (strong, nonatomic) NSString *contents;
@property (nonatomic) NSUInteger number;
@property (nonatomic) NSUInteger color;
@property (nonatomic) NSUInteger shading;


+ (NSArray *) validPatterns;
+ (NSUInteger) maxNumber;
+ (NSUInteger) maxColor;
+ (NSUInteger) maxShading;


@end
