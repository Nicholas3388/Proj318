//
//  MyInfoViewController.m
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyInfoViewController.h"
#import "MyDetailInfoView.h"
#import "MyOtherInfoViewCell.h"

@implementation MyInfoViewController {
    // private
    UITableView *_tableView;
    
    MyDetailInfoView *_headView;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - view layout
- (void)layout {
    self.title = NSLocalizedString(@"kMyInfo", nil);
    
    self.view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    [self.view addSubview:_tableView];
    
    _headView = [MyDetailInfoView instanceView];
    [self.view addSubview:_headView];
}

#pragma mark - table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 42.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            return 4;
        }
            break;
        case 1:
        {
            return 1;
        }
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            static NSString *cellID = @"MyOtherInfoViewCell";
            MyOtherInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"MyOtherInfoViewCell" bundle:nil] forCellReuseIdentifier:cellID];
                cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            }
            
            switch (indexPath.row) {
                case 0:
                {
                }
                    break;
                case 1:
                {
                }
                    break;
                case 2:
                {
                }
                    break;
                case 3:
                {}
                    break;
                default:
                    break;
            }
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
            break;
        case 1:
        {
            static NSString *cellID = @"MyOtherInfoViewCell";
            MyOtherInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"MyOtherInfoViewCell" bundle:nil] forCellReuseIdentifier:cellID];
                cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            }
            
            cell.item.text = NSLocalizedString(@"kUserName", nil);
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
