//
//  Venue.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"
#import "Show.h"

@interface Venue : RLMObject

@property NSString *code;
@property NSString *name;
// Location
@property (readonly) NSString *address;
@property NSString *street;
@property NSString *number;
@property NSString *letter;
@property NSString *floor;
@property NSString *side;
@property NSNumber <RLMInt> *postCode;
@property NSString *city;
@property NSString *countryCode;
@property NSString *countryName;
@property NSString *municipality;
@property NSString *region;
@property NSString *poBox;

@property NSNumber <RLMDouble> *lat;
@property NSNumber <RLMDouble> *lng;

@property NSString *mobile;
@property NSString *landline;
@property NSString *url;
@property NSString *email;
@property NSString *type;

@property RLMArray <Show> *shows;

@property NSNumber <RLMBool> *wardrobe;
@property NSNumber <RLMBool> *lift;
@property NSNumber <RLMBool> *wheelchairAccess;
@property NSNumber <RLMBool> *loopset;
@property NSNumber <RLMBool> *cafe;
@property NSNumber <RLMBool> *restaurant;
@property NSNumber <RLMBool> *parking;
@property NSNumber <RLMBool> *publicTransport;

@property (readonly) RLMLinkingObjects *event; // single or multiple?

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Venue>
RLM_ARRAY_TYPE(Venue)
