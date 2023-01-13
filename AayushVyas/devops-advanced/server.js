const express = require("express");

const app = express();
app.listen("3001");
const cors = require("cors");
app.use(
  cors({
    origin: "*",
  })
);

app.get("/", (req, res) => {
  res.json({ message: "success" }).sendStatus(200);
});

const employeeRouter = require("./routes/employee");
app.use("/employees", employeeRouter);
