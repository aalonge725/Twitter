//
//  ComposeViewController.m
//  twitter
//
//  Created by Abraham Alonge on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
- (IBAction)tappedClose:(UIBarButtonItem *)sender;
- (IBAction)tappedTweet:(UIBarButtonItem *)sender;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tappedTweet:(UIBarButtonItem *)sender {
    
}

- (IBAction)tappedClose:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
