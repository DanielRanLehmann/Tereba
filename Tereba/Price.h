//
//  Price.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface Price : RLMObject

@property NSNumber <RLMFloat> *value;
@property NSString *currency;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Price>
RLM_ARRAY_TYPE(Price)
