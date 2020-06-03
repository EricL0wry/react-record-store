# Record Store - Into the Groove

The "Into the Groove" Record Store app is a full-stack, mobile-responsive application for
users who want to purchase high quality vinyl albums.

## Live Demo

Try the application live at [https://record-store.ericmichaellowry.com](https://record-store.ericmichaellowry.com)

## Technologies Used

- React
- JavaScript
- Node.js
- Express
- PostgreSQL
- Express Session
- Bootstrap 4
- Webpack
- NPM
- HTML 5
- CSS3

## Features

- Users can browse a list of products
- Users can view product details
- Users can add an item to their cart
- Users can view a cart summary
- Users can return later to view their cart
- Users can checkout

## Preview

![Catalog](server/public/images/gif1.gif)

![Checkout](server/public/images/gif2.gif)


## Development

### System Requirements

- NPM 6 or higher
- Node.js 10 or higher
- PostgreSQL 10 or higher

## Getting Started

If you would like to test this application locally, please follow the steps below:

### Database Setup

1. If the PostgreSQL service isn't already running, make sure it is started. Sign into PostgreSQL

    ```shell
    psql
    ```

2. While signed into PostgreSQL, create a **new database** using the following SQL command.

    ```sql
    create database "intoTheGroove";
    ```

3. Still signed into PostgreSQL, create a **new user** and remember the credentials. You'll be needing them for the configuration file.

    ```sql
    create user "intoTheGrooveAdmin" with password 'superstrongpassword';
    ```

4. Still signed into PostgreSQL, give your new user full control over your new database with the following SQL command.

    ```sql
    grant all privileges on database "intoTheGroove" to "intoTheGrooveAdmin";
    ```

5. Sign out of PostgreSQL with the following command. You should be returned to your bash prompt.

    ```sql
    quit
    ```

### Environment Setup

1. Clone the repository.

    ```shell
    $ git clone https://github.com/EricL0wry/react-record-store.git
    ```

2. Once inside the project directory, install the dependencies.

    ```shell
    $ npm install
    ```

3. Copy the `.env.example` file & name it `.env`.

    ```shell
    $ cp .env.example .env
    ```

4. Edit the `.env` file to include your new database credentials.
    ```shell
    PORT=3001
    DEV_SERVER_PORT=3000
    DATABASE_URL=postgres://<username>:<password>@localhost/intoTheGroove
    SESSION_SECRET=secret
    ```

6. Ensure that the PostgreSQL service is running.

5. Import the sample database.

    ```shell
    $ npm run db:import
    ```

7. Run the dev script & visit http://localhost:3000 on your browser

    ```shell
    $ npm run dev
    ```
