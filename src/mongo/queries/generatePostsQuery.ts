import { Post } from "mongo/models";
import { postsMock } from "mongo/mocks";

export default async (): Promise<void> => {
  await Post.deleteMany({});
  await Post.insertMany(postsMock());
};
