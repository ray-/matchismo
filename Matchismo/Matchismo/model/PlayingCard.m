//
//  PlayingCard.m
//  Matchismo
//
//  Created by Raymond Mendoza on 2013-02-15.
//  Copyright (c) 2013 Raymond Mendoza. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards {

    int score = 0;
    
    if (otherCards.count == 1) {
        PlayingCard * otherCard = [otherCards lastObject];
        if ([self.suit isEqualToString:otherCard.suit]) {
            score = 1;
        } else if (self.rank == otherCard.rank) {
            score = 4;
        }
    }
    return score;
}

- (NSString *) contents {
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString: self.suit];
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject: suit]) {
        _suit = suit;
    }
}

+ (NSArray *) validSuits {
    static NSArray * validSuits = nil;
    if (!validSuits) {
        validSuits = @[@"♥", @"♦", @"♠", @"♣"];
    }
    
    return validSuits;
}
            
+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [[PlayingCard rankStrings] count];
}

@end
