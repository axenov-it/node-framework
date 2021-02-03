import * as mongoose from "mongoose";

const postSchema = new mongoose.Schema({
  id: {
    type: Number,
    unique: true,
  },
  name: String,
  description: String,
  order: Number,
  urlName: String,
  date: Date,
});

postSchema.index({ name: 1 });
postSchema.index({ order: 1 });

export default mongoose.model("Post", postSchema);
