<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <body>
        
        <%--inclide the menu bar  --%>
        <jsp:include page="menuBarTemplate.jsp" />
     
        
        <table style="width:100%; margin-top:120px; height: 1000px;">
            <tr>
                <td class="auto-style34" style="height: 103px; width: 7%;">&nbsp;</td>
                <td class="auto-style34" style="height: 103px; " colspan="2"><strong>${movie.title}
                   </strong></td>
            </tr>
            <tr>

                <td style="width: 10%; height: 395px"></td>
                <td style="width: 20%; height: 395px">
                    <img alt="FILM" height="414" src="${movie.poster_url}" width="300" class="auto-style36"></td>
                <td style="text-align: center; width: 70%;">
                    <div style="margin: 0 auto; width: 660px;">
                        <iframe width="660" height="415" src="${movie.trailer_url}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipbo${movie.trailer_url}ard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </td>




            </tr>
            <tr>
                <td style="height: 132px;" class="auto-style44" colspan="3">&nbsp;

                    <button onclick="showTimings()" class="button">
                        <div class="auto-style48">
                            <strong>View Showtimes</strong>
                        </div>
                    </button>

                </td>
            </tr>
            <tr>
                <td style="width: 10%">&nbsp;</td>
                <td style="width: 20%">
                    <strong><span class="auto-style41"><br><br><br><br></span>
                        <span class="auto-style42">Genre: ${movie.genre}
                            <br><br><br>Running Time: ${movie.duration} min<br><br><br>Release Date: ${movie.release_date}<br>
                            <br><br>Starring: <br><br></span> 
                        <br class="auto-style42">
                    </strong><span class="auto-style42"><strong>Language: ${movie.language}
                            <br><br></strong></span><strong> <br class="auto-style42">
                        <span class="auto-style42">Subtitles: 
                        </span><span class="auto-style41"><br><br></span>
                        <span class="auto-style40"> <br>
                        </span></strong> <br>
                </td>
                <td class="auto-style42" style="width: 50%">
                ${movie.description} 
                </td>
            </tr>
            <tr id="showtimes">
                <td>&nbsp;</td>
                <td class="auto-style34" colspan="2"><strong>
                 ${movie.title}- SHOWTIMES</strong></td>
            <tr>
                <td>&nbsp;</td>
                <td style="width: 20%"><strong><br><br><br class="auto-style45"></strong>
                    <span class="auto-style45"><strong><span class="auto-style46">Abu 
                                Dhabi Mall - Abu Dhabi</span><br><br><br><font size="3">MAX</font></strong></span><strong><br class="auto-style45">
                    </strong></td>
                <td>&nbsp;</tr>
            <tr>
                <td>&nbsp;</td>
                <td style="width: 20%">
                    <div style="position: relative; display: inline-block;">
                        <a href="bookingSeatPage.jsp">

                            <button style="background-color: #D415BE; color: white; border: none; padding: 0px; width: 60px; height: 25px; font-weight: bold; border-radius: 10px; margin-right: 10px;" class="auto-style47" onmouseover="this.style.backgroundColor = '#a5129c';" onmouseout="this.style.backgroundColor = '#D415BE';">7:00 PM</button><button style="background-color: #D415BE; color: white; border: none; padding: 0px; width: 60px; height: 25px; font-weight: bold; border-radius: 10px; margin-left: 10px;" class="auto-style47" onmouseover="this.style.backgroundColor = '#a5129c';" onmouseout="this.style.backgroundColor = '#D415BE';">7:00 PM</button>
                        </a></div>
                </td>






                <td>&nbsp;</td>
        </table>


    </body>
</html>
