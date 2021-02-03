import * as mongoose from "mongoose";

export default async function () {
  const user = process.env.DATABASE_USER;
  const password = process.env.DATABASE_PASSWORD;
  const host = process.env.DATABASE_HOST;
  const port = process.env.DATABASE_PORT;
  const db = process.env.DATABASE_NAME;

  const mongoUrl = `mongodb://${user}:${password}@${host}:${port}/${db}`;

  try {
    const connect = await mongoose.connect(mongoUrl, {
      useNewUrlParser: true,
      useCreateIndex: true,
    });

    console.log("\x1b[32m", "Successful connected to MongoDB");

    return connect;
  } catch (err) {
    console.log("\x1b[32m", "Error on connection to MongoDB", err);
    process.exit(1);
  }
}
