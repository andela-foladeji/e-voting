# e-voting
An easily customizable electronic voting app written with JSP to facilitate voting in tertiary instituitions

# How To Use
1. Clone the repository
2. If you have Netbeans, you can import it to your netbeans project
3. Set up your TomCat configuration
4. Add [mysql connector](https://dev.mysql.com/downloads/connector/j/) to the project libraries
5. Add [json library](https://github.com/stleary/JSON-java) to the project libraries
6. Import the sql file to your mysql database
6. Click on run

# Curent functionalities
1. Admin can sign in (password is not encrypted for now)
2. Admin can create elections and add posts
3. Admin can add candidates for a post
4. Admin can change the status of an election and publish result
5. Admin can view result
6. Users can login and see all elections they are eligible to participate in
7. Users can vote

# Improvements
1. Encrypt password (I was just lazy to do this)
2. Admin should be able to register other admins
3. Admins can upload voters via excel sheets and assign the elections they can participate in
4. Improve UI/UX
5. Users can view results of elections

# Note
This was my first JSP project so I'm quite sure I didn't follow best practises in some situations
