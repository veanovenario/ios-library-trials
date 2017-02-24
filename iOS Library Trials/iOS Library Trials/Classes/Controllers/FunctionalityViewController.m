//
//  FunctionalityViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 19/12/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import "FunctionalityViewController.h"
#import "WebViewController.h"

@interface FunctionalityViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *functionalityArray;

@end

@implementation FunctionalityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // What to show in the table
    self.functionalityArray = [[NSMutableArray alloc] init];
    [self.functionalityArray addObject:@"Display a webpage in a WebView to test responsive design (WebKit option)"];
    [self.functionalityArray addObject:@"Braintree Payment Gateway (Drop-In) [iOS 9.0]"];
    [self.functionalityArray addObject:@"Open a WebView from a link in a webpage & call a JS function"];
    [self.functionalityArray addObject:@"Share different data per ActivityType"];
    [self.functionalityArray addObject:@"Display a screen from a created framework"];
    [self.functionalityArray addObject:@"ZXing QR Code Scanner (run on device)"];
    [self.functionalityArray addObject:@"Retrieve current location of the device"];
    [self.functionalityArray addObject:@"Test APIs"];
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functionalityArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"CellIdentifier";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [self.functionalityArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        //NSString *webviewURL = @"https://game-uat.capitastar.com/apiv1/service/serve_bingo_board?user_id=1&token=test&profileToken=test"; - CapitaStar UAT
        NSString *webviewURL = @"http://bingo.massiveinfinity.com/apiv1/Service/serve_bingo_board_dev?user_id=jian&token=test&profileToken=test&scvAuth=test";
        [self performSegueWithIdentifier:kSegueWebView sender:webviewURL];
    }else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:kSegueBraintree sender:nil];
    }else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:kSegueWebpageNativeLink sender:nil];
    }else if (indexPath.row == 3) {
        [self performSegueWithIdentifier:kSegueSharePerActivityType sender:nil];
    }else if (indexPath.row == 4) {
        [self performSegueWithIdentifier:kSegueFrameworkUsage sender:nil];
    }else if (indexPath.row == 5) {
        [self performSegueWithIdentifier:kSegueQRCodeScanner sender:nil];
    }else if (indexPath.row == 6) {
        [self performSegueWithIdentifier:kSegueCoreLocation sender:nil];
    }else if (indexPath.row == 7) {
        [self performSegueWithIdentifier:kSegueAPITest sender:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:kSegueWebView]) {
        NSString *urlString = (NSString *)sender;
        WebViewController *nextVC = (WebViewController *) segue.destinationViewController;
        nextVC.url = urlString;
    }
}

@end
