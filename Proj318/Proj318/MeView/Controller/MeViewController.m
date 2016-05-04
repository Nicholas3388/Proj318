//
//  MeViewController.m
//  Proj318
//
//  Created by apple on 16/3/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MeViewController.h"
#import "MeViewCell.h"
#import "MeViewOtherCell.h"
#import "MyInfoViewController.h"
#import "FeedbackViewController.h"
#import "AccountViewController.h"
#import "PrivateViewController.h"
#import "NotificationViewController.h"
#import "Tools.h"

#import "QRootElement.h"
#import "QTextElement.h"
#import "QBooleanElement.h"

@implementation MeViewController {
    UITableView *_tableView;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - layout
- (void)layout {
    self.title = NSLocalizedString(@"kMe", nil);
    
    self.view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    
    // create setting button
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    settingButton.frame = CGRectMake(0, 0, 20, 20);
    [settingButton setImage:[UIImage imageNamed:@"btn_set_normal"] forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(onSettingButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    [self.view addSubview:_tableView];
}

#pragma mark - button handler
- (void)onSettingButtonTouched {
    
}

#pragma mark - table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 2;
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
            static NSString *cellID = @"MeViewCell";
            MeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"MeViewCell" bundle:nil] forCellReuseIdentifier:cellID];
                cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            }
            
            cell.nameLabel.text = NSLocalizedString(@"kMyName", nil);
            cell.accountLabel.text = NSLocalizedString(@"kAccount", nil);
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
        }
            break;
        case 1:
        {
            static NSString *cellID = @"MeViewOtherCell";
            MeViewOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"MeViewOtherCell" bundle:nil] forCellReuseIdentifier:cellID];
                cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            }
            
            if (indexPath.row == 0) {
                cell.icon.image = [UIImage imageNamed:@"account"];
                cell.content.text = NSLocalizedString(@"kAccountText", nil);
            }
            else if (indexPath.row == 1) {
                cell.icon.image = [UIImage imageNamed:@"notification"];
                cell.content.text = NSLocalizedString(@"kNotificationText", nil);
            }
            else if (indexPath.row == 2) {
                cell.icon.image = [UIImage imageNamed:@"private"];
                cell.content.text = NSLocalizedString(@"kPrivateText", nil);
            }
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
        }
            break;
        case 2:
        {
            static NSString *cellID = @"MeViewOtherCell";
            MeViewOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"MeViewOtherCell" bundle:nil] forCellReuseIdentifier:cellID];
                cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            }
            
            if (indexPath.row == 0) {
                cell.icon.image = [UIImage imageNamed:@"feedback"];
                cell.content.text = NSLocalizedString(@"kFeedbackText", nil);
            }
            else if (indexPath.row == 1) {
                
                cell.icon.image = [UIImage imageNamed:@"feedback"];
                cell.content.text = NSLocalizedString(@"kLogout", nil);
                cell.content.textColor = [UIColor redColor];
            }
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 72.0;
    }
    else {
        return 44.0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"item selected");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
        {
            MyInfoViewController *myInfoViewController = [[MyInfoViewController alloc] init];
            myInfoViewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myInfoViewController animated:YES];
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    AccountViewController *avc = [[AccountViewController alloc]init];
                    [self.navigationController pushViewController:avc animated:YES];
                }
                    break;
                case 1:
                {
                    NotificationViewController *nvc = [self createNotificationView];
                    [self presentModalViewController:nvc animated:YES];
                }
                    break;
                case 2:
                {
                    PrivateViewController *pvc = [self createPrivateView];
                    [self presentModalViewController:pvc animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    FeedbackViewController *fvc = [self createFeedbackView];
                    [self presentModalViewController:fvc animated:YES];
                }
                    break;
                case 1:
                {
                    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:NSLocalizedString(@"kLogoutConfirm", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"kCancel", nil) destructiveButtonTitle:NSLocalizedString(@"kConfirm", nil) otherButtonTitles:nil];
                    [sheet showInView:self.view];
                }
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - create notification view
- (NotificationViewController *)createNotificationView {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = NSLocalizedString(@"kNotificationText", nil);
    root.presentationMode = QPresentationModeModalForm;
    root.grouped = YES;
    root.controllerName = @"NotificationViewController";
    
    // first section
    QSection *firstSection = [[QSection alloc]initWithTitle:NSLocalizedString(@"kNewsNotify", nil)];
    QBooleanElement *boolElement = [[QBooleanElement alloc] initWithTitle:NSLocalizedString(@"kNewsNotify", nil) BoolValue:YES];
    boolElement.controllerAction = @"newsNotify:";
    boolElement.key = @"bool1";
    [firstSection addElement:boolElement];
    
    [root addSection:firstSection];
    
    // second section
    QSection *secondSection = [[QSection alloc]initWithTitle:NSLocalizedString(@"kHowToNotify", nil)];
    QBooleanElement *soundElement = [[QBooleanElement alloc] initWithTitle:NSLocalizedString(@"kSound", nil) BoolValue:YES];
    soundElement.controllerAction = @"soundNotify:";
    soundElement.key = @"bool2";
    [secondSection addElement:soundElement];
    
    QBooleanElement *vibrateElement = [[QBooleanElement alloc] initWithTitle:NSLocalizedString(@"kVibrate", nil) BoolValue:YES];
    vibrateElement.controllerAction = @"vibrateNotify:";
    vibrateElement.key = @"bool3";
    [secondSection addElement:vibrateElement];
    
    [root addSection:secondSection];
    
    // third section
    QSection *thirdSection = [[QSection alloc]initWithTitle:NSLocalizedString(@"kUpdateNotif", nil)];
    QBooleanElement *updateNotifElement = [[QBooleanElement alloc] initWithTitle:NSLocalizedString(@"kUpdateNotif", nil) BoolValue:YES];
    updateNotifElement.controllerAction = @"updateNotify:";
    updateNotifElement.key = @"bool4";
    [thirdSection addElement:updateNotifElement];
    thirdSection.footer = NSLocalizedString(@"kUpdateFieldFooter", nil);
    
    [root addSection:thirdSection];
    
    return [NotificationViewController controllerWithNavigationForRoot:root];
}

