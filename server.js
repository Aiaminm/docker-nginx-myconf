
const cors = require('cors');
const express = require('express');
const timeout = require('connect-timeout');
const { createProxyMiddleware } = require('http-proxy-middleware');


const app = express();
app.use(cors());

const TIME_OUT = "60s";
app.use(timeout(TIME_OUT));
app.use((req, res, next) => {
  if (!req.timedout) next();
});


// Constants
const PORT = 80;
const HOST = '0.0.0.0';


app.use('/',createProxyMiddleware({ target: "https://ipfs.io", changeOrigin: true })



app.listen(PORT, () => {
  console.log(`server running @${PORT}`);
});


