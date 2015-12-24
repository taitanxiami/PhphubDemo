//
//  APIConstant.h
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/23.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#ifndef APIConstant_h
#define APIConstant_h


#endif /* APIConstant_h */

#define APIAccessTokenURL [NSString stringWithFormat:@"%@%@", APIBaseURL, @"/oauth/access_token"]

#if DEBUG
#define APIBaseURL      @"https://staging_api.phphub.org/v1"
#else
#define APIBaseURL      @"https://api.phphub.org/v1"
#endif
