<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Movie Management</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .form-container {
                margin-top: 20px;
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
            }
            .delete-form {
                margin-bottom: 20px;
            }
            .add-form input, .add-form textarea {
                margin: 5px;
                padding: 5px;
            }
            .delete-form input[type="text"] {
                padding: 5px;
                margin-right: 10px;
            }
            .delete-form button {
                padding: 5px 10px;
                background-color: #ff4444;
                color: white;
                border: none;
                cursor: pointer;
            }
            .delete-form button:hover {
                background-color: #cc0000;
            }
        </style>
        
        <script>
            function confirmDelete() {
                var movieId = document.getElementById('movieId').value;
                if (!movieId) {
                    alert('Please enter a Movie ID');
                    return false;
                }
                if (confirm('Warning: Deleting this movie will also delete all related showtimes and bookings. Are you sure you want to continue?')) {
                    document.getElementById('deleteForm').submit();
                }
                return false;
            }
        </script>
        
         <script>
            function validateMovieForm() {
                let isValid = true;
                const errors = {};

                // Get form elements
                const title = document.getElementById('title');
                const genre = document.getElementById('genre');
                const releaseDate = document.getElementById('release_date');
                const language = document.getElementById('language');
                const rating = document.getElementById('rating');
                const productionCompany = document.getElementById('production_company');
                const country = document.getElementById('country');
                const ageRating = document.getElementById('age_rating');
                const posterUrl = document.getElementById('poster_url');
                const duration = document.getElementById('duration');
                const description = document.getElementById('description');

                // Clear previous errors
                clearErrors();

                // Title validation (required, 1-100 characters)
                if (!title.value.trim()) {
                    errors.title = 'Title is required';
                    isValid = false;
                } else if (title.value.length > 100) {
                    errors.title = 'Title must be less than 100 characters';
                    isValid = false;
                }

                // Genre validation (required, only letters and spaces)
                if (!genre.value.trim()) {
                    errors.genre = 'Genre is required';
                    isValid = false;
                } else if (!/^[a-zA-Z\s,]+$/.test(genre.value)) {
                    errors.genre = 'Genre can only contain letters, spaces, and commas';
                    isValid = false;
                }

                // Release date validation (required, not future date)
                if (!releaseDate.value) {
                    errors.release_date = 'Release date is required';
                    isValid = false;
                } else {
                    const today = new Date();
                    const selectedDate = new Date(releaseDate.value);
                    if (selectedDate > today) {
                        errors.release_date = 'Release date cannot be in the future';
                        isValid = false;
                    }
                }

                // Rating validation (0-10)
                if (rating.value && (isNaN(rating.value) || rating.value < 0 || rating.value > 10)) {
                    errors.rating = 'Rating must be between 0 and 10';
                    isValid = false;
                }

                // Age rating validation (required, numeric)
                if (!ageRating.value) {
                    errors.age_rating = 'Age rating is required';
                    isValid = false;
                } else if (isNaN(ageRating.value) || ageRating.value < 0) {
                    errors.age_rating = 'Age rating must be a positive number';
                    isValid = false;
                }

                // Duration validation (required, positive number)
                if (!duration.value) {
                    errors.duration = 'Duration is required';
                    isValid = false;
                } else if (isNaN(duration.value) || duration.value <= 0) {
                    errors.duration = 'Duration must be a positive number';
                    isValid = false;
                }

                // Display errors if any
                if (!isValid) {
                    displayErrors(errors);
                    return false;
                }

                return true;
            }

            function displayErrors(errors) {
                for (const [field, message] of Object.entries(errors)) {
                    const element = document.getElementById(field);
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'error';
                    errorDiv.textContent = message;
                    element.classList.add('invalid');
                    element.parentNode.appendChild(errorDiv);
                }
            }

            function clearErrors() {
                const errorElements = document.getElementsByClassName('error');
                while (errorElements.length > 0) {
                    errorElements[0].parentNode.removeChild(errorElements[0]);
                }
                const invalidInputs = document.getElementsByClassName('invalid');
                while (invalidInputs.length > 0) {
                    invalidInputs[0].classList.remove('invalid');
                }
            }
        </script>
    </head>
    <body>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Genre</th>
                <th>Release Date</th>
                <th>Language</th>
                <th>Rating</th>
                <th>Production Company</th>
                <th>Country</th>
                <th>Age Rating</th>
                <th>Poster URL</th>
                <th>Duration</th>
                <th>Description</th>
            </tr>
            <c:forEach var="movie" items="${movieList}">
                <tr>
                    <td>${movie.id}</td>
                    <td>${movie.title}</td>
                    <td>${movie.genre}</td>
                    <td>${movie.release_date}</td>
                    <td>${movie.language}</td>
                    <td>${movie.rating}</td>
                    <td>${movie.production_company}</td>
                    <td>${movie.country}</td>
                    <td>${movie.age_rating}</td>
                    <td style="max-width: 100px; overflow: hidden; text-overflow: ellipsis;">${movie.poster_url}</td>
                    <td>${movie.duration}</td>
                    <td style="max-width: 100px; overflow: hidden; text-overflow: ellipsis;">${movie.description}</td>
                </tr>
            </c:forEach>
        </table>

        <div class="form-container">
            <%-- Delete movie form --%>
            <div class="delete-form">
                <form id="deleteForm" action="DeleteMovieServlet" method="post">
                    <input type="text" name="movieId" id="movieId" placeholder="Enter Movie ID to delete">
                    <button type="button" onclick="confirmDelete()">Delete Movie</button>
                </form>
            </div>

            <%-- Add movie form --%>
            <div class="add-form">
               <%-- Add movie form --%>
<form action="AddMovieServlet" method="post">
    <div class="input-group">
        <label for="title">Title* :</label>
        <input type="text" name="title" id="title" maxlength="100" required>
    </div>

    <div class="input-group">
        <label for="genre">Genre* :</label>
        <input type="text" name="genre" id="genre" maxlength="50" required
               pattern="[A-Za-z\s,]+" title="Only letters, spaces, and commas allowed">
    </div>

    <div class="input-group">
        <label for="release_date">Release Date* :</label>
        <input type="date" name="release_date" id="release_date" required>
    </div>

    <div class="input-group">
        <label for="language">Language* :</label>
        <input type="text" name="language" id="language" maxlength="50" required>
    </div>

    <div class="input-group">
        <label for="rating">Rating* (0-10):</label>
        <input type="number" name="rating" id="rating" min="0" max="10" required
               step="1" value="0">
    </div>

    <div class="input-group">
        <label for="production_company">Production Company:</label>
        <input type="text" name="production_company" id="production_company" maxlength="100">
    </div>

    <div class="input-group">
        <label for="country">Country* :</label>
        <input type="text" name="country" id="country" maxlength="50" required>
    </div>

    <div class="input-group">
        <label for="age_rating">Age Rating* :</label>
        <input type="number" name="age_rating" id="age_rating" min="0" max="21" required
               step="1" value="0">
    </div>

    <div class="input-group">
        <label for="poster_url">Poster URL:</label>
        <input type="text" name="poster_url" id="poster_url">
    </div>

    <div class="input-group">
        <label for="duration">Duration* (minutes):</label>
        <input type="number" name="duration" id="duration" min="1" max="1000" required
               step="1" value="90">
    </div>

    <div class="input-group">
        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4"></textarea>
    </div>

    <small>Fields marked with * are required</small><br><br>
    <input type="submit" value="Add Movie">
</form>
            </div>
        </div>
    </body>
</html>