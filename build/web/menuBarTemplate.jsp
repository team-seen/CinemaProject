<%-- 
  menu bar 
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>UAEU&nbsp; CINEMA سينما</title>
        <style type="text/css">

            .auto-style13 {
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
                font-size: 15pt;
                color: #FFFFFF;
            }

            .auto-style13 ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                color: #FFFFFF;
            }

            .auto-style13:hover ul {
                display: block;
            }

            .auto-style13 li {
                float: none;
                display: block;
            }

            .auto-style13 li a {
                display: block;
                color: black;
                text-align: left;
                padding: 12px 16px;
                text-decoration: none;
            }

            .auto-style13 li a:hover {
                background-color: #f1f1f1;
            }

            .auto-style14 {
                font-size: 10pt;
                text-align: center;
                color: #FFFFFF;
            }

            .location-menu .location-list {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                color: black;
            }

            .location-menu:hover .location-list {
                display: block;
            }

            .location-menu-item {
                float: none;
                display: block;
            }

            .location-menu-item a {
                display: block;
                color: black;
                text-align: left;
                padding: 12px 16px;
                text-decoration: none;
            }

            .location-menu-item a:hover {
                background-color: #f1f1f1;
            }

            /* Menu style for the Food & Drinks */
            .food-menu .food-list {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                color: black;
            }

            .food-menu:hover .food-list {
                display: block;
            }

            .food-menu-item {
                float: none;
                display: block;
            }

            .food-menu-item a {
                display: block;
                color: black;
                text-align: left;
                padding: 12px 16px;
                text-decoration: none;
            }

            .food-menu-item a:hover {
                background-color: #f1f1f1;
            }
            .slider-container {
                position: relative;
                max-width: 100%;
                overflow: hidden;
                margin: auto;
            }

            .slider {
                display: flex;
                transition: transform 0.5s ease;
            }

            .slide {
                min-width: 100%;
                overflow: hidden;
            }

            .slide img {
                width: 100%;
            }

            .slide-content {
                position: absolute;
                bottom: 10%;
                left: 50%;
                transform: translateX(-50%);
                text-align: center;
                color: white;
                font-size: 24px;
            }

            .prev,
            .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                padding: 16px;
                margin-top: -22px;
                color: white;
                font-weight: bold;
                font-size: 20px;
                transition: 0.6s ease;
                border-radius: 0 3px 3px 0;
                user-select: none;
            }

            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            .prev:hover,
            .next:hover {
                background-color: rgba(0, 0, 0, 0.8);
            }

            .auto-style22 {
                text-align: right;
            }
            .auto-style23 {
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
                font-size: 14pt;
                color: #FFFFFF;
            }
            .auto-style25 {
                text-align: left;
            }

            .auto-style26 {
                color: #FFFFFF;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }
            .auto-style28 {
                font-size: 12pt;
            }

            .auto-style30 {
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
                font-size: 12pt;
                color: #FFFFFF;
            }

            .navbar {
                position: fixed;
                top: 0;
                width: 100%;
                background-color: #333333;
                color: #FFFFFF;
                z-index: 1000; /* Adjust the z-index as needed */
            }

            .navbar td {
                vertical-align: bottom;
            }

            .auto-style13 ul {
                padding: 0;
            }

            .location-list,
            .food-list {
                display: none;
            }

            .location-menu:hover .location-list,
            .food-menu:hover .food-list {
                display: block;
            }

            .auto-style31 {
                position: fixed;
                top: 0;
                width: 100%;
                background-color: #1A1A1A;
                color: #FFFFFF;
                z-index: 1000; /* Adjust the z-index as needed */
            }

            .zoom {
                transition: transform .2s;
            }

            .zoom:hover {
                transform: scale(1.1);
            }


            .auto-style13:hover strong {
                color: gray;
            }
            .auto-style22 form button:hover strong,
            .auto-style22 form button:hover strong span,
            .auto-style25 form button:hover strong {
                color: gray !important;
            }

            .auto-style37 {
                font-size: 40pt;
            }
            .auto-style38 {
                font-family: Impact, Haettenschweiler, "Arial Narrow Bold", sans-serif;
            }

            .auto-style41 {
                font-size: 10pt;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }
            .auto-style42 {
                font-size: 12pt;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }

            .auto-style44 {
                text-align: center;
            }

            .button {
                background-color: #D415BE;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
                font-size: 16px; /* Modify the font size as needed */
            }

            .button:hover {
                background-color: #a5129c;
            }



            .auto-style45 {
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }
            .auto-style46 {
                text-align: center;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }
            .auto-style48 {
                text-align: center;
                font-size: 20pt;
            }
            .auto-style49 {
                font-size: 20pt;
            }
            .auto-style50 {
                font-size: 30pt;
            }
            .auto-style51 {
                font-size: 15pt;
            }
            .auto-style52 {
                font-size: 15pt;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }



            .auto-style53 {
                text-decoration: none;
            }
            .auto-style54 {
                color: #FFFFFF;
            }

            table {
                font-family: Arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                text-align: center;
                padding: 12px;
            }

            tr:nth-child(even) {
                background-color: #1A1A1A;
            }

            th {
                background-color: #D415BE;
                color: white;
            }

            h2 {
                text-align: center;
                font-family: Arial, sans-serif;
            }

            table.myTable {
                border: 1px solid #6D6D6D;
            }
            table.myTable td, table.myTable th {
                border: 0.5px solid #6D6D6D;
            }

            table.center {
                margin-left: auto;
                margin-right: auto;
            }

        </style>

        <script>
            function showTimings() {
                const element = document.querySelector('#showtimes');
                element.scrollIntoView({behavior: 'smooth'});
            }
        </script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    </head>


    <body style="margin-bottom: 10px; background-color: #1A1A1A; color: #FFFFFF; margin-left: 0; margin-right: 0; margin-top: 0;">
        <table class="auto-style31" style="height: 10%">
            <tr>
                <td style="width: 30%;" class="auto-style14" rowspan="2">
                    <a href="homePage.jsp" style="text-decoration: none; color: inherit;">

                        <span class="auto-style37"><span class="auto-style38"><strong>
                                    UAEU</strong></span><strong><br class="auto-style38"></strong>
                        </span></a>C I N E M A &#1587;&#1610;&#1606;&#1600;&#1600;&#1605;&#1600;&#1600;&#1575;</td>
                <td class="auto-style13" style="width: 6%; height: 64px;" valign="bottom">
                    &nbsp;</td>
                <td class="auto-style13" style="width: 13%; height: 64px;" valign="bottom">
                    <a href="homePage.jsp" class="auto-style53">

                        <strong><span class="auto-style54" >Home</span></strong></a>
                </td>
                <td class="auto-style13" style="width: 13%; height: 64px;" valign="bottom">
                    <a href="MovieDetailsServlet#movies" class="auto-style53" >
                        <strong><span class="auto-style54">MOVIES</span></strong><span class="auto-style54">
                        </span>
                    </a>
                </td>

                <td class="auto-style13" style="width: 13%; height: 64px;" valign="bottom">
                    <strong>Account</strong></td>
                <td style="width: 6%"></td>






                <%-- if username session not null it means the user logged in, so display "myaccount" button instead of "login" and "singup" button,
                --%>
                <td style="height: 64px; width: 15%;" valign="bottom" class="auto-style22">
                    <c:choose>
                        <c:when test="${empty loggedInUser}">

                            <form action="loginPage.jsp">
                                <strong>
                                    <button type="submit" style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
                                        <strong>
                                            <span class="auto-style23">&nbsp;</span><span class="auto-style30">LOGIN&nbsp;&nbsp; |&nbsp;</span><span class="auto-style23">&nbsp; </span>
                                        </strong> 
                                    </button>
                            </form>
                        </td>
                        <td style="height: 64px; width: 15%;" valign="bottom" class="auto-style25">
                            <form action="signupPage.jsp">
                                <button type="submit" style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
                                    <span class="auto-style28">
                                        <span class="auto-style26"><strong>SIGNUP</strong></span>&nbsp;&nbsp;
                                    </span>
                                </button>
                            </form>

                        </c:when>
                        <c:otherwise>   
                            <form action="UserServlet" method = "post" >
                                <button type="submit" style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
                                    <span class="auto-style26"><strong>MY ACCOUNT</strong></span>&nbsp;&nbsp;
                                </button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </td>


            </tr>
        </table>
    </body>
</html>
