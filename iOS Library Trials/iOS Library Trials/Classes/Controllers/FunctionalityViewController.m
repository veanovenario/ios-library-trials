//
//  FunctionalityViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 19/12/2016.
//  Copyright © 2016 Vea Novenario. All rights reserved.
//

#import "FunctionalityViewController.h"

@interface FunctionalityViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *functionalityArray;

@end

@implementation FunctionalityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // What to show in the table
    self.functionalityArray = [[NSMutableArray alloc] init];
    [self.functionalityArray addObject:@"Display a Webpage in a Webview"];
    [self.functionalityArray addObject:@"Braintree Payment Gateway"];
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
        [self performSegueWithIdentifier:kSegueWebView sender:nil];
    }else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:kSegueBraintree sender:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
