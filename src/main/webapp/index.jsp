<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Weather Dekho</title>
    <script src="https://cdn.lordicon.com/lordicon.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="searchbox">
        <h1>Welcome Suprabhat</h1>
        <form form action="weather" method="post">
        <input type="text" placeholder="Enter city name" id="searchInput" name="city"/>
            <button>
                <lord-icon src="https://cdn.lordicon.com/jtkfemwz.json" trigger="loop" delay="1000" stroke="bold"
                    colors="primary:#eee966,secondary:#e8308c" style="width:40px;height:40px">
                </lord-icon>
            </button>
        </form>
    </div>

    <div class="container">
        <div class="sec1">
            <div class="center">
                <script src="https://cdn.lordicon.com/lordicon.js"></script>
                <lord-icon src="https://cdn.lordicon.com/aqrzgjfy.json" trigger="loop" delay="1000" stroke="bold"
                    colors="primary:#eee966,secondary:#e8308c" style="width:130px;height:120px">
                </lord-icon>
                <h2>Date And Time</h2>
                <h5>${date}</h5>
            </div>
            <div class="center">
                <lord-icon src="https://cdn.lordicon.com/cjhlqtae.json" trigger="loop" delay="1000" stroke="bold"
                    colors="primary:#eee966,secondary:#e8308c" style="width:120px;height:120px">
                </lord-icon>
                </lord-icon>
                <h2>Location</h2>
                <h3>${city}</h3>
            </div>
            <div class="center">
                <lord-icon src="https://cdn.lordicon.com/orzbfnox.json" trigger="loop" delay="1000" stroke="bold"
                    colors="primary:#eee966,secondary:#e8308c" style="width:120px;height:120px">
                </lord-icon>
                <h2>Weather Condition</h2>
                <h3>${weatherCondition}</h3>
            </div>
        </div>
        <div class="sec2">
            <div class="center">
                <lord-icon src="https://cdn.lordicon.com/dmwmxfoh.json" trigger="loop" delay="1000" stroke="bold"
                    colors="primary:#eee966,secondary:#e8308c" style="width:120px;height:120px">
                </lord-icon>
                <h2>Temperature</h2>
                <h3>${temperature} °C</h3>
            </div>
            <div class="center">
                <lord-icon src="https://cdn.lordicon.com/osckrizz.json" trigger="loop" delay="1000" stroke="bold"
                    colors="primary:#eee966,secondary:#e8308c" style="width:120px;height:120px">
                </lord-icon>
                <h2>Wind Speed</h2>
                <h3>${windSpeed} m/s</h3>
            </div>
            <div class="center">
                <lord-icon src="https://cdn.lordicon.com/fdgguoid.json" trigger="loop" delay="1000" stroke="bold"
                    colors="primary:#eee966,secondary:#e8308c" style="width:120px;height:120px">
                </lord-icon>
                <h2>Humidity</h2>
                <h3>${humidity} %</h3>
            </div>
        </div>
    </div>

</body>
</html>