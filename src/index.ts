import * as express from "express";
import * as dotenv from "dotenv";
import * as swaggerUi from "swagger-ui-express";
import * as swaggerJsdoc from "swagger-jsdoc";

import { swaggerConfig } from "./config";
import { setRoutes, mongoose } from "lib";

(async function () {
  dotenv.config();
  await mongoose();

  const app = express();
  const port = process.env.APP_PORT;

  const router = await setRoutes(express.Router());

  app.use(
    "/swagger",
    swaggerUi.serve,
    swaggerUi.setup(swaggerJsdoc(swaggerConfig))
  );

  app.use("/api/v1", router);

  app.listen(port, () => {
    console.log(`API SERVER LISTENING AT ${process.env.APP_HOST}:${port}`);
  });
})();
