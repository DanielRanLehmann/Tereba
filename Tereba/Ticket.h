//
//  Ticket.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>
#import "PriceGroup.h"
@interface Ticket : RLMObject

@property NSString *code;
@property NSNumber <RLMBool> *ageRestrictionIndicator;
@property NSNumber <RLMBool> *volumeRestrictionIndicator;
@property NSString *name;
@property RLMArray <PriceGroup> *priceGroups;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<Ticket>
RLM_ARRAY_TYPE(Ticket)
