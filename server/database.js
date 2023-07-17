import mysql from 'mysql2'
import dotenv from 'dotenv'
dotenv.config()

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise()

export async function getUsers() {
    const [rows] = await pool.query("SELECT * FROM users")
    return rows;
}

export async function getUser(id) {
    const [rows] = await pool.query(`SELECT * FROM users WHERE user_id = ?`, [id])
    return rows[0];
}

export async function getBooks() {
    const [rows] = await pool.query("SELECT * FROM books")
    return rows;
}

export async function getBook(id) {
    const [rows] = await pool.query(`SELECT * FROM books WHERE book_id = ?`, [id])
    return rows[0];
}

export async function getCategories() {
    const [rows] = await pool.query("SELECT * FROM categories")
    return rows;
}

export async function getCategory(id) {
    const [rows] = await pool.query(`SELECT * FROM categories WHERE category_id = ?`, [id])
    return rows[0];
}

export async function getUserByName(payload) {
    const {name, password} = payload
    const [rows] = await pool.query(`SELECT * FROM users WHERE username = ? AND password = ?`, [name, password])
    return rows[0];
}

export async function createUser(payload) {
    console.log("payload: ", payload);
    const { name, password, email, first_name, last_name, address, city, state, zipcode, created_at} = payload;
    const role_id = payload?.role || "1";
    const [result] = await pool.query(`
    INSERT INTO users ( username, password, email, first_name, last_name, role, created_at)
    VALUES (?, ?, ?, ?, ?, ?, ?)`, 
    [ name, password, email, first_name, last_name, role_id, created_at])
console.log("result 1: ", result) 
    const resultMembers = await pool.query(`INSERT INTO members ( first_name, last_name, address, city, state, zip_code, created_at, user_id)
VALUES
  ( ?, ?, ?, ?, ?, ?, ?, ?)`, 
  [  first_name, last_name, address, city, state, zipcode, created_at, result.insertId])
  console.log("resultMembers: ", resultMembers);
    const resultId = result.insertId
    return getUser(resultId);
}

// Payload for createUser()
const payloadData = {
    name: 'John2', 
    password: 'password', 
    email: 'test@test.com', 
    first_name: 'John', 
    last_name: 'Doe', 
    role: 'member', 
    created_at: new Date()
}
// const notes = await createUser(payloadData);

// console.log(notes);