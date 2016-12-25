<%-- 
    Document   : index (Homepage)
    Created on : Dec 25, 2016, 4:08:52 PM
    Author     : Oladeji Femi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-VOTING</title>
        <link rel="stylesheet" href="css/materialize.min.css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/materialize.min.js" type="text/javascript"></script>
    </head>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <nav>
                <div class="nav-wrapper">
                  <a href="#" class="brand-logo">E-VOTING</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="about.html">About</a></li>
                  </ul>
                </div>
            </nav>
            <div class="row">
                <div class="col s6">
                    <img style="width:100%" src="img/vote.jpg"/>
                    <p>This project is to facilitate voting in tertiary institutions</p>
                </div>
                <div class="col s6">
                    <h2 class="center-align">LOGIN</h2>
                    <form class="col s12">
                        <div class="row">
                            <div class="input-field col s12">
                              <input id="username" type="text">
                              <label for="username">Username/Matric Number</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                              <input id="password" type="password">
                              <label for="password">Password</label>
                            </div>
                        </div>
                        <div class="row">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Login</button>
                        </div>
                    </form>
                </div>
            </div>
            <footer>
                <div class="row" style="height:50px; background-color: #ee6e73">
                    <p class="center-align" style="color:#fff; line-height:50px;">Copyright 2016 <a style="color: yellow" href="https://github.com/andela-foladeji">femidotexe</a></p>
                </div>
            </footer>
        </div>
    </body>
</html>
