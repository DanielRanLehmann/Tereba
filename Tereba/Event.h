//
//  Event.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>
#import "Production.h"
#import "Organization.h"
#import "Contact.h"
#import "Accreditation.h"
#import "Venue.h"
#import "TicketAgencyInfo.h"
#import "TicketOffice.h"
#import "Service.h"
#import "Ticket.h"
#import "TicketInfo.h"
#import "OtherTicketType.h"

#import "Description.h"
#import "Title.h"
#import "Subtitle.h"
#import "Teaser.h"

@interface Event : RLMObject

@property NSString *coverPhotoUrl;

@property NSString *code;
@property NSString *checksum;

@property RLMArray <Title> *titles;
@property (readonly) NSString *localizedTitle;

@property RLMArray <Subtitle> *subtitles;
@property (readonly) NSString *localizedSubtitle;

@property RLMArray <Teaser> *teasers;
@property (readonly) NSString *localizedTeaser;

@property RLMArray <Description> *descriptions;
@property (readonly) NSString *localizedDescription;

@property NSString *releaseDate;
@property Production *production;

@property NSString *organizationCode;
@property (readonly) Organization *organization;
@property NSString *formOfStructure;
@property NSString *terms;
@property Contact *contact;
@property NSString *categoryName;
@property NSString *subcategoryName;
@property NSString *sortName;
@property NSNumber <RLMFloat> *ageBegin;
@property NSNumber <RLMFloat> *ageEnd;
@property NSNumber <RLMInt> *durationInMinutes;
@property NSNumber <RLMBool> *intermissionIndicator;
@property NSString *sortOfEvent;
@property RLMArray <Accreditation> *accreditations;
@property NSString *keywords;
@property NSString *info;
@property NSString *videoUrl;
@property NSNumber <RLMInt> *totalNumberOfShows;
@property NSString *playsFrom;
@property NSString *playsTo;
@property RLMArray <Venue> *venues;
@property RLMArray <Ticket> *tickets;
@property RLMArray <OtherTicketType> *otherTicketTypes; // this is new.
@property NSNumber <RLMInt> *subscriptionThreshold;
@property TicketInfo *ticketInfo;
@property NSString *seatTypeName;
@property NSNumber <RLMBool> *numberedSeats;
@property RLMArray <TicketAgencyInfo> *ticketAgencyInfos;
@property TicketOffice *ticketOffice;
@property RLMArray <Service> *services;
@property NSString *primaryLanguage;
@property NSString *secondaryLanguage;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Event>
RLM_ARRAY_TYPE(Event)
