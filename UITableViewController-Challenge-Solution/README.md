#UITableViewController-Challenge-Solution

##CHALLENGE 6: UITABLEVIEWCONTROLLER

In this project students will check their understanding of UITableViewController and practice using the UITableViewDataSource protocol.

Create a new single view application called  “UITableViewController Challenge Solution.”

**Problem 1**: Using terminal, commit your changes utilizing version control. Create a github repository so that you have a remote location to save your code. Push your code up to github.

**Problem 2:** Delete both the ViewController scene in your storyboard as well as your .h and .m ViewController class files in the project navigator. Make sure to move them to the trash but don't remove your references.

**Problem 3:** Add a UITableViewController to your storyboard file and create a subclass of UITableViewController. Be sure to change the class of your UITableViewController in the identity inspector.

**Problem 4:** Adjust the data source methods numberOfSectionsInTableView: and numberOfRowsInSection:. The TableView should display three sections:

* Section 0 should have 2 rows
* Section 1 should have 1 row 
* Section 2 should have 3 rows

**Problem 5:** Adjust the data source method cellForRowAtIndexPath:.
 
* Section 1's cells should display the text “I am in section 0”.
* Section 2's cells should display “another section”.
* Section 3's cells  should display the word cell and the current row number. Use a format string and pass in NSIndexPath’s property row. 

**Problem 6:** Commit and push your changes up to github!

**Extra Credit:** Update the cell’s textColor for section 1 to be red, the cells in section 2 should be blue, and cells in section 3 should be yellow.
