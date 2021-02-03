import { ProjectPostInterface } from "mongo/interfaces";

export const getPostProject = (): ProjectPostInterface => ({
  _id: 0,
  id: 1,
  name: 1,
  order: 1,
  description: 1,
  date: 1,
});
