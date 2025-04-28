import "dotenv/config";
import express from "express";
import './config/dbConnecrion';

const app = express();

const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.get("/", (req, res) => {
    res.status(200).send("App is working!");
});

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
});