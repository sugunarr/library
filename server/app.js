import express from "express";
import cors from 'cors'
import { getUsers, getUser, createUser, getUserByName, getBooks, getBook, getCategories, getCategory } from "./database.js";

const app = express()

app.use(express.json())
app.use(cors());

app.get("/users", async (req, res) => {
    const users = await getUsers();
    res.send(users)
})

app.get("/users/:id", async (req, res) => {
    const id = req.params.id;
    const users = await getUser(id);
    res.send(users)
})

app.post("/login", async (req, res) => {
    const users = await getUserByName(req.body);
    res.send(users)
})

app.post("/users", async (req, res) => {
    const user = await createUser(req.body);
    res.status(201).send({code: "200",message: "Registration success!", userData: user})
})

app.get("/books", async (req, res) => {
    const books = await getBooks();
    res.send(books)
})

app.get("/books/:id", async (req, res) => {
    const id = req.params.id;
    const books = await getBook(id);
    res.send(books)
})

app.get("/categories", async (req, res) => {
    const categories = await getCategories();
    res.send(categories)
})

app.get("/categories/:id", async (req, res) => {
    const id = req.params.id;
    const categories = await getCategory(id);
    res.send(categories)
})

app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send('Something broke!')
  })
  

  app.listen(8081, () => {
    console.log('Server is running on port 8081')
  })