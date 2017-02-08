//
//  Organization.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>
#import "Contact.h" 
#import "Profile.h"
#import "Venue.h"
#import "Subsidy.h"
#import "Description.h"

@interface Organization : RLMObject

@property NSString *code;
@property NSString *name;
@property NSString *careOf;

@property NSString *coverPhotoUrl;
@property RLMArray <Description> *descriptions;

// Location
@property (readonly) NSString *address;
@property NSString *street;
@property NSNumber <RLMInt> *number;
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

@property NSString *email;
@property NSString *url;
@property NSNumber <RLMInt> *mobile;
@property NSNumber <RLMInt> *landline;
@property NSString *foundedDate;
@property NSString *localizedDescription;
@property NSString *artisticDirector;
@property NSString *generalManager;

// This is been newly added.
@property NSString *checksum;
@property NSNumber <RLMInt> *cvr;
@property NSString *formOfOrganization;
@property RLMArray <Subsidy> *governmentSubsidies;

@property Contact *contact;
@property RLMArray <Profile> *producerProfiles;
@property NSNumber <RLMBool> *organizer;
@property NSNumber <RLMBool> *producer;
@property NSNumber <RLMBool> *vatRegistration;
@property RLMArray <Profile> *organizerProfiles;
@property NSString *venueManagement;
@property NSString *venueType;

@property (readonly) RLMArray <Venue> *venues; // not quiet ready yet.
@property (readonly) RLMResults *events;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<Organization>
RLM_ARRAY_TYPE(Organization)
