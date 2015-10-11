# 06 -- Strategic Homeland Intervention, Enforcement and Logistics Division

## Agenda
### Instructor Commitments
* 3-3:45 PM - Phone Meeting

### Daily Rituals

* Standup Meeting ~15min
* _Change seats!_
* Monday Homework Review/Code Share ~90min

### Topics
* TableViews and UITableViewController
* Intro to the M in MVC (Model-View-Controller)


## Homework - NOC List

Congratulations agent. Your work on the Mission Briefing application was exemplary and has already proven invaluable to getting field agents up to speed on their new missions. The Director has noticed your hard work and has seen fit to increase both your security clearance and your field of responsibility. Your next mission is a top priority for the agency and if completed successfully, could provide you with a valuable shortcut to a supervisor position. Please read below for further info.

Our undercover agents in Eastern Europe are in trouble. The NOC list (Non-official cover) has been leaked and we need our directors to have quick access to the information so we can try to mitigate the damage. Some of the agents on the list have an access level that makes them privy to very sensitive information. We need an application that will present the NOC list's information in a quickly digestable format. Our top agents have been working on it, but we need this done ASAP and you've proven yourself to be quite capable of a quick turnaround.

See the agency's GitHub repository for the project resources. Also contained within will be additional instructions for completing this mission.

The Director herself has given you access to all the agency's resources to complete this mission. We're counting on you agent.

This message will self destruct in 5 seconds.

### Objectives

After completing this assignment, you should…

*

### Assignment Checklist
```markdown
### Normal Mode

#### Storyboard Tasks
    * [ ] The master view should be embedded in a navigation controller
    * [ ] The table view cell prototype should display two labels. One on the left of the cell and one on the right.
    * [ ] The table view cell prototype should have a disclosure indicator
    * [ ] The table view cell prototype should have its reuse indentifier set (hint: this should match the identifier set in "cellForRowAtIndexPath")
    * [ ] The table view prototype cell should segue to the detail view. This should "show" the detail view.
    * [ ] The detail view should have a custom class name of "DetailViewController". See the identity inspector in Interface Builder.
    * [ ] The detail view should have 3 labels
        * [ ] A label in the upper left corner that displays the agent's cover name
        * [ ] A label 10 pts below the cover name label that displays the agent's real name
        * [ ] A label centered horizontally and vertically in the view that displays the agent's access level. It should say "Level #".
        * [ ] These labels should be connected to their appropriate properties in the DetailViewController class.

#### Code Tasks
    * [ ] Agent.m: 1 and 2. Extract the appropriate values from the agent dictionary and set the associated Agent object values
    * [ ] MasterViewController.m: 3. Set the title of the master view
    * [ ] 4. Initialize the agents NSMutableArray
    * [ ] 5. Call loadNocList method
    * [ ] 6. Create a for-in loop to iterate over the agent dictionaries and create Agent objects out of them
    * [ ] 7. Call a method to reload the data for the tableview
    * [ ] 8. Set the segue identifier to match the value used in the storyboard 
    * [ ] 9. Get the index path value for the selected cell
    * [ ] 10. Replace the "0" in the brackets with the row value of the index path object
    * [ ] 11. Use the provided call to the segue object for the destinationViewController to send the Agent object to the detail view controller
    * [ ] 12. Set the number of rows per section for our tableview (we only have 1 section)
    * [ ] 13. Add the appropriate cell identifier in the dequeue method call
    * [ ] 14. Get a handle to the appropriate Agent object from the agents array
    * [ ] 15. Set the two cell labels to their appropriate values from the Agent object (the cover name and the real name)
    * [ ] 16. Send something to the object calling this method. What is this method supposed to return?
    * [ ] 17. Connect this property to its associated storyboard object
    * [ ] 18. Create two additional properties for the other storyboard objects and connect them as well
    * [ ] 19. Extract the agent's last name from the cover name property
    * [ ] 20. Set the title of this view to "Agent #", where # is the agent's last name
    * [ ] 21. Set the three labels to their appropriate values from the Agent object
    * [ ] 22. Call the configureView method

#### Journal, Week 1
   * [ ] created branch in `USERNAME.github.io` named `journal-week-1`
   * [ ] created new file named `journal-week-1.md`
   * [ ] commited, pushed, and opened PR to `master`
   * [ ] added draft journal entry
```

### Journal, Week 1

You've just completed 1 hard week of work at TIY and I hope you feel "comfortably uncomfortable" on the road to becoming a junior iOS developer. Make a new branch in your USERNAME.github.io repo called _journal-week-1_ and add this entry as a markdown file. Don't forget to create a PR (pull request) for that branch in the repo and paste a link to it in the WIP (work-in-progress) issue in the class repo. Here are some suggestions for topics:

* What do developers do? What principles of a developer have you learned?
* Explain  how the user experience of your app should impact how you design and construct your code. How should user-focused considerations affect your code structure?
* Explain the branching principle in Git. Why do we branch? What does branching enable for our codebase?