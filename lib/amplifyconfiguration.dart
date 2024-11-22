const amplifyconfig = '''{
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "cochise": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://hsqsfukufbhahccbw62gdbfbqy.appsync-api.eu-west-3.amazonaws.com/graphql",
                    "region": "eu-west-3",
                    "authorizationType": "AMAZON_COGNITO_USER_POOLS"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "eu-west-3:2f48740a-3f0c-4a53-9ab0-c942f88b96e0",
                            "Region": "eu-west-3"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "eu-west-3_dQMVrt7a8",
                        "AppClientId": "223ummd0t7pbd7450a8pbseek1",
                        "Region": "eu-west-3"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://hsqsfukufbhahccbw62gdbfbqy.appsync-api.eu-west-3.amazonaws.com/graphql",
                        "Region": "eu-west-3",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "cochise_AMAZON_COGNITO_USER_POOLS"
                    },
                    "cochise_AWS_IAM": {
                        "ApiUrl": "https://hsqsfukufbhahccbw62gdbfbqy.appsync-api.eu-west-3.amazonaws.com/graphql",
                        "Region": "eu-west-3",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "cochise_AWS_IAM"
                    }
                }
            }
        }
    }
}''';
