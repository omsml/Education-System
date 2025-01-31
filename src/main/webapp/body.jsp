<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Omm's Institute</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #ff99cc 0%, #ffffff 100%);            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 20px;
            background: #ffffff; /* White background for header */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            color: #333; /* Dark text */
        }

        main {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            padding: 20px;
            margin-top: 20px;
        }

        .college-card {
            background: #ffffff; /* White card background */
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin: 20px 0;
            width: 90%;
            max-width: 800px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s, opacity 0.5s;
            opacity: 0; /* Start hidden for animation */
            transform: translateY(20px); /* Start slightly down */
        }

        .college-card.visible {
            opacity: 1; /* Show */
            transform: translateY(0); /* Move to original position */
        }

        .college-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .college-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }

        .details {
            padding: 15px;
            text-align: center;
        }

        

       
    </style>
</head>
<body>
    <header>
        <h1>EDUCATION SYSTEM
        </h1>
    </header>
    <main id="college-list">
        <div class="college-card" id="card1" aria-label="IIT Bhubaneswar">
            <img src="https://img-cdn.thepublive.com/fit-in/1200x675/filters:format(webp)/sambad-english/media/post_attachments/wp-content/uploads/2020/11/IIT-Bhubaneswar-03-Jan-2017.jpg" alt="IIT Bhubaneswar">
            <h2>IIT Bhubaneswar</h2>
            <div class="details">
                <p>Location: Bhubaneswar, Odisha<br>The Indian Institute of Technology Bhubaneswar (IIT Bhubaneswar), established in 2008, is a public technical university.</p>
                <a href="https://goo.gl/maps/XXXX" target="_blank">View on Map</a>
            </div>
            </div>
        
        <div class="college-card" id="card2" aria-label="NIT Rourkela">
            <img src="https://images.shiksha.com/mediadata/images/1607331935php7vaw4G.jpeg" alt="NIT Rourkela">
            <h2>NIT Rourkela</h2>
            <div class="details">
                <p>Location: Rourkela, Odisha
                    <br>
                    National Institute of Technology Rourkela (NITRKL) is a publicly funded engineering and technology institute in Rourkela, Odisha, India. Recognized as an Institute of National Importance, it ranks 16th among Indian engineering universities in the NIRF Rankings 2023. Formerly known as Regional Engineering College Rourkela, it is one of 31 National Institutes of Technology in the country.
                </p>
                <a href="https://goo.gl/maps/XXXX" target="_blank">View on Map</a>
            </div>
            </div>

        <div class="college-card" id="card3" aria-label="Utkal University">
            <img src="https://utkaluniversity.ac.in/wp-content/uploads/2021/04/s-image-22.jpg" alt="Utkal University">
            <h2>Utkal University</h2>
            <div class="details">
                <p>Location: Bhubaneswar, Odisha
                    <br>
                    Utkal University (UU) is the oldest university in Odisha and the 17th oldest in India, established in 1943. Its current campus in Vani Vihar, Bhubaneswar, was inaugurated in 1963, covering 399.9 acres. UU serves as a teaching-cum-affiliating university and adopted its theme song from a poem by one of its founders in 2016.
                </p>
                <a href="https://goo.gl/maps/XXXX" target="_blank">View on Map</a>
            </div>
            </div>

            <div class="college-card" id="card3" aria-label="Utkal University">
                <img src="https://images.squarespace-cdn.com/content/v1/57713a8e2994cae381dd86fe/75119539-209d-48e4-83e9-4134ada499d7/iter+gate.jpg" alt="Utkal University">
                <h2>ITER , Bhubaneswar</h2>
                <div class="details">
                    <p>Location: Bhubaneswar, Odisha
                        <br>
                        Siksha 'O' Anusandhan (SOA), formerly Siksha 'O' Anusandhan University (SOA University) is a private deemed university in Bhubaneswar, Odisha, India.[2] Many of the programs are nationally accredited, such as engineering, medicine, pharmacy, business, nursing, biotechnology, science, humanities, environment, nano technology, materials science, agriculture and law.
                    </p>
                    <a href="https://goo.gl/maps/XXXX" target="_blank">View on Map</a>
                </div>
                </div>
    </main>
    
    <script>
        // Function to reveal cards on scroll
        const cards = document.querySelectorAll('.college-card');

        const options = {
            root: null, // Use the viewport as the container
            threshold: 0.1 // Trigger when 10% of the element is visible
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target); // Stop observing once visible
                }
            });
        }, options);

        cards.forEach(card => {
            observer.observe(card);
        });
    </script>
</body>
</html>
