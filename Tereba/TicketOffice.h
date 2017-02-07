//
//  TicketOffice.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface TicketOffice : RLMObject

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

@property NSString *ticketPhone;
@property NSString *landline;
@property NSString *url;
@property NSString *email;
@property NSString *email2;
@property NSString *note;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<TicketOffice>
RLM_ARRAY_TYPE(TicketOffice)
