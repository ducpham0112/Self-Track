//
//  TimeTracker.h
//  Self-Track
//
//  Created by Duc Pham on 1/13/15.
//  Copyright (c) 2015 CSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ActivityCategory;

@interface TimeTracker : NSManagedObject

@property (nonatomic, retain) NSDate * endTime;
@property (nonatomic, retain) NSDate * startTime;
@property (nonatomic, retain) ActivityCategory *activityCategory;

@end
