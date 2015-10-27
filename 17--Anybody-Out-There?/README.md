# 17 -- Anybody Out There?

## Agenda

### Instructor Commitments

* 12:15 PM - 1:45 PM - Team Lunch

### Daily Rituals

* Standup Meeting ~15min

### Topics

* Intro to networking
* More practice with JSON and moving data to models

## Homework - GitHub Friends


### Assignment Checklist
```markdown

#### Normal Mode

In ```NewFriendViewController```:
* [ ] Create a view that shows a textfield, a button to initiate a search, and a button to cancel.
* [ ] Create two methods, one for the cancel button and one for the search button. Connect them to their respective buttons with the ```addTarget``` function.
* [ ] Place the textfield and two buttons on the screen with ```setFrame```.
* [ ] In the cancel method you create, have the view dismiss itself.
* [ ] In the search method you create, have the view dismiss itself and initiate a search for the username against the GitHub API. Use a delegate to send the data back to the main view controller when the data task 

In ```FriendDetailViewController.m```:
* [ ] Create 4 UILabel properties
* [ ] Initialize UILabel objects for these 4 labels in a custom method called ```configureView``` and set them to their respective property variables.
* [ ] Set each label's text property to 4 different values from the ```friendInfo``` dictionary. Use name and company, plus 2 others of your own choosing.
* [ ] Set each label's frame.
* [ ] Don't forget to add each label as a subview to the main view.

### Hard Mode

In ```FriendDetailViewController.m```:
* [ ] Remove the "name" label and move the friend's name into the title of the view.
* [ ] Add a ```UIImageView``` property to the view controller and configure it to show the user's avatar. Place it on the screen somewhere. The upper right corner might be a good place, or perhaps below the other labels?

#### Journal, Week 2

* [ ] Work on converting your notes/research/bullet points into the beginnings of a tutorial. Use raywenderlich.com's tutorials as inspiration. Yours don't need to be as involved or complicated, but be sure the style is approachable by even inexperienced programmers. Try not to take too much for granted regarding the reader's skill level.

#### Kata 3

* [ ] Finish up working on kata 3. Due tomorrow.
```
