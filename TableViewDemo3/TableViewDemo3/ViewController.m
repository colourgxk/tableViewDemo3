//
//  ViewController.m
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CellDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) CustomTableViewCell *tableViewCell;
@property (strong, nonatomic) UINavigationItem *navigationItem;
@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic, strong) ViewControllerModel *viewControllerModel;
@property (nonatomic, strong) UISwitch *switchButton;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllerModel = [[ViewControllerModel alloc] init];

    self.tableView.frame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    [self.view addSubview:self.tableView];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewControllerModel countViewControllerModel]+1;
}



- (CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    static NSString *cellIdentifier = @"cellIdentifier";
    // 根据cellID从可重用单元格的队列中取出可重用的一个单元格UITableViewCell对象
    CustomTableViewCell* tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果取出的单元格为nil
    if (tableViewCell == nil) {
        //创建一个UITableViewCell对象，并绑定到cellID
        tableViewCell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }

    tableViewCell.layer.masksToBounds = YES;
    //UITableView声明了一个NSIndexPath的类别，主要用来标识当前cell的在tableView中的位置，该类别有section和row两个属性，section标识当前cell处于第几个section中，row代表在该section中的第几行。
    // 从IndexPath参数获取当前行的行号
    NSUInteger rowNo = indexPath.row;
    // 取出viewControllerModelContent中索引为rowNo的元素作为UITableViewCell的文本内容
    
    if(rowNo == 0){
        
        tableViewCell.textLabel.text = @"最喜欢的城市";
        
        // 设置UITableViewCell右边有一个蓝色的圆形button
        if (!self.switchButton) {
            self.switchButton = [[UISwitch alloc]init];
             [self.switchButton addTarget:self action:@selector(switchButtonChange:) forControlEvents:UIControlEventValueChanged];
        }
        tableViewCell.accessoryView = self.switchButton;

//        [self.switchButton setOn:NO];
        
    }
    else{
        ViewControllerModelUnit *viewControllerModelContentAtIndex=[self.viewControllerModel viewControllerModelForCellAtIndex:rowNo-1];
        tableViewCell.textLabel.text = viewControllerModelContentAtIndex.cityName;
        // 设置UITableViewCell的左边的图标
        tableViewCell.imageView.image = [UIImage imageNamed:viewControllerModelContentAtIndex.imageName];

        // 设置UITableViewCell右边有一个小箭头，距离右边有十几像素
        tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   
        if(viewControllerModelContentAtIndex.existOrNot){
             tableViewCell.starImage.image=[UIImage imageNamed:@"on"];
        }
        else{
            [tableViewCell.starImage  setImage:nil];
        }
    
    }
    

    
//    if(rowNo>0){
//        if(self.switchButton.isOn){
//            if(!viewControllerModelContentAtIndex.existOrNot){
//                [self.tableView deleteRowsAtIndexPaths:@[NSIndexPath indexPathForRow:rowNo-1 inSection:0] withRowAnimation:UITableViewRowAnimationLeft];
//            }
//        }
//
//        else{
//            if(viewControllerModelContentAtIndex.existOrNot){
//                [self.tableView deleteRowsAtIndexPaths:@[NSIndexPath indexPathForRow:rowNo-1 inSection:0] withRowAnimation:UITableViewRowAnimationLeft];
//            }
//        }
//    }
    
    //返回设置好数据的cell给UITableView对象
    return tableViewCell;
}

-(void)switchButtonChange:(UISwitch *)sender{
     
    if([sender isOn]){
         
         [self.viewControllerModel dataSourceWithLike];
         [self.tableView reloadData];
        
         
     }
     else{

         [self.viewControllerModel dataSourceWithAll];
         [self.tableView reloadData];
     }
}


//-(void)switchButtonChange:(id)sender{
//    UISwitch *mySwitch = (UISwitch *)sender;
//    if(mySwitch.isOn){
//        NSLog(@"开关开启");
//         ViewControllerModelUnit *viewControllerModelContentAtIndex=[self.viewControllerModel viewControllerModelForCellAtIndex:self.detailViewController.index-1];
//        if(viewControllerModelContentAtIndex.existOrNot){
//            .hidden=NO;
//        }
//    }
//}


- (void)sendStatus:(BOOL)isSuccessful{
    ViewControllerModelUnit *viewControllerModelContentAtIndex=[self.viewControllerModel viewControllerModelForCellAtIndex:self.detailViewController.index-1];
    viewControllerModelContentAtIndex.existOrNot = isSuccessful;

    [self.tableView reloadData];
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    self.selectedIndexPath = indexPath;
    NSLog(@"Select row: %ld", indexPath.row);
    
    self.detailViewController = [[DetailViewController alloc] init];
    self.detailViewController.delegate = self;
    self.detailViewController.index = indexPath.row;
    if(indexPath.row>0){
         ViewControllerModelUnit *viewControllerModelContentAtIndex=[self.viewControllerModel viewControllerModelForCellAtIndex:self.detailViewController.index-1];
         self.detailViewController.likeOrNot=viewControllerModelContentAtIndex.existOrNot;
         [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
  
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_tableView reloadData];
}

- (UITableView *)tableView {
    if (_tableView != nil) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}

@end





