sudo apt install nginx -y
sudo systemctl enable nginx
sudo chmod -R 755 /var/www/html
sudo mkdir -p /var/www/html/app1
HOSTNAME=${hostname}
sudo echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cool Simple Page</title>
    <style>
        /* Reset some default styles */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            height: 100%;
        }
        
        /* Full-page background */
        .background {
            background-image: url('https://source.unsplash.com/random/1600x900');
            background-size: cover;
            background-position: center;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            text-align: center;
            flex-direction: column;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        button {
            padding: 15px 30px;
            font-size: 1.1rem;
            background-color: #00aaff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0088cc;
        }
    </style>
</head>
<body>
    <div class="background">
        <h1>Welcome to the Cool Page</h1>
        <p>This is a simple, stylish page with a random background image!</p>
        <button onclick="window.location.href='https://www.example.com'">Go to Example</button>
    </div>
</body>
</html>" | sudo tee /var/www/html/app1/index.html
sudo echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cool Simple Page</title>
    <style>
        /* Reset some default styles */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            height: 100%;
        }
        
        /* Full-page background */
        .background {
            background-image: url('https://source.unsplash.com/random/1600x900');
            background-size: cover;
            background-position: center;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            text-align: center;
            flex-direction: column;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        button {
            padding: 15px 30px;
            font-size: 1.1rem;
            background-color: #00aaff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0088cc;
        }
    </style>
</head>
<body>
    <div class="background">
        <h1>Welcome to the Cool Page</h1>
        <p>This is a simple, stylish page with a random background image!</p>
        <button onclick="window.location.href='https://www.example.com'">Go to Example</button>
    </div>
</body>
</html>" | sudo tee /var/www/html/index.html

