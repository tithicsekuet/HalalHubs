//
//  RegistrationController.h
//  Halalhubs
//
//  Created by Macbook Pro on 30/6/15.
//  Copyright (c) 2015 Macbook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RegistrationController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstnameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
- (IBAction)SignUpPressed:(UIButton *)sender;

@end
