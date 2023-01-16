const express = require("express");

const router = express.Router();
router.use(express.json());

const employees = [
  {
    id: 0,
    name: "admin",
    email: "admin@org.com",
    password: "admin",
    telephone: "000000",
    role: "admin",
  },
];
router.get("", (req, res) => {
  res.send("All Good");
});
router.post("/auth", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  let auth = false;
  auth = employees.find((employee) => {
    return employee.email === email && employee.password === password;
  });
  if (auth === undefined) {
    res.status(404).json({ message: "Employee Not Found" });
    return;
  }
  res.send(auth);
});

router.post("/create", (req, res) => {
  console.log(req.body);
  employees.push(req.body);

  res.status(201).json({ id: employees.length - 1, message: "created" });
  console.log("created:", employees.length - 1);
});

router
  .get("/:id", (req, res) => {
    res.send(employees.at(req.params.id));
  })
  .put("/:id", (req, res) => {})
  .delete("/:id", (req, res) => {
    if (employees.length - 1 <= id) {
      employees.splice(id, 1);
      res.sendStatus(200);
    } else {
      res.sendStatus(404);
    }
  });

module.exports = router;
