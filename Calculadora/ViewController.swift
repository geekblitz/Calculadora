//
//  ViewController.swift
//  Calculadora
//
//  Created by Martín G. Morgado on 20/01/15.
//  Copyright (c) 2015 geekblitz. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer ()//para crear un solo player
    
    var numv="0"
    var oper="0"
    var concatenar=true
    
    @IBOutlet var result: UITextView!

    override func viewDidLoad() {
    // Do any additional setup after loading the view, typically from a nib.
        
    }
    
   
    
    ///////Saca lo q tiene boton
    @IBAction func numeros(sender: AnyObject) {
        
        var btn:UIButton
        btn =   sender as! UIButton
        let num = btn.tag//num del botón
        if (concatenar==true){

            if (result.text=="0"){
                result.text = ("\(num)")
        }
            else{       result.text = (result.text+"\(num)")
        }
    }
        else
        {
            result.text = ("\(num)")
            concatenar=true
        }
    }
    

    @IBAction func igual(sender: AnyObject) {
        let numn = (result.text as NSString).floatValue
        var total:Float
        total=0
        let n1 = (numv as NSString).floatValue
        let n2 = numn
        var acumula :Float
        
        switch (oper){
        case "+":
            total = n1+n2
            break
            
        case "-":
            total = n1-n2
            break

        case "*":
            total = n1*n2
            break

        case "/":
            total = n1/n2
            break

        default:
            total = 0
            break
            
        }
        result.text=("\(total)")
        numv = ("\(total)")
    }

    
    @IBAction func puntito(sender: AnyObject) {
        let p = result.text+"."
        result.text=p
    }
    
    @IBAction func clear(sender: AnyObject) {
        result.text="0"
        
    }
    //Operadores
    @IBAction func operadores(sender: AnyObject) {
        var btn:UIButton
        btn =   sender as! UIButton
        
        //para acumular
        
        let numn = (result.text as NSString).floatValue
        var total:Float
        //total=0
        
        var n1 = (numv as NSString).floatValue
        var n2 = numn
        var acumula :Float
        
        numv=result.text
        oper = (btn.titleLabel)!.text!
        concatenar = false
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

