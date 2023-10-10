//
//  File.swift
//  CustomPasswordTextField
//
//  Created by Faiz Ul Hassan on 10/10/2023.
//


import UIKit

class CustomPasswordTextField: UITextField {
    
    private var maskingCharacter: Character = "X" // Change this to your preferred masking character
    private var originalPassword: [Character] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        isSecurePassword = true // Hide the actual password characters
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        textDidChange()
    }
    
    @objc private func textDidChange() {
        if let text = text {
            // Check if characters were deleted
            if text.count < originalPassword.count {
                originalPassword.removeLast()
            } else if let newChar = text.last {
                originalPassword.append(newChar)
            }
            if isSecurePassword{
                let maskedText = String(repeating: maskingCharacter, count: self.text?.count ?? 0)
                attributedText = NSAttributedString(string: maskedText, attributes: [NSAttributedString.Key.foregroundColor: textColor as Any])
            }else{
                self.text = String(originalPassword)
            }
            
        }
    }
    
    override func deleteBackward() {
        if let text = text , !text.isEmpty{
            // Check if characters were deleted
            if !originalPassword.isEmpty{
                originalPassword.removeLast()
            }
            self.text?.removeLast()
            
            if isSecurePassword{
                let maskedText = String(repeating: maskingCharacter, count: self.text?.count ?? 0)
                attributedText = NSAttributedString(string: maskedText, attributes: [NSAttributedString.Key.foregroundColor: textColor as Any])
            }else{
                self.text = String(originalPassword)
            }
        }
    }
    
    
    var isSecurePassword: Bool = true{
        didSet {
            if isSecurePassword {
                //textDidChange()
                textDidChange2()
                
            } else {
                self.text = String(originalPassword)
            }
        }
    }
    
    @objc private func textDidChange2() {
        if let text = text {
            let maskedText = String(repeating: maskingCharacter, count: text.count)
            attributedText = NSAttributedString(string: maskedText, attributes: [NSAttributedString.Key.foregroundColor: textColor as Any])
        }
    }
    
    func toggleSecurePassword() {
        isSecurePassword.toggle()
    }
    
    func getOriginalPassword() -> String {
        return String(originalPassword)
    }
}
