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
//    let emailTextFieldView: UIView = {
//        let view = UIView()
//
//        view.backgroundColor = UIColor.darkGray
//
//        // radius corners
//        view.layer.cornerRadius = 5;
//        view.layer.masksToBounds = true;
//
//        return view
//    }()
    
    // email
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    // 패스워드 텍스트필드의 안내문구
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    // 로그인 - 비밀번호 입력 필드
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true     // 비밀번호 가리기
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    // 패스워드에 "표시" 버튼 비밀번호 가리기 기능
    private let passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha:1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModSetting), for: .touchUpInside)
        return button
    }()
    
    // MARK: - 로그인 버튼
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        return button
    }()
    
    
    lazy var stackView: UIStackView = {
//       let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
            
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        
        return st
    }()
    
    // 비밀번호 재설정 버튼
    private let passwordresetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        makeUI()
        
    }

    // UI 생성하는 함수
    func makeUI() {
        
        view.backgroundColor = UIColor.black
        
        // 1. 등록
        // 2. 자동 frame 설정
        // 3. layout 설정 (constraint)
        
        
//        // Controller 에서 가지고 있는 view, sub 에 만들어 놓는다. // 필수
//        view.addSubview(emailTextFieldView)
//
//        // 코드로 짜면, 자동으로 frame 을 잡아준다. 하지만 현재 코드로 하나씩 했기 때문에 false 로 설정한다.
//        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
//
//        // 왼쪽 anchor (왼쪽 거리)
//        // equalTo = 어디다가 맞출것인지
//        emailTextFieldView.leadingAnchor.constraint(
//            equalTo: view.leadingAnchor,
//            constant: 30
//        ).isActive = true
//
//        // trailing anchor (오른쪽에서 거리 두기)
//        emailTextFieldView.trailingAnchor.constraint(
//            equalTo: view.trailingAnchor,
//            constant: -30
//        ).isActive = true
//
//        // 위쪽
//        emailTextFieldView.topAnchor.constraint(
//            equalTo: view.topAnchor,
//            constant: 200
//        ).isActive = true
//
//
//        // 높이 (equalToConstant, 기준이 없기 때문에)
//        emailTextFieldView.heightAnchor.constraint(
//            equalToConstant: 40
//        ).isActive = true
        
        
//        stackView.addSubview(emailTextFieldView)
//        stackView.addSubview(passwordTextField)
//        stackView.addSubview(loginButton)
        
        
        view.addSubview(stackView)
        view.addSubview(passwordresetButton)
        
        // 자동으로 제약을 잡아주는것을 취소
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        passwordresetButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor, constant: 0),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
            
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor, constant: 0),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            passwordresetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordresetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordresetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordresetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
        
        

        
        
        
//        emailTextFieldView.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true
//        emailTextFieldView.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8).isActive = true
//        emailTextFieldView.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15).isActive = true
//        emailTextFieldView.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2).isActive = true
    }
    
    @objc func passwordSecureModSetting(){
        print("표시 버튼이 눌렸습니다")
        // toggle 한번 누르면 참, 두번째 누르면 불
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    // selector 으로 만들었기 때문에 objc
    @objc func resetButtonTapped() {
        print("reset 버튼이 눌렸습니다")
        let alertCount = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼이 눌렸습니다")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼이 눌렸습니다")
        }
        
        alertCount.addAction(success)
        alertCount.addAction(cancel)
        
        // 다음 화면으로 넘어가기
        present(alertCount, animated: true, completion: nil)
    }

}

