//
//  Contact.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface Contact : RLMObject

@property (readonly) NSString *name;

@property NSString *firstname;
@property NSString *lastname;
@property NSString *position;
@property NSNumber <RLMInt> *mobile;
@property NSNumber <RLMInt> *landline;
@property NSString *email;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Contact>
RLM_ARRAY_TYPE(Contact)
