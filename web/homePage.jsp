
<%@page import="java.util.List"%>
<%@page import="Beans.MovieBeans"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <body>



        <%-- seperate the menu page to avoid redundancy, inlude the menu page--%>
        <jsp:include page="menuBarTemplate.jsp" />


        <div class="slider-container" style="margin-top: 100px;">
            <div class="slider">
                <div class="slide">
                    <img src="pic\anime.jpg" alt="First Photo" />
                    <div class="slide-content" style="font-size: 50pt; text-align: center; color: #FFFFFF; font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;">
                        Your Name<br />
                        <span class="auto-style11">
                            <span class="auto-style16">Life |&nbsp; Drama&nbsp;&nbsp; ?&nbsp; 1h 30m - 12+</span>
                        </span>
                        <br></br>
                        <a href="bookingPage.html">
                            <button style="border-style: none; border-color: inherit; border-width: medium; background-color: black; color: red; padding: 20px 30px; border-radius: 8px; cursor: pointer; font-weight: bold;" class="auto-style29">
                                <strong>Book Now</strong>
                            </button>
                        </a>
                    </div>
                </div>

                <div class="slide">
                    <img src="pic\wp10165034 (2) (1).jpg" alt="Second Photo" />
                    <div class="slide-content" style="font-size: 50pt; text-align: center; color: #FFFFFF; font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;">
                        MOUSE<br />
                        <span class="auto-style11">
                            <span class="auto-style16">Crime |&nbsp; Drama&nbsp;&nbsp; ?&nbsp; 3h 30m - 15+</span>
                        </span>
                        <br></br>
                        <a href="bookingPage.html">
                            <button style="border-style: none; border-color: inherit; border-width: medium; background-color: black; color: red; padding: 20px 30px; border-radius: 8px; cursor: pointer; font-weight: bold;" class="auto-style29">
                                <strong>Book Now</strong>
                            </button>
                        </a>
                    </div>
                </div>

            </div>



            <!-- Add more slides here -->
        </div>

        <a class="prev" onclick="plusSlide(-1)">&#10094;</a>
        <a class="next" onclick="plusSlide(1)">&#10095;</a>
        </div>

        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlide(n) {
                showSlides(slideIndex += n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("slide");
                if (n > slides.length) {
                    slideIndex = 1;
                }
                if (n < 1) {
                    slideIndex = slides.length;
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slides[slideIndex - 1].style.display = "block";
            }

            setInterval(function () {
                plusSlide(1);
            }, 3000);
        </script>
        <table style="width: 100%">
            <tr>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
            </tr>
        </table>





        <div style="margin-top: 10px;"> <!-- Adjust the margin-top value to create more or less space -->
            <table style="width:100%">
                <c:forEach var="movie" items="${moviesList}" varStatus="loop">
                    <c:if test="${loop.index % 4 == 0}">
                        <tr> <!-- Start a new row for every 4 movies -->
                        </c:if>
                        <td style="width: 25%; text-align: center;">
                            <a href="MovieDetailsServlet?movieId=${movie.id}"> <!-- Add the movie ID as a URL parameter -->
                                <img src="${movie.poster_url}" alt="${movie.title}" style="width:75%" class="zoom">
                            </a>
                            <p>${movie.title}</p>
                            <p style="font-size: 12px;">Language: ${movie.language}</p>
                        </td>
                        <c:if test="${loop.index % 4 == 3 || loop.last}">
                        </tr> <!-- Close the row after the 4th movie or if it's the last movie -->
                    </c:if>
                </c:forEach>
            </table>

        </div>

    </body>

</html>
