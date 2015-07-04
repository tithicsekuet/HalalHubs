//
//  ViewController.m
//  Halalhubs
//
//  Created by Macbook Pro on 29/6/15.
//  Copyright (c) 2015 Macbook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize EmailTextFiled,passwordTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EmailTextFiled.delegate=self;
    passwordTextField.delegate=self;
    passwordTextField.secureTextEntry=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)LoginPressed:(UIButton *)sender {
    [self CheckCustomerLoginFromServerhalal];

}

- (IBAction)RegistrationPressed:(UIButton *)sender {
    RegistrationController * registrationController=(RegistrationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"registration"];
    
    
    [self.navigationController pushViewController:registrationController animated:YES];

    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}


-(NSDictionary*)CustomerLoginDatahalal{
    NSMutableDictionary *MutableDictionary=[[NSMutableDictionary alloc]init];
    
    if([EmailTextFiled.text isEqualToString:@""]||[passwordTextField.text isEqualToString:@""])
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Alert!" message:@"Please Fill Up all the field" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
    }
    else{
        
      [MutableDictionary setObject:EmailTextFiled.text forKey:@"identifier"];
        
        [MutableDictionary setObject:passwordTextField.text forKey:@"password"];
        
        NSLog(@"logindulicate halal%@",MutableDictionary);
    }
    
    return MutableDictionary;
    
}
// request for hail data
- (void)CheckCustomerLoginFromServerhalal{
    
    NSLog(@"logindulicate halal%@",[self CustomerLoginDatahalal]);
    NSString * halal=@"http://45.55.196.7:1337/auth/local/register";
    NSString * halalbase=@"http://45.55.196.7:1337/auth/local";
    NSString *HailRequestURL = [NSString stringWithFormat:@"%@",halalbase] ;
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:halalbase]];
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