#pragma mark - create private view
- (PrivateViewController *)createPrivateView {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = NSLocalizedString(@"kPrivateText", nil);
    root.presentationMode = QPresentationModeModalForm;
    root.grouped = YES;
    root.controllerName = @"PrivateViewController";
    
    QSection *firstSection = [[QSection alloc]init];
    QBooleanElement *boolElement = [[QBooleanElement alloc] initWithTitle:NSLocalizedString(@"kNeedCert", nil) BoolValue:YES];
    boolElement.controllerAction = @"booleanAction:";
    boolElement.key = @"bool1";
    [firstSection addElement:boolElement];
    
    [root addSection:firstSection];
    
    return [PrivateViewController controllerWithNavigationForRoot:root];
}

#pragma mark - UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [Tools setStartViewController];
    }
}

#pragma mark - quick dialog item
- (FeedbackViewController *)createFeedbackView {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = NSLocalizedString(@"kFeedbackText", nil);
    root.presentationMode = QPresentationModeModalForm;
    root.grouped = YES;
    root.controllerName = @"FeedbackViewController";
    
    QSection *firstSection = [[QSection alloc]init];
    QTextElement *developerTitle = [[QTextElement alloc]initWithText:NSLocalizedString(@"kDeveloperTitle", nil)];
    [firstSection addElement:developerTitle];
    QTextElement *developer = [[QTextElement alloc]initWithText:NSLocalizedString(@"kDeveloper", nil)];
    [firstSection addElement:developer];
    
    QSection *secondSection = [[QSection alloc]init];
    QTextElement *contactTitle = [[QTextElement alloc]initWithText:NSLocalizedString(@"kContactTitle", nil)];
    [secondSection addElement:contactTitle];
    QTextElement *contact = [[QTextElement alloc]initWithText:NSLocalizedString(@"kEmail", nil)];
    [secondSection addElement:contact];
    
    QSection *thirdSection = [[QSection alloc]init];
    QTextElement *versionTitle = [[QTextElement alloc]initWithText:NSLocalizedString(@"kVersionTitle", nil)];
    [thirdSection addElement:versionTitle];
    QTextElement *version = [[QTextElement alloc]initWithText:NSLocalizedString(@"kVersion", nil)];
    [thirdSection addElement:version];
    
    [root addSection:firstSection];
    [root addSection:secondSection];
    [root addSection:thirdSection];
    
    return [FeedbackViewController controllerWithNavigationForRoot:root];
}

@end
