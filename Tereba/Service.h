//
//  Service.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/17/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface Service : RLMObject

@property NSString *value;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Service>
RLM_ARRAY_TYPE(Service)
