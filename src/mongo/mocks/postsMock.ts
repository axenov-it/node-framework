import * as Chance from "chance";
const chance = new Chance();

export default function getPosts(posts = [], limit = 100) {
  return limit--
    ? getPosts(
        posts.concat({
          id: chance.integer({ min: 1, max: 1000000 }),
          name: chance.name(),
          description: chance.paragraph(),
          order: chance.integer({ min: 0, max: 1000 }),
          urlName: chance.string(),
          date: chance.date(),
        }),
        limit
      )
    : posts;
}
