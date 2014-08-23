//
//  DANLinkedStoryboardSegue.h
//  Captain
//
//  Created by  Danielle Lancashireon 18/03/2014.
//  Copyright (c) 2014 RocketApps Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DANLinkedStoryboardSegue : UIStoryboardSegue

/**
 *  Return the view controller for a given identifier in the format controller@storyboard
 *
 *  @param identifier The storyboard/controller to load in the format controller@storyboard
 *
 *  @return the View Controller for the identifier
 */
+ (UIViewController *)sceneNamed:(NSString *)identifier;

@end
