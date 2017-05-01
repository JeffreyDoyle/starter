//
//  Firebase.swift
//  starter
//
//  Created by Jeffrey Doyle on 2017-05-01.
//  Copyright © 2017 Jeffrey Doyle. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth



struct Message {
    var content = ""
    var lat = 0
    var lon = 0
    var uid = ""
}


class Firebase {
    
    init(){
        
    }
    
    func getUserID() -> String{
        let user = FIRAuth.auth()?.currentUser
    
        if user != nil {
            return user!.uid
        } else {
            return ""
        }
    }
    
    
    func updateUserLocation(lat: Double, lon: Double) {
        let uid = getUserID()
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        if (uid != ""){
            ref.child("users").child(uid).child("location").setValue(["lat": lat, "lon": lon])
        }
    }
    
    func updateUserUID() {
        let uid = getUserID()
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()

        if (uid != ""){
            ref.child("users").child(uid).setValue(["uid": uid])
        }
    }
    
    func postMessage(msg: Message) {
        let uid = getUserID()
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        if (uid != ""){
            ref.child("users").child(uid).child("messages").setValue(["content": uid])
        }
    }
    
    
    
    
    
}
