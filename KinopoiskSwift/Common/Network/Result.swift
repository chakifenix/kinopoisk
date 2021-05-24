//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

enum Result<Value> {
    case success(Value)
    case error(AppError)
    
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .error:
            return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .error:
            return nil
        }
    }
    
    public var error: AppError? {
        switch self {
        case .success:
            return nil
        case .error(let error):
            return error
        }
    }
}
