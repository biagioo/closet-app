
# closet-app



<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

    <title>ClosetApp</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  <body>
    <div class="wrapper">

        <%= yield %>

      <footer class="branding">
        <font color="black"><small>&copy; 2020 <strong>ClosetApp</strong></small></font>
        <small> <a href="/logout">Log Out</a> </small>
        <small> <a href="/items"> My Closet</a> </small>
      </footer>
    </div>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <!--[if lt IE 7]>
      <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.2/CFInstall.min.js"></script>
      <script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})})</script>
    <![endif]-->
  </body>
</html>










public/main.css

@media screen {
  /* --- Reset Styles --- */
  * {
    list-style: none;
    margin: 0;
    padding: 0;
  }

  html, body {
    height: 100%;
    width: 100%;
  }

  /* --- Welcome Page Styles --- */
  body {
    background-color: rgb(32, 37, 87);
    color: #333;
    font-family: Sans-Serif;
    line-height: 18px;
  }

  .wrapper {
    background: #fff;
    -moz-box-shadow: 0 0 10px rgba(0,0,0,.3);
    -webkit-box-shadow: 0 0 10px rgba(0,0,0,.3);
    box-shadow: 0 0 10px rgba(0,0,0,.3);
    margin: 16px auto;
    max-width: 960px;
    padding: 2.25%; /* 18px / 800px */
    width: 85%;
  }

  h1 {
    font-size: 36px;
    line-height: 54px;
  }

  h2 {
    border-bottom: 2px solid #ccc;
    font-size: 24px;
    line-height: 36px;
    margin-bottom: 16px;
  }

  h3 {
    font-size: 18px;
    line-height: 36px;
  }

  p {
    margin-bottom: 18px;
  }

  .main {
    overflow: hidden;
  }

  .content {
    float: left;
    width: 60%; /* 480px / 800px */
  }

  .sidebar {
    background: #eee;
    border: 1px solid #ccc;
    float: right;
    padding: 2.08333333333%; /* 5px / 240px */
    width: 30%; /* 240px / 800px */
  }

  .sidebar ul {
    font-size: 14px;
  }

  .branding {
    clear: both;
  }

  footer.branding {
    border-top: 2px solid #ccc;
    margin-top: 20px;
    padding-top: 20px;
  }
}

@media screen and (max-width: 600px) {
  .wrapper {
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    width: auto;
  }

  .content, .sidebar {
    float: none;
    width: 100%;
  }

  .sidebar {
    background: transparent;
    border: none;
    border-top: 2px solid #ccc;
    padding: 0;
  }

  h1 {
    font-size: 24px;
    line-height: 36px;
  }

  h2 {
    font-size: 18px;
    line-height: 24px;
  }
}
