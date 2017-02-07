//
//  TicketAgencyInfo.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"

@interface TicketAgencyInfo : RLMObject

@property NSString *ticketAgencyName;
@property NSNumber <RLMInt> *ticketsPerShow;
@property NSString *salesMethodKeys;
@property NSString *auditorium;
@property NSNumber <RLMInt> *preOpeningSpan;
@property NSString *note;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<TicketAgencyInfo>
RLM_ARRAY_TYPE(TicketAgencyInfo)
