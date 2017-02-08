//
//  Composition.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface Composition : RLMObject

@property NSString *composer;
@property NSNumber <RLMInt> *yearOfPublication;
@property NSString *nationality;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Composition>
RLM_ARRAY_TYPE(Composition)
