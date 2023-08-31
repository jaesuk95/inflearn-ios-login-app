//
//  ViewController.swift
//  LoginProject
//
//  Created by Jaesuk Lee on 2023/08/31.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextFieldView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        makeUI()
        
    }

    // UI 생성하는 함수
    func makeUI() {
        
        // 1. 등록
        // 2. 자동 frame 설정
        // 3. layout 설정 (constraint)
        // 3.
        
        emailTextFieldView.backgroundColor = UIColor.darkGray
        
        // Controller 에서 가지고 있는 view, sub 에 만들어 놓는다. // 필수
        view.addSubview(emailTextFieldView)
        
        // 코드로 짜면, 자동으로 frame 을 잡아준다. 하지만 현재 코드로 하나씩 했기 때문에 false 로 설정한다.
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        // 왼쪽 anchor (왼쪽 거리)
        // equalTo = 어디다가 맞출것인지
        emailTextFieldView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: 30
        ).isActive = true
        
        // trailing anchor (오른쪽에서 거리 두기)
        emailTextFieldView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -30
        ).isActive = true
        
        // 위쪽
        emailTextFieldView.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: 200
        ).isActive = true
        
        
        // 높이 (equalToConstant, 기준이 없기 때문에)
        emailTextFieldView.heightAnchor.constraint(
            equalToConstant: 40
        ).isActive = true
        
    }

}

