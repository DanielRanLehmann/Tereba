//
//  VenueInfo.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"

@interface VenueInfo : RLMObject

@property NSNumber <RLMBool> *wardrobe;
@property NSNumber <RLMBool> *lift;
@property NSNumber <RLMBool> *wheelchairAccess;
@property NSNumber <RLMBool> *loopset;
@property NSNumber <RLMBool> *cafe;
@property NSNumber <RLMBool> *restaurant;
@property NSNumber <RLMBool> *parking;
@property NSNumber <RLMBool> *publicTransport;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<VenueInfo>
RLM_ARRAY_TYPE(VenueInfo)
