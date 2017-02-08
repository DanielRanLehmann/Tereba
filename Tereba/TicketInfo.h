//
//  TicketInfo.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface TicketInfo : RLMObject

@property NSString *url;
@property NSNumber <RLMFloat> *weekendAddition;
@property NSNumber <RLMFloat> *reducedDayOfWeek;
@property NSNumber <RLMFloat> *additionDaysOfWeek;
@property NSString *otherSubscriptionURL;
@property NSString *ticketOfficeURL;
@property NSString *ticketOperatorURL;
@property NSString *venueSubscriptionURL;
@property NSString *publicComment;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<TicketInfo>
RLM_ARRAY_TYPE(TicketInfo)
