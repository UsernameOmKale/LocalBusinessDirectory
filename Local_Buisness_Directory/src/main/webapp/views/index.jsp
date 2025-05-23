<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Local Business Directory</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            overflow-x: hidden;
            background: url("https://media.istockphoto.com/id/1202205418/photo/find-the-shortest-path-between-points-a-and-b.jpg?s=612x612&w=0&k=20&c=_0PSqcLbxAHx8eb_vFzDuKpKtlvZmxj1XbwZ61iwE0s="); /* Update to a business-themed image */
            background-size: cover;
            background-position: center;
            color: white;
        }
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            z-index: 1000;
            transition: background-color 0.8s;
        }
        header:hover {
            background-color: rgba(0, 0, 0, 0.9);
        }
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .nav-links {
            list-style: none;
            display: flex;
            gap: 10px;
        }
        .nav-links a {
            text-decoration: none;
            color: white;
            font-size: 1rem;
            padding: 10px 15px;
            border: 2px solid transparent;
            border-radius: 5px;
            transition: all 0.8s;
        }
        .nav-links a:hover {
            color: #ff9800;
            background-color: white;
            border-color: #ff9800;
            border: 2px solid #ff9800;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.8);
            min-width: 150px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
        }
        .dropdown-content a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .dropdown-content a:last-child {
            border-bottom: none;
        }
        .dropdown-content a:hover {
            background-color: rgba(255, 152, 0, 0.8);
            color: white;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .content {
            text-align: center;
            margin-top: 120px;
            padding: 20px;
            animation: fadeIn 4s ease-in-out;
        }
        .content h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            color: rgb(255, 255, 255);
        }
        .content p {
            font-size: 2rem;
            margin-bottom: 30px;
            color: #ffffff;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        footer {
            background-color: rgba(114, 157, 158, 0.4);
            padding: 20px 0;
        }
        .sliding-section {
            max-width: 1200px;
            margin: 0 auto;
            overflow: hidden;
            position: relative;
        }
        .sliding-content {
            display: flex;
            gap: 30px;
            animation: circularSlide 20s linear infinite;
        }
        .sliding-content img {
            width: 300px;
            height: 200px;
            border-radius: 5px;
            object-fit: cover;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        @keyframes circularSlide {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <h2>Local Business Directory</h2>
            </div>
            <ul class="nav-links">
                <li><a href="index">Home</a></li>
                <li><a href="UserSignUp">User Sign Up</a></li>
                <li><a href="UserSignIn">User Sign In</a></li>
                <li class="dropdown">
                    <a>Admin</a>
                    <div class="dropdown-content">
                        <a href="AdminSignUp">Sign Up</a>
                        <a href="AdminSignIn">Sign In</a>
                    </div>
                </li>
            </ul>
        </nav>
    </header>


    <section class="content">
        <h1>Welcome to the Local Business Directory</h1>
        <p>Find businesses in your area easily!</p>
    </section>

    <footer>
        <div class="sliding-section">
            <div class="sliding-content">
                <!-- Add images relevant to a local business directory -->
                <img src="https://media.istockphoto.com/id/183953925/photo/young-plumber-fixing-a-sink-in-bathroom.jpg?s=612x612&w=0&k=20&c=Ps2U_U4_Z60mIZsuem-BoaHLlCjsT8wYWiXNWR-TCDA=">
                <img src="https://iaeimagazine.org/wp-content/uploads/2019/08/intro-world-of-opportunities-for-electrical-workers.jpg">
                <img src="https://img.freepik.com/free-photo/worker-is-cutting-wires-with-lineman-s-pliers_169016-15689.jpg">
                <img src="https://guru.com/blog/wp-content/uploads/2023/04/civil-engineer-duties.jpg">
                <img src="https://t3.ftcdn.net/jpg/03/02/47/02/360_F_302470233_yJh7nrqKTLzPMXEdZ5IvyeL9xOetipPW.jpg">
                <img src="https://www.heamar.co.uk/media/amasty/blog/Welder_Tools_and_Accessories.jpg">
                <img src="https://cdn2.system1.com/eyJidWNrZXQiOiJvbS1wdWItc3RvcmFnZSIsImtleSI6InJvYWR3YXJyaW9yL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDI0LzA0L0dldHR5SW1hZ2VzLTEzMjk5OTE5NjktZTE3MTIxNzk0NDkyMzYuanBnIiwiZWRpdHMiOnsid2VicCI6eyJxdWFsaXR5Ijo4MH19fQ==">
            </div>
        </div>
    </footer>
</body>
</html>
