## Task Management

This is a laravel web application for managing tasks 

### prerequisites 

#### The following are important dependencies

[Docker](https://www.docker.com/)

### Steps

#### The following are the steps to get you started with the project

1. Clone this project in a a directory of your choice on your machine

2. Locate the docker-compose.yml file and .env file and add your database credentials in the two files


3. Run the `docker-compose up -d --build` commmand to create and build all containers 


4. Run the `docker-compose run --rm composer install` command to install composer


5. Run the `docker-compose run --rm composer require laravel/breeze --dev` command to breeze for authentication


6. Run the `docker-compose run --rm composer php artisan breeze:install vue` command to install vue


7. Run the `docker-compose run --rm npm install` command to install npm


8. Run the `docker-compose run --rm npm run dev` and then opn=en another terminal and run migration


9. Run the `docker-compose run --rm composer php artisan migrate` to run migration


10. navigate to your browser and search for 'localhost' to view the applicatiion
