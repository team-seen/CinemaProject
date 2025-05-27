
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta content="ar-bh" http-equiv="Content-Language" />
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <title>UAEU&nbsp; CINEMA سينما</title>
        <style type="text/css">

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

            .navbar {
                position: fixed;
                top: 0;
                width: 100%;
                background-color: #1A1A1A;
                color: #1A1A1A;
                z-index: 1000; /* Adjust the z-index as needed */
                text-align: center;
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

            .zoom {
                transition: transform .2s;
            }

            .zoom:hover {
                transform: scale(1.1);
            }
            .button {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                background-color: black;
                color: red;
                padding: 20px 30px;
                border-radius: 8px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
                font-size: 25px; /* Initial font size */

            }

            .button:hover {
                background-color: #1A1A1A;
            }

            .auto-style13:hover strong {
                color: gray;
            }
            .auto-style22 form button:hover strong,
            .auto-style22 form button:hover strong span,
            .auto-style25 form button:hover strong {
                color: gray !important;
            }

            .auto-style1 {
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
                font-size: 40pt;
            }

            .auto-style2 {
                color: #F9F9F9;
            }
            .auto-style3 {
                text-decoration: none;
            }
            .auto-style5 {
                color: #F9F9F9;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
            }
            .auto-style6 {
                color: #F9F9F9;
                font-family: Impact, Haettenschweiler, "Arial Narrow Bold", sans-serif;
                font-size: 40pt;
            }
            .auto-style7 {
                text-align: center;
            }
            .auto-style8 {
                font-size: 20pt;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
                text-align: left;
            }
            .auto-style10 {
                font-size: 15pt;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
                text-align: center;
            }
            .image-container {
                position: relative;
                text-align: center;
                color: white;
            }

            .text-overlay {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-size: 20px;
            }
            .auto-style11 {
                font-size: 15pt;
                font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif;
                text-align: left;
            }
            :root {
                --color-seating-plan-seat-standard: #bcbcbc;
                --color-seating-plan-seat-selected: #D415BE;
            }

            .center {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .seating-plan-table {
                border-collapse: separate;
                border-spacing: 2px;
                width: 30%;
            }
            .seat-standard {
                width: 50px;
                height: 50px;
                background-color: #bcbcbc;
                text-align: center;
                line-height: 50px;

                font-size: 0; /* To hide the text content */
                border: 1px solid black;
                box-sizing: border-box;

            }
            .seat-selected {
                background-color: var(--color-seating-plan-seat-selected);
            }
            .auto-style13 {
                text-align: right;
            }
            .auto-style14 {
                text-align: center;
                color: #BCBCBC;
            }
            .auto-style16 {
                color: #D415BE;
            }
            .auto-style17 {
                color: #555555;
            }
            .auto-style18 {
                text-align: left;
            }
        </style>

        <script>
            function smoothScroll(target) {
                const element = document.querySelector(target);
                element.scrollIntoView({behavior: 'smooth'});
            }
        </script>

    </head>


    <body style="margin-bottom: 10px; background-color: #1A1A1A; color: #FFFFFF; margin-left: 0; margin-right: 0; margin-top: 0;">

        <table class="auto-style31">
            <tr CLASS="navbar" >
                <td style="width: 30%;" class="auto-style13" rowspan="2">
                    &nbsp;</td>
                <td style="width: 40%;" class="auto-style18" rowspan="2" colspan="2">
                    &nbsp;
                    <a href="homePage.jsp" class="auto-style3">
                        <span class="auto-style6"><strong>UAEU</strong></span><strong><br class="auto-style5" />
                        </strong>
                        <span class="auto-style33">
                            <span class="auto-style2">
                                <font size="2">&nbsp; C I N E M A سينــمــا</font> </span>
                        </span>
                    </a>
                </td>
            </tr>

            <tr>
                <td style="width: 30%"><strong><br class="auto-style1" />
                    </strong></td>
            </tr>

            <tr>
                <td colspan="4"><br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <div class="slider-container" style="margin-top: 50px;">

                    <td class="auto-style8" style="width: 30%"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BOOK TICKETS<br />
                            &nbsp;</strong></td>
                    <td class="auto-style8" rowspan="2" colspan="2"><strong><br />
                            <font size="2">&nbsp;</font></strong> </td>
                    <td style="width: 40%">&nbsp;</td>
                </div>

            </tr>
            <tr>
                <td class="auto-style11" style="width: 30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="CHAIR" height="20" src="pic/CHAIR.png" width="20" />&nbsp;<strong>CHOOSE 
                        SEATS </strong>                 </td>
                <td class="auto-style8"><strong><br />
                        <font size="2">&nbsp;</font></strong> </td>
            </tr>


            <tr>
                <td class="auto-style10" colspan="4">
                    <div class="image-container" style="margin: 0; padding: 0;">
                        <img src="https://uae.voxcinemas.com/assets/images/booking/seats-screen-dark@2x.png" style="width: 30%;" />
                        <div class="text-overlay"><strong>SCREEN</strong></div>
                    </div>

                </td>
            </tr>



            <tr>
                <td class="auto-style10" colspan="4">
                    &nbsp;</td>
            </tr>



            <td class="auto-style10" style="width: 30%">
                &nbsp;</td>
            <td class="auto-style10" style="width: 40%" colspan="2">
                <table style="width: 100%">

                    <tr>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A1</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A2</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A3</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A4</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A5</td>
                        <td style="padding: 20px;"></td> <!-- Empty space for people to walk through -->
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A6</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A7</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A8</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A9</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">A10</td>
                    </tr>
                    <tr>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B1</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B2</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B3</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B4</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B5</td>
                        <td style="padding: 20px;"></td> <!-- Empty space for people to walk through -->
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B6</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B7</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B8</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B9</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">B10</td>
                    </tr><tr>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C1</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C2</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C3</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C4</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C5</td>
                        <td style="padding: 20px;"></td> <!-- Empty space for people to walk through -->
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C6</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C7</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C8</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C9</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">C10</td>
                    </tr>
                    <tr>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D1</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D2</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D3</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D4</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D5</td>
                        <td style="padding: 20px;"></td> <!-- Empty space for people to walk through -->
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D6</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D7</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D8</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D9</td>
                        <td class="seat-standard" onclick="toggleSeatSelection(this)">D10</td>
                    </tr>

                </table>

            </td>
            <td class="auto-style10" style="width: 30%">
                &nbsp;</td>

            <tr>



                <td class="auto-style10" colspan="4">
                    &nbsp;</td>
            </tr>

            <tr>
                <td style="width: 25%">&nbsp;</td>
                <td class="auto-style14" valign="bottom" colspan="2">• 				<font size="2">AVALIBLE SEAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
                    <span class="auto-style17">
                        <span class="auto-style13">•</span> </span> <font size="2">
                        <span class="auto-style17">TAKEN SEAT&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="auto-style16">&nbsp;
                            <span class="auto-style13">•</span> YOUR SEAT</span></font></td>
                <td style="width: 20%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="width: 10%; height: 31px">Your Selected Seats</td>
                <td style="width: 20%; height: 31px"></td>
                <td style="width: 20%; height: 31px"></td>
                <td style="width: 50%; height: 31px"></td>
            </tr>
            <tr>
                <td id="selected-seats-info" style="text-align: center;">No selected seat</td>
                <td id="selected-seats-info" style="text-align: center;">&nbsp;</td>
                <td style="width: 20%; height: 31px">&nbsp;</td>
                <td style="width: 20%; height: 31px">&nbsp;</td>
                <td style="width: 50%; height: 31px">&nbsp;</td>
            </tr>
            <tr>

                <%--confirm button takes you to confirm page  --%>




                <form action="userRecord" method = "post" >
                    <td colspan="7" style="text-align: center;">
                        <button type="submit" >
                            <span class="button" style="background-color: #D415BE; color: white; padding: 15px 25px; font-size: 17px;"   ><strong>CONFIRN SEAT</strong></span>&nbsp;&nbsp;
                        </button>
                    </td>
                </form>
                <td style="width: 20%; height: 31px">&nbsp;</td>
                <td style="width: 20%; height: 31px">&nbsp;</td>
                <td style="width: 50%; height: 31px">&nbsp;</td>
            </tr>

        </table>

        <script>
            let selectedSeats = [];
            const seatPrice = 49;

            function toggleSeatSelection(element) {
                if (element.classList.contains('seat-selected')) {
                    element.classList.remove('seat-selected');
                    const index = selectedSeats.indexOf(element.textContent);
                    if (index > -1) {
                        selectedSeats.splice(index, 1);
                    }
                } else {
                    element.classList.add('seat-selected');
                    selectedSeats.push(element.textContent);
                }

                let seatCount = 0;
                if (selectedSeats.length > 0) {
                    seatCount = selectedSeats.length;
                    totalPrice = seatPrice * seatCount;
                } else {
                    totalPrice = 0;
                }

                const displayText = seatCount > 0 ? `${seatCount}x - ${seatPrice} AED per person: ${totalPrice} AED` : 'No selected seat';
                document.getElementById('selected-seats-info').textContent = displayText;
            }

            function confirmSeats() {
                if (totalPrice > 0) {
                    alert(`Total price is ${totalPrice} AED. Seats confirmed!`);
                } else {
                    alert('Please select at least one seat.');
                }
            }
        </script>

        <tr>
            <td colspan="7" style="text-align: center;">
            </td>
        </tr>
    </body>
</html>