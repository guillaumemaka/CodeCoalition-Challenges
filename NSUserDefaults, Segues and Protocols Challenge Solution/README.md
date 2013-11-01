#NSUserDefaults, Segues and Protocols Challenge Solution.

---

##CHALLENGE 12: NSUSERDEFAULTS, SEGUES AND PROTOCOLS

In this challenge we will practice creating a protocol, segues and NSUserDefaults for data persistence. Why are we practicing a protocol again? Getting the hang of protocols is difficult and is a major design pattern in iOS. It’s certainly worth practicing!

Create a new single view project entitled: NSUserDefaults, Segues and Protocols Challenge Solution.

We recommend watching the first video on how to setup the storyboard since it is a little tricky!

###Problem 1: Setup the storyboard.

* Add 2 UIViewControllers. Create ViewController class files to manage them. Name these classes SignInViewController and CreateAccountViewController. Update the class for each ViewController in the identity inspector. 
* Reposition the ViewControllers so the application starts with the SignInViewController. Use the white arrow to determine where the application starts.
* Add modal Segues from the SignInViewController to the CreateAccountViewController and the Controller. Name the segues toCreateAccountViewController and toViewController.
* Embed the SignInViewController into a UINavigationController.
* Add 2 UITextFields to the SignInViewController with placeholder text for username and password. 
* Add a UIButton to the SignInViewController entitled login.
* Add a UIBarButtonItem to the SignInViewController entitled “create account.”
* Add 3 UITextFields to the CreateAccountViewController with placeholder text username, password and confirm password.
* Add 2 UIButtons to the CreateAccountViewController entitled “Create Account” and “Cancel.”
* Add 4 UILabels to ViewController file. Entitle 2 of these Username and Password. When hooking up these UILabels only hook up 2 of them. Specifically, hook-up the untitled labels. 
* Hook-up the UIView elements to their proper header file. The UITextFields should be IBOutlets. The UIBarButtonItem and the UIButton’s should be IBActions

###Problem 2: Setup the Segues

Call the Segues in code so that when the user presses the “create account” UIButton the CreateAccountViewController is presented. 
When the user presses the login button the ViewController is presented.

###Problem 3: Setup the Protocols

* Add a protocol to the CreateAccountViewController with 2 methods named didCancel and didCreateAccount. 
* In the CreateAccountViewController header file create a property named delegate.
* Setup the SignInViewController to conform to this protocol. Implement the methods named didCancel and didCreateAccount in the SignInViewController.m file. 
* Set the delegate property for the CreateAccountViewController in the prepareForSegue method in the the file SignInViewController.m.
* Both the didCancel and didCreateAccount methods should implement the method dismissViewControllerAnimated:completion. Call didCancel and didCreateAccount methods on the delegate property in the correct IBAction in CreateAccountViewController. This way regardless of whether the user presses the “create account” button or the cancel button the CreateAcccountViewController view will be dismissed.

###Problem 4: Setup data persistance with NSUserDefaults

* Add #defines in the CreateAccountViewController.h file for @”username” and @”password” named USER_NAME and USER_PASSWORD. 
* Persist the information from the username TextField and the Password TextField using NSUserDefaults. Make sure to use the #defines for the keys when saving information with the method setObject:forKey.
* Use an if statement to confirm that all of the fields have had information added. Also confirm that the password and confirm password TextField’s text is the same. If the entered information does not meet all of these conditionals use a UIAlertView to tell the user a problem has occurred. To test equality between two strings use the following method:
* isEqualToString: (NSString *)

###Problem 5: Login Functionality

* In the SignInViewController when the users presses the login button access NSUserDefaults to retrieve the saved password and username. Use an if statement to check if the username TextField’s text property is the same as what was saved.
* Also confirm that the password TextField’s text property is the same as what was saved. If the conditional is true perform the segue to the ViewController. If it is not throw an error using UIAlertView.

###Problem 6: Update the ViewController’s labels to display the username and password saved to NSUserDefaults.
