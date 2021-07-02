#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
- (IBAction)tappedClose:(UIBarButtonItem *)sender;
- (IBAction)tappedTweet:(UIBarButtonItem *)sender;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetTextView.delegate = self;
        
    self.tweetTextView.layer.borderWidth = 2.0f;
    self.tweetTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.tweetTextView.layer.cornerRadius = 5;
    
    [self.tweetTextView becomeFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
        int characterLimit = 280;

        NSString *newText = [self.tweetTextView.text stringByReplacingCharactersInRange:range withString:text];

        if (newText.length <= characterLimit) {
            NSInteger charactersLeft = 280 - newText.length;
            self.charCountLabel.text = [NSString stringWithFormat:@"%d", (int)charactersLeft];
            return true;
        } else {
            return false;
        }
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
    [[APIManager shared] postStatusWithText:self.tweetTextView.text completion:^(Tweet *tweet, NSError *error) {
        if(error) {
            NSLog(@"😫😫😫 Error posting tweet: %@", error.localizedDescription);
            // TODO: handle error
        } else {
            [self.delegate didTweet:tweet];
            NSLog(@"😎😎😎 Successfully posted tweet");
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }];
    
}

- (IBAction)tappedClose:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
