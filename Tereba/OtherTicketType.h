//
//  OtherTicketType.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/17/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface OtherTicketType : RLMObject

@property NSString *value;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<OtherTicketType>
RLM_ARRAY_TYPE(OtherTicketType)
