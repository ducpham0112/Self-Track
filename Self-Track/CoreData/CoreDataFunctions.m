//
//  CoreDataFunctions.m
//  Self-Track
//
//  Created by Duc Pham on 1/13/15.
//  Copyright (c) 2015 CSC. All rights reserved.
//

#import "CoreDataFunctions.h"
#import "ActivityCategory.h"
#import "TimeTracker.h"
#import "AppDelegate.h"

@implementation CoreDataFunctions : NSObject

+ (NSArray *)listCategory {
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    return delegate.fetchedResultsController.fetchedObjects;
}

+ (ActivityCategory*) getCategoryWithName: (NSString*) categoryName {
    NSArray* listCategory = [self listCategory];
    for (ActivityCategory* category in listCategory) {
        if ([category.name isEqualToString:categoryName]) {
            return category;
        }
    }
    return nil;
}

+ (BOOL) saveNewTrack: (NSDate*) startTime inCategory: (NSString*) categoryName {
    ActivityCategory* category = [self getCategoryWithName:categoryName];
    if (category == nil) {
        return NO;
    }
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    TimeTracker* newTrack = (TimeTracker*)[NSEntityDescription insertNewObjectForEntityForName:@"MyUser" inManagedObjectContext:delegate.managedObjectContext];
    newTrack.startTime = startTime;
    newTrack.endTime = [NSDate date];
    newTrack.activityCategory = category;
    
    [category addTrackedTimeObject:newTrack];
    
    return [self saveContent];
}


+ (BOOL) saveContent {
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSError* error;
    [delegate.managedObjectContext save:&error];
    delegate.fetchedResultsController = nil;
    if (error == nil) {
        return YES;
    }
    else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Unable to save content to database." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        NSLog(@"Fail to save content! Error: %@", [error userInfo]);
        return NO;
    }
}


@end
