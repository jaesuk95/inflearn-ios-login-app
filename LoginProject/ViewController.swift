//
//  ViewController.swift
//  LoginProject
//
//  Created by Jaesuk Lee on 2023/08/31.
//

import UIKit

class ViewController: UIViewController {
    
    
    // 클로저 속성 실행문
    // 속성 내부에서 setting 을 한다
    // 장점 : 코드 정리
    // emailTextFieldView 관련 연결 코드가 바로 밑에 view 에서 보인다
    // UIViewController 인스턴스가 생성되면 메모리에 올라간다, 메모리에 올라가면 저장 속성도 생긴다, 저장 속성 생기는 동시에 클로저를 실행하게 된다. UIView 를 만들고 setting 을 해준다
    // Springboot 로 예를 들자면, @Value ("${spring.rabbit.host}"), 이렇게 초기에 생성될 때 setting 을 해준다
    let emailTextFieldView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.darkGray
        
        // radius corners
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = true;
        
        return view
    }()
    

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

