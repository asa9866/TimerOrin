//
//  ViewController.m
//  Time
//
//  Created by sipo on 15/10/20.
//  Copyright (c) 2015年 sipo. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
  {
      NSTimer *timer;
      AVAudioPlayer
      *player;
  }
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
//    timer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(clock:) userInfo:nil repeats:YES];
   
   // [timer ]
}
- (IBAction)click:(id)sender {
    NSString *nn=self.miao.text;
    if ([nn isEqual:nil]) {
         nn=@"10";
    }
    NSInteger n=[nn integerValue];
    timer = [NSTimer scheduledTimerWithTimeInterval:n target:self selector:@selector(clock:) userInfo:nil repeats:YES];

   
}


//开始播放
-(void)beginToPlay:(id)sender{
    if ([player isPlaying]) {
        return;
    }
    AVAudioSession
    *session = [AVAudioSession
                
                sharedInstance];
    
    [session
     setActive:YES
     error:nil];
    
    
    [session
     setCategory:AVAudioSessionCategoryPlayback
     
     error:nil];
    //以及设置app支持接受远程控制事件代码。设置app支持接受远程控制事件，
    //其实就是在dock中可以显示应用程序图标，同时点击该图片时，打开app。
    //或者锁屏时，双击home键，屏幕上方出现应用程序播放控制按钮。
    
    [[UIApplication
      sharedApplication]
     beginReceivingRemoteControlEvents];
    //用下列代码播放音乐，测试后台播放
    
    
    // 创建播放器
    NSString *string = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"];
        //把音频文件转换成url格式
    NSURL *url = [NSURL fileURLWithPath:string];
    
    player = [[AVAudioPlayer
                
                alloc]
               
               initWithContentsOfURL:url
               
               error:nil];
    [player 
     prepareToPlay];
    [player 
     setVolume:1];
    player.numberOfLoops
    = -1;
    //设置音乐播放次数  -1为一直循环
    [player 
     play];
    //播放

}

- (IBAction)stop:(id)sender {
    [player stop];

}

-(void)clock:(NSTimer *)time{
    [timer invalidate];
    timer = nil;
   // [timer ]
    [self beginToPlay:nil];

    //UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"标题" message:@"内容" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //[alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"标题" message:[NSString stringWithFormat:@"%@%ld",@"内容",(long)buttonIndex] delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

@end
