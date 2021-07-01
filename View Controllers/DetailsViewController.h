//
//  DetailsViewController.h
//  twitter
//
//  Created by Abraham Alonge on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DetailsViewControllerDelegate

- (void)didRetweet:(Tweet *)tweet;
- (void)didFavorite:(Tweet *)tweet;

@end

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Tweet *tweet;
@property (nonatomic, weak) id<DetailsViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
