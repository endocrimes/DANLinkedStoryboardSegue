//
//  DANLinkedStoryboardSegue.m
//  Captain
//
//  Created by Danielle Lancashire on 18/03/2014.
//  Copyright (c) 2014 RocketApps Ltd. All rights reserved.
//

#import "DANLinkedStoryboardSegue.h"

@implementation DANLinkedStoryboardSegue

+ (UIViewController *)sceneNamed:(NSString *)identifier {
  NSArray *info = [identifier componentsSeparatedByString:@"@"];

  NSString *storyboardName = info[1];
  NSString *sceneName = info[0];

  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                       bundle:nil];
  UIViewController *scene = nil;

  if (sceneName.length == 0) {
    scene = [storyboard instantiateInitialViewController];
  }
  else {
    scene = [storyboard instantiateViewControllerWithIdentifier:sceneName];
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
