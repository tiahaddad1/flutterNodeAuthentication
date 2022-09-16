require("dotenv").config(); //creates a process variable and inside the process it has all your .env variables: process.env.____

const express = require("express"); //returns function (located in node_modules)

const app = express(); //returns like a class used for response and request

app.use(express.json()); //what kind of data to deal with: JSON

const mongoose = require("mongoose"); //importing mongoose package (green means class)
const { restart } = require("nodemon");

const User = require("./Model/User"); //User schema

const bcrypt = require("bcrypt");

mongoose.connect(process.env.DB_URL);
app.get("/", (request, response) => {
  // "/" means path which means the DB URL
  response.json({
    firstName: "minhaz ape",
    lastName: "ape",
    email: "jkdeknkend",
    password: "12345678",
  });
});

app.post("/usersEnter", async (request, response) => {
  const findUser = await User.findOne({ email: request.body.email });
  // console.log(findUser);

  if (findUser) {
    console.log("user found");
    // response.status(200).json({message:"User found!"});
    const userPass = findUser.password;
    const passEntered = request.body.password;
    const pass = bcrypt.compare(passEntered, userPass, function (err, result) {
      if (err) {
        console.log("there is an error!");
        response.status(500).json({ message: err.status });
      } else if (result == false) {
        console.log("passwords do not match!");
        response.status(400).json({ message: "passwords do not match" });
      } else {
        console.log("same passwords!");
        response.status(200).json({ message: "passwords match!" });
        const loggedInUser = new User({
          firstName: findUser.firstName,
          lastName: findUser.lastName,
          email: findUser.email,
          password: findUser.password,
        });
      }
    });
  } else {
    console.log("user not found");
    response.status(401).json({ message: "User not found!" });
  }

  // if(response.status(400)) response.status(400).json({message:"User not found"});
  // else if(response.status(500)) response.status(500).json({message:"Server is having issues"});
});

app.post("/users", (request, response) => {
  // "/" means path which means the DB URL
  bcrypt.hash(request.body.password, 5, async function (err, hash) {
    if (err) response.status(500).json({ message: err.status });
    const user = new User({
      firstName: request.body.firstName,
      lastName: request.body.lastName,
      email: request.body.email,
      password: hash,
    });
    try {
      const newUser = await user.save();
      response.status(200).json(newUser);
    } catch (err) {
      response.status(400).json({ message: err.status });
    }
  });
});

const port = process.env.PORT || 3001; //development: 3001 but for publishing I provide one in .env

app.listen(port, () => console.log("server started at " + port));

//1. mongosh

//open new terminal in server directory

//server.js -> nodemon server.js or 2. npm run devStart
