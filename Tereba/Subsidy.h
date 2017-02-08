//
//  Subsidy.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/20/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface Subsidy : RLMObject

@property NSString *value;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Subsidy>
RLM_ARRAY_TYPE(Subsidy)
