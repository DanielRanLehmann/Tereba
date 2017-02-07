//
//  PriceGroup.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>
#import "Price.h"

@interface PriceGroup : RLMObject

@property NSString *name;
@property Price *price;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<PriceGroup>
RLM_ARRAY_TYPE(PriceGroup)
