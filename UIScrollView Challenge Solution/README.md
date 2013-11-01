#UIScrollView-Challenge-Solution

##CHALLENGE 8: UISCROLLVIEW

In this challenge students will practice using a UIScrollView including zooming and scrolling. Students will also practice creating a UIImageView object in code.

Create a new single view application called  “UIScrollView Challenge Solution.”

**Problem 1:** Add a UIScrollView to the project and add it as an IBOutlet property to your ViewController. 

**Problem 2:** Add a UIImageView property named globalImageView to your headerfile. Give it a value in viewDidLoad using the image avaliable below. Update the scrollview’s content size to match the size of the frame for the imageView. Add the globaImageView as a subview to the scrollView.

**Problem 3:** Conform to the UIScrollView protocol. Implement the method viewForZoomingInScrollView :and return the globeImageView. Don’t forget to set the scrollView’s delegate property and the maximum and minimum zoom scale.

![World Map](https://github.com/guillaumemaka/CodeCoalition-Challenges/blob/master/UIScrollView%20Challenge%20Solution/UIScrollView%20Challenge%20Solution/worldMap.jpeg?raw=true "World Map")
