
import UIKit

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
        
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var firstRowStack: UIStackView!
    @IBOutlet weak var secondRowStack: UIStackView!
    @IBOutlet weak var thirdRowStack: UIStackView!
    @IBOutlet weak var fourthRowStack: UIStackView!
    @IBOutlet weak var fifthRowStack: UIStackView!
    @IBOutlet weak var numpadStack: UIStackView!
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var theRedLine: UIProgressView!
    
    
    enum Operators : String {
        case plus = "+"
        case minus = "-"
        case divide = "/"
        case multiply = "*"
    }
    
    
    fileprivate func setupLayout (){
        
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.distribution = .fillEqually
        topStack.axis = .vertical
        
        NSLayoutConstraint.activate([
            topStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            topStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            topStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            topStack.bottomAnchor.constraint(equalTo: theRedLine.topAnchor , constant: -10),
            topStack.heightAnchor.constraint(lessThanOrEqualToConstant: 50)
            ])
        
        
        
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputTextView.leadingAnchor.constraint(equalTo: topStack.leadingAnchor),
            inputTextView.widthAnchor.constraint(equalTo: topStack.widthAnchor),
            ])
        
        
        
        resultLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLable.leadingAnchor.constraint(equalTo: topStack.leadingAnchor),
            resultLable.widthAnchor.constraint(equalTo: topStack.widthAnchor),
            ])
        
        
        
        theRedLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            theRedLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 10),
            theRedLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -10),
            theRedLine.bottomAnchor.constraint(equalTo: numpadStack.topAnchor, constant: -10)
            ])
        
        
        
        numpadStack.translatesAutoresizingMaskIntoConstraints = false
        numpadStack.distribution = .fillEqually
        numpadStack.axis = .vertical
        
        NSLayoutConstraint.activate([
            numpadStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numpadStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numpadStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numpadStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            numpadStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            ])
        
        
        
        firstRowStack.translatesAutoresizingMaskIntoConstraints = false
        firstRowStack.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            firstRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            firstRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            firstRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])
        
        
        
        secondRowStack.translatesAutoresizingMaskIntoConstraints = false
        secondRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            secondRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            secondRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            secondRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])



        thirdRowStack.translatesAutoresizingMaskIntoConstraints = false
        thirdRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            thirdRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            thirdRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            thirdRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])

        

        fourthRowStack.translatesAutoresizingMaskIntoConstraints = false
        fourthRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            fourthRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            fourthRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            fourthRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])

        
        
        fifthRowStack.translatesAutoresizingMaskIntoConstraints = false
        fifthRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            fifthRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            fifthRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            fifthRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])
        
    }
    
    
    
    var numbersArray : [(num : Double, sign : Bool)] = [(0,true)]
    var numbersStringArray : [String] = ["0"]
    var operatorsArray : [Operators] = []
    var inputText : String = "0"
    var numberExist : Bool = false
    var pointExist : Bool = false
    var operatorExist : Bool = false
    var currentSign : Bool = true
    var percentExist : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        inputTextView.textContainer.maximumNumberOfLines = 1
        inputTextView.invalidateIntrinsicContentSize()
        inputTextView.textContainer.lineBreakMode = .byTruncatingHead
        inputTextView.isScrollEnabled = true
        
    }
    
    
    
    @IBAction func clearAll(_ sender: UIButton) {
        inputTextView.text = "0"
        resultLable.text?.removeAll()
        numbersArray = [(0,true)]
        operatorsArray = []
        numbersStringArray = ["0"]
        inputText = "0"
        numberExist = false
        pointExist = false
        operatorExist = false
        currentSign = true
        percentExist = false
    }
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        if (operatorExist && !numberExist){
            operatorsArray.removeLast()
            reCalculate()
        }
        
        if (numbersArray.count < 2){
            return
        }
        
        let result : String = resultLable.text ?? "0"
        
        resultLable.text?.removeAll()
        numbersArray = []
        operatorsArray = []
        numbersStringArray = []
        
        inputText = result
        inputTextView.text = result
        
        let number : Double = Double(result)!
        currentSign = number >= 0
        numberExist = true
        numbersArray.append((num: abs(number), sign: currentSign))
        let numbersString : String = currentSign ? result : "(-" + result.dropFirst()
        pointExist = numbersString.contains(".")
        numbersStringArray.append(numbersString)
    }
    
    
    
    @IBAction func mainMathOperators(_ sender: UIButton) {
        if !numberExist && !currentSign {
            return
        }
        
        if !currentSign {
            inputText += ")"
        }
        
        if operatorExist {
            inputText = String(inputText.dropLast(3))
            operatorsArray.removeLast()
        } else {
            operatorExist = true
            numbersStringArray.append("")
        }
        
        numberExist = false
        pointExist = false
        currentSign = true
        percentExist = false
        
        guard let inputString : String = sender.titleLabel?.text else {return}
        
        inputText += " " + inputString + " "
        
        inputTextView.text = inputText
        
        guard let ops : Operators = Operators.init(rawValue: inputString) else {return}
        operatorsArray.append(ops)
    }
    
    @IBAction func signBtn(_ sender: Any) {
        if !numberExist {
            if currentSign {
                if inputText == "0" {
                    inputText = ""
                }
                inputText += "(-"
            } else {
                inputText = String(inputText.prefix(inputText.count - 2))
            }
        } else {
            guard let numberString = numbersStringArray.last else {return}
            let numberTuple = numbersArray.removeLast()
            
            if numberTuple.sign {
                inputText = inputText.prefix(inputText.count - numberString.count) + "(-" + numberString
                numbersArray.append((numberTuple.num,false))
            } else {
                inputText = inputText.prefix(inputText.count - numberString.count - 2) + numberString
                numbersArray.append((numberTuple.num,true))
            }
        }
        
        reCalculate()
        currentSign = !currentSign
        
        inputTextView.text = inputText
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        if !numberExist {return}
        
        var number = numbersArray.removeLast()
        number.num /= 100
        
        guard var numberString : String = numbersStringArray.removeLast() else {return}
        inputText = String(inputText.prefix(inputText.count - numberString.count))
        

        if numberString.last == "." {
            numberString += "0"
        }
        inputText += numberString + "%"
        

        var fixedNumber : Double = number.num
        if numberString != String(fixedNumber){
            fixedNumber = Double(String(number.num))!
        }
        numbersArray.append((fixedNumber , number.sign))
        numbersStringArray.append(numberString)
        

        percentExist = true
        inputTextView.text = inputText
        reCalculate()
        
    }
    
    
    

    @IBAction func digitButtons(_ sender: UIButton) {
        
        if percentExist {return}

        guard let inputString : String = sender.titleLabel?.text else {return}
        

        if inputString == "." {
            if pointExist {
                return
            } else {
                pointExist = true
            }
        }

        guard let numberString : String = numbersStringArray.removeLast() else {return}
        if numberExist {
            numbersArray.removeLast()
        }
        

        let newNumberString : String
        if inputText == "0" && inputString != "." {
            newNumberString = inputString
            numbersArray.removeFirst()
        } else {
            newNumberString = numberString + inputString
        }
        

        numbersStringArray.append(newNumberString)
        numbersArray.append((Double(String(newNumberString))! , currentSign))
        

        inputText = inputText.prefix(inputText.count - numberString.count) + newNumberString
        
      
        operatorExist = false
        numberExist = true
        reCalculate()
    }
    
    

    func reCalculate(){
        
        inputTextView.text = inputText
        
      
        if (numbersArray.count > 1 && numberExist) || (percentExist && numberExist) {
            
            
            var numbersArrayTemp : [(num : Double, sign : Bool)] = numbersArray
            var operatorsArrayTemp : [Operators] = operatorsArray
            
        
            var index : Int = 0
            while (!operatorsArrayTemp.isEmpty && index < operatorsArrayTemp.count){
                if operatorsArrayTemp[index] == .multiply || operatorsArrayTemp[index] == .divide {
                    
                 
                    let currentOP : Operators = operatorsArrayTemp.remove(at: index)
                    let num1Tuple = numbersArrayTemp.remove(at: index)
                    let num2Tuple = numbersArrayTemp.remove(at: index)
                    let result : Double
                    
                
                    let num1 : Double = num1Tuple.sign ? num1Tuple.num : -num1Tuple.num
                    let num2 : Double = num2Tuple.sign ? num2Tuple.num : -num2Tuple.num
                    
                   
                    switch currentOP {
                    case .multiply : result = num1 * num2
                    case .divide : result = num1 / num2
                    default: return
                    }
                    
                    
                    let resultString = String(result)
                    if let fixedResult = Double(resultString){
                       
                        numbersArrayTemp.insert((abs(result.rounded(toPlaces: 8)), fixedResult < 0 ? false : true) , at: index)
                        index -= 1
                    }
                }
                index += 1
            }
            
           
            index = 0
            while (!operatorsArrayTemp.isEmpty && index < operatorsArrayTemp.count){
                if operatorsArrayTemp[index] == .plus || operatorsArrayTemp[index] == .minus {

                   
                    let currentOP : Operators = operatorsArrayTemp.remove(at: index)
                    let num1Tuple = numbersArrayTemp.remove(at: index)
                    let num2Tuple = numbersArrayTemp.remove(at: index)
                    let result : Double
                    
           
                    let num1 : Double = num1Tuple.sign ? num1Tuple.num : -num1Tuple.num
                    let num2 : Double = num2Tuple.sign ? num2Tuple.num : -num2Tuple.num

                    //lets calculate result
                    switch currentOP {
                    case .minus : result = num1 - num2
                    case .plus : result = num1 + num2
                    default: return
                    }

               
                    numbersArrayTemp.insert((abs(result.rounded(toPlaces: 8)), result < 0 ? false : true ), at: index)
                    index -= 1
                }
                index += 1
            }
            
            
            let resultTuple = numbersArrayTemp.removeFirst()
            let result = resultTuple.sign ? resultTuple.num : -resultTuple.num
            var resultString = String(result)
            if resultString.contains(".") {
                resultString = String(resultString.split(separator: ".")[1]) == "0" ? String(resultString.dropLast(2)) : resultString
            }
            resultLable.text = resultString
        }
        
    }
    
}
