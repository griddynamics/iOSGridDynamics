//
//  IndexRequestHandler.m
//  Reindex
//
//  Created by Egor Zubkov on 5/27/16.
//  Copyright © 2016 Egor Zubkov. All rights reserved.
//

#import "IndexRequestHandler.h"

@implementation IndexRequestHandler

#pragma mark - CSSearchableIndexDelegate

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex
reindexAllSearchableItemsWithAcknowledgementHandler:(void (^)(void))acknowledgementHandler {
    // Reindex all data with the provided index
    acknowledgementHandler();
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex
reindexSearchableItemsWithIdentifiers:(NSArray <NSString *> *)identifiers acknowledgementHandler:(void (^)(void))acknowledgementHandler {
    // Reindex any items with the given identifiers and the provided index
    acknowledgementHandler();
}

// When on battery power, it is possible for indexing to slowed down to prevent battery drain.
// The developer may want to optionally implement these methods to receive notice that indexing
// is being throttled and react accordingly (e.g. by priortizing indexing of more important content).
- (void)searchableIndexDidThrottle:(CSSearchableIndex *)searchableIndex { }
- (void)searchableIndexDidFinishThrottle:(CSSearchableIndex *)searchableIndex { }

@end
