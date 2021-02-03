export default [
  {
    name: "indexController",
    actions: [{ path: "/", type: "get", name: "index" }],
  },
  {
    name: "postController",
    actions: [{ path: "/posts", type: "get", name: "getPosts" }],
  },
];
