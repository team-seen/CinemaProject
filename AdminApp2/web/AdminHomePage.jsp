<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta content="en-us" http-equiv="Content-Language" />
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <title>Untitled 1</title>
        <style type="text/css">
            .auto-style1 {
                text-align: center;
                font-size: 50pt;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }
            .auto-style2 {
                font-size: 15pt;
            }
            .auto-style3 {
                background-color: #111111;
            }
            .button-container {
                text-align: center;
            }
            .button {
                display: inline-block;
                padding: 10px 20px;
                background-color: white; /* White background color */
                color: #111111; /* Text color */
                text-align: center;
                text-decoration: none;
                font-size: 20px; /* Increased font size */
                margin: 4px 2px;
                cursor: pointer;
                border: none;
                border-radius: 15px; /* Rounded corners */
            }
            .auto-style4 {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                display: inline-block;
                padding: 10px 20px;
                background-color: #111111; /* gray color */
                color: white;
                text-align: center;
                text-decoration: none;
                font-size: 25px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }
        </style>
    </head>
    <body style="margin-bottom: 10px; background-color: #1A1A1A; color: #FFFFFF; margin-left: 0; margin-right: 0; margin-top: 0;">
        <table style="width: 100%; height: 420px">
            <tr>
                <td class="auto-style3" colspan="3" style="height: 54px"></td>
            </tr>
            <tr>
                <td colspan="3" style="height: 13px"></td>
            </tr>
            <tr>
                <td style="width: 33%; height: 107px"></td>
                <td class="auto-style1" style="height: 107px; width: 33%">Admin Panel<br />
                    <span class="auto-style2">logged in as admin user</span></td>
                <td style="width: 33%; height: 107px"></td>
            </tr>
            <tr>
                <td class="button-container">
                    <form action="AdminUserServlet" method="post">
                        <strong>
                            <button type="submit" class="button">
                                <strong>
                                    <span class="auto-style23">&nbsp;</span><span class="auto-style30">user management&nbsp;&nbsp; &nbsp;</span><span class="auto-style23">&nbsp; </span>
                                </strong>
                            </button>
                        </strong>
                    </form>
                </td>
               
                <td class="button-container">
                    <form action="AdminMovieServlet" method="post">
                        <strong>
                            <button type="submit" class="button">
                                <strong>
                                    <span class="auto-style23">&nbsp;</span><span class="auto-style30">Movie management&nbsp;&nbsp; &nbsp;</span><span class="auto-style23">&nbsp; </span>
                                </strong>
                            </button>
                        </strong>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
