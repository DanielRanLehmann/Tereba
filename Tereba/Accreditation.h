//
//  Accreditation.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"

@interface Accreditation : RLMObject

@property NSNumber <RLMInt> *index;
@property NSString *positionTypeName;

@property (readonly) NSString *name;
@property NSString *firstname;
@property NSString *lastname;
@property NSString *positionName;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Accreditation>
RLM_ARRAY_TYPE(Accreditation)
