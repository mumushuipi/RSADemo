//
//  ViewController.m
//  RSADemo
//
//  Created by 林波 on 2020/6/6.
//  Copyright © 2020 bbk. All rights reserved.
//

#import "ViewController.h"
#import "RSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载公钥
    NSString *publick = [[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil];
    [[RSACryptor sharedRSACryptor] loadPublicKey:publick];
    
        
    // 加载私钥
    NSString *private = [[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil];
    [[RSACryptor sharedRSACryptor] loadPrivateKey:private password:@"111"];
    
    NSString *message = @"hello";
    
    // 加密
    NSData *encryptResult = [[RSACryptor sharedRSACryptor] encryptData:[message dataUsingEncoding:kCFStringEncodingUTF8]];
    NSLog(@"加密结果:\n%@",encryptResult);
    
    // 解密
    NSData *decrypData = [[RSACryptor sharedRSACryptor] decryptData:encryptResult];
    NSString *decryptResult = [[NSString alloc] initWithData:decrypData encoding:kCFStringEncodingUTF8];
    
    NSLog(@"解密结果:\n%@",decryptResult);
}


@end
