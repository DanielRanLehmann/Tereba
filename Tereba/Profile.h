//
//  Profile.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/20/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"

@interface Profile : RLMObject

@property NSString *value;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Profile>
RLM_ARRAY_TYPE(Profile)
