import { Post } from "mongo/models";
import { getPostProject } from "mongo/projects";
import { MongoPostInterface } from "mongo/interfaces";

interface ParamsInterface {
  limit: number;
  sort: "asc" | "desc";
}

type ReturnInterface = Promise<ReadonlyArray<MongoPostInterface>>;

export default async ({
  limit = 100,
  sort = "asc",
}: ParamsInterface): ReturnInterface => {
  const result: any = await Post.find({}, getPostProject())
    .sort({ order: sort === "asc" ? 1 : -1 })
    .limit(limit);

  return result;
};
