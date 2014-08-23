//
//  DANLinkedStoryboardSegue.m
//  Captain
//
//  Created by Daniel Tomlinson on 18/03/2014.
//  Copyright (c) 2014 RocketApps Ltd. All rights reserved.
//

#import "DANLinkedStoryboardSegue.h"

@implementation DANLinkedStoryboardSegue

+ (UIViewController *)sceneNamed:(NSString *)identifier {
  NSArray *info = [identifier componentsSeparatedByString:@"@"];

  NSString *storyboard_name = info[1];
  NSString *scene_name = info[0];

  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboard_name
                                                       bundle:nil];
  UIViewController *scene = nil;

  if (scene_name.length == 0) {
    scene = [storyboard instantiateInitialViewController];
  }
  else {
    scene = [storyboard instantiateViewControllerWithIdentifier:scene_name];
  }

  return scene;
}

- (id)initWithIdentifier:(NSString *)identifier
                  source:(UIViewController *)source
             destination:(UIViewController *)destination {
  return [super initWithIdentifier:identifier
                            source:source
                       destination:[DANLinkedStoryboardSegue sceneNamed:identifier]];
}

- (void)perform {
  UIViewController *source = (UIViewController *)self.sourceViewController;
  [source.navigationController pushViewController:self.destinationViewController
                                         animated:YES];
}

@end
