require("dotenv").config();

const express = require("express");
const { getWalletByAddress } = require("./wallet");

const PORT = process.env.NODE_DOCKER_PORT || 8080;
const app = express();

app.get("/wallet/:address", async (req, res) => {
  res.send(
    await getWalletByAddress(req.params.address) 
      ? "Address whitelisted."
      : "Address not whitelisted."
  );
})

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
