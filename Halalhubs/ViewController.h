//
//  ViewController.h
//  Halalhubs
//
//  Created by Macbook Pro on 29/6/15.
//  Copyright (c) 2015 Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
- (IBAction)LoginPressed:(UIButton *)sender;

- (IBAction)RegistrationPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *EmailTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

