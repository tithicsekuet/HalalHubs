//
//  RegistrationController.m
//  Halalhubs
//
//  Created by Macbook Pro on 30/6/15.
//  Copyright (c) 2015 Macbook Pro. All rights reserved.
//

#import "RegistrationController.h"

@interface RegistrationController ()

@end
@implementation RegistrationController
@synthesize firstnameTextfield,lastnameTextField,emailTextField,userNameTextField,passwordTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    firstnameTextfield.delegate=self;
    lastnameTextField.delegate=self;
    emailTextField.delegate=self;
    userNameTextField.delegate=self;
    passwordTextField.delegate=self;
    passwordTextField.secureTextEntry=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

     return YES;
}




- (IBAction)SignUpPressed:(UIButton *)sender {
    [self CheckCustomerLoginFromServerhalal];
}

-(NSDictionary*)CustomerLoginDatahalal{
    NSMutableDictionary *MutableDictionary=[[NSMutableDictionary alloc]init];

    if([firstnameTextfield.text isEqualToString:@""]||[lastnameTextField.text isEqualToString:@""]||[emailTextField.text isEqualToString:@""]||[userNameTextField.text isEqualToString:@""]||[passwordTextField.text isEqualToString:@""])
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Alert!" message:@"Please Fill Up all the field" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
    }
    else{

       [MutableDictionary setObject:firstnameTextfield.text forKey:@"firstName"];
    [MutableDictionary setObject:lastnameTextField.text forKey:@"lastName"];
    [MutableDictionary setObject:emailTextField.text forKey:@"email"];
    [MutableDictionary setObject:userNameTextField.text forKey:@"username"];
    
    [MutableDictionary setObject:passwordTextField.text forKey:@"password"];
    
     NSLog(@"logindulicate halal%@",MutableDictionary);
    }
    
    return MutableDictionary;
    
}
// request for hail data
- (void)CheckCustomerLoginFromServerhalal{
    
    NSLog(@"logindulicate halal%@",[self CustomerLoginDatahalal]);
    NSString * halal=@"http://45.55.196.7:1337/auth/local/register";
    NSString * halalbase=@"http://45.55.196.7:1337/auth/local/";
    NSString *HailRequestURL = [NSString stringWithFormat:@"%@",halal] ;
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:halal]];
    [httpClient setParameterEncoding:AFJSONParameterEncoding];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:HailRequestURL
                                                      parameters:[self CustomerLoginDatahalal]];
    NSLog(@"request is%@",request);
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *jsonDict = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] JSONValue];
        NSLog(@"response object is%@",jsonDict);
        NSArray *responseHail=[jsonDict valueForKey:@"posts"];
        NSLog(@"halal responseHail value=%@",responseHail);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        
        
    }];
    [operation start];
    
    
}
@end
