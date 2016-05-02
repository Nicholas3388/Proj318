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
#import "ChangePortraitViewController.h"

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
    
    //_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40 + 64, self.view.frame.size.width, self.view.frame.size.height - 120) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    [self.view addSubview:_tableView];
    
    _headView = [MyDetailInfoView instanceView];
    _headView.frame = CGRectMake(0, 64, self.view.frame.size.width, 120);
    _headView.portrait.layer.cornerRadius = _headView.portrait.frame.size.width/2.0;
    _headView.portrait.clipsToBounds = YES;
    [self.view addSubview:_headView];
    
    // add click event handler
    _headView.portrait.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(portraitClicked:)];
    [_headView.portrait addGestureRecognizer:tapGesture];
}

#pragma mark - portrait clicked
- (void)portraitClicked:(UITapGestureRecognizer *)recognizer {
    ChangePortraitViewController *viewController = [[ChangePortraitViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
    NSLog(@"portrait click");
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
                    cell.item.text = NSLocalizedString(@"kMyName", nil);
                    cell.content.text = NSLocalizedString(@"kUserName", nil);
                }
                    break;
                case 1:
                {
                    cell.item.text = NSLocalizedString(@"kAccount", nil);
                    cell.content.text = @"70600322";
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
