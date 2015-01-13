//
//  ActivityCategory.h
//  Self-Track
//
//  Created by Duc Pham on 1/13/15.
//  Copyright (c) 2015 CSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TimeTracker;

@interface ActivityCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSSet *trackedTime;
@end

@interface ActivityCategory (CoreDataGeneratedAccessors)

- (void)addTrackedTimeObject:(TimeTracker *)value;
- (void)removeTrackedTimeObject:(TimeTracker *)value;
- (void)addTrackedTime:(NSSet *)values;
- (void)removeTrackedTime:(NSSet *)values;

@end
