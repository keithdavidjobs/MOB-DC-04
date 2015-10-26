//: Playground - noun: a place where people can play


/*
    DELEGATION
    -------------       -------------
    |           |       |           |
    |           |       |           |
    |     A     |   ->  |     B     |
    |           | MODAL |           |
    |           |       |           |
    -------------       -------------

    ViewController A shows ViewController B as a Modal
    In VC B we enter a name that needs to be entered to a dataset in VC A
    Steps:
    1. Create a protocol in VC B, AddNameDelegate
    2. Add a method to the protocol to transfer the name: func addName(name: String)
    3. Create a optional variable that will store an instance in VC B named delegate of type AddNameDelegate
    4. In the save/dismiss function call delegate?.addName(nameField.text)
    5. Go to VC A and conform to the AddNameDelegate
    6. Incorporate the addName method in VC A as the compiler will error for not conforming to AddNameDelegate
    7. Almost there, we just need to set VC A as a stored instance in the delegate property in VC B
        Use prepareForSegue for this, give your segue a identifier in your storyboard,
        check if segue.identifier is equal to that identifier in prepareForSegue
        if so, create constant destinationVC that you force cast to your custom class
        and finally set the delegate on VC B to self

    Seven would look like this:
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAddName" {
            let destinationVC = segue.destinationViewController as! AddNameViewController
            destinationVC.delegate = self
        }
    }

*/