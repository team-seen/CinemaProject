<%-- 
    Document   : confirmPage
    Created on : Nov 10, 2023, 7:36:34 AM
    Author     : bstar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>

        <jsp:include page="menuBarTemplate.jsp" />
        <table style="width: 100%">
            <tr>
                <td style="width: 15%"><br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td class="auto-style37"><br class="auto-style41" />
                    <br class="auto-style41" />
                    <span class="auto-style41">
                        <br />
                        <p style="color: #4CAF50; " class="auto-style48"><i class="fas fa-check-circle"></i> 
                    </span>
                    <span class="auto-style45">
                        <span class="auto-style50">Booking confirmed</span></p>
                        <br class="auto-style49">
                    </span>
                </td>
                <td style="width: 15%">&nbsp;</td>

            </tr>
            <tr>
                <td class="auto-style37" colspan="3" style="width: 100%">
                    <hr style="border: none; border-top: 1px solid #888; width: 100%; margin-top: 10px; margin-bottom: 10px;">
                    <div class="auto-style44">
                        <span class="auto-style52">"Thank you for choosing UAEU CINEMA. We hope you have a fantastic time!"</span><br class="auto-style51" />
                        <span class="auto-style52"><strong>Your Order Number:</strong> order number</span><br class="auto-style51" />
                    </div>
                    <hr style="border: none; border-top: 1px solid #888; width: 100%; margin-top: 10px; margin-bottom: 10px;">
                    <div class="auto-style44">
                        <br />
                        <span class="auto-style42"><strong>PLEASE READ THE FOLLOWING INFORMATION ABOUT YOUR ORDER.</strong></span>
                    </div>
                </td>
            </tr>

            <tr>
                <td style="height: 266px; width: 15%"></td>
                <td rowspan="2" class="auto-style25">
                    <strong>
                        <span class="auto-style45"><br />
                            <br />
                            <br />
                        </span>
                        <span class="auto-style46">CUSTOMER DETILS:</span><span class="auto-style45"><br />
                            <c:if test="${not empty user}">
                                <br />
                                Name:  ${userRecord.fname} ${userRecord.lname} <br />
                                <br />
                                <br />
                                Email: ${userRecord.email}<br />
                                <br />
                                <br />
                                Phone No.:${userRecord.phone_number} <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </c:if>

                        </span>
                        <span class="auto-style46">BOOKING DETAILS</span><span class="auto-style38">:</span><span class="auto-style45"><br />
                            <br />
                            <br />
                        </span><span class="auto-style38">
                            <span class="auto-style45">Movie name:<br />
                            </span>
                        </span><br class="auto-style45" />
                        <br class="auto-style45" />
                    </strong><span class="auto-style45"><strong>Number of seats:</strong></span><span style="color: rgb(255, 255, 255); font-family: " Trebuchet MS&quot;, &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, &quot;Lucida Sans&quot;, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(26, 26, 26); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><span class="auto-style39"><strong>&nbsp;</strong></span></span><span class="auto-style39" style="color: rgb(255, 255, 255); font-family: " Trebuchet MS&quot;, &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, &quot;Lucida Sans&quot;, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(26, 26, 26); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong><br />
                            <br />
                            <br />
                            Booking date:<br />
                            <br />
                            <br />
                            Total price:</strong></span><strong><br class="auto-style45" style="color: rgb(255, 255, 255); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(26, 26, 26); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" />
                        <br class="auto-style45" />
                        <br class="auto-style45" />
                    </strong>
                    <br class="auto-style45" />
                </td>
                <td style="height: 266px; width: 5%"></td>
            </tr>
            <tr>
                <td style="height: 66px; width: 15%;"></td>
                <td style="height: 66px"></td>
            </tr>
        </table>
    </body>
</html>
