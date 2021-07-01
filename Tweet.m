#import "Tweet.h"
#import "User.h"
#import "NSDate+DateTools.h"

@implementation Tweet

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        if(originalTweet != nil){
            NSDictionary *userDictionary = dictionary[@"user"];
            self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];

            dictionary = originalTweet;
        }
        
        self.idStr = dictionary[@"id_str"];
        
        self.text = dictionary[@"text"];
        
        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
        self.favorited = [dictionary[@"favorited"] boolValue];
        
        self.retweetCount = [dictionary[@"retweet_count"] intValue];
        self.retweeted = [dictionary[@"retweeted"] boolValue];
        
        NSDictionary *user = dictionary[@"user"];
        self.user = [[User alloc] initWithDictionary:user];
        
        NSString *createdAtOriginalString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
        NSDate *date = [formatter dateFromString:createdAtOriginalString];
        if ([[NSDate new] hoursLaterThan:date] < 24.0) {
            self.createdAtString = [NSDate shortTimeAgoSinceDate:date];
        } else if ([[NSDate new] yearsLaterThan:date] == 0.0) {
            self.createdAtString = [date formattedDateWithFormat:@"MMM d"];
        } else {
            self.createdAtString = [date formattedDateWithStyle:NSDateFormatterShortStyle];
        }
    }
    return self;
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries{
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;
}

@end
