import { getPostsQuery, generatePostsQuery } from "mongo/queries";

/**
 * @swagger
 * /posts:
 *   get:
 *      parameters:
 *        - name: limit
 *          in: query
 *          type: number
 *          value: 10
 *        - name: sort
 *          in: query
 *          type: string
 *          value: asc
 *      responses:
 *       200:
 *         description: Response array posts
 */

export const getPosts = async (req, res): Promise<void> => {
  const posts = await getPostsQuery({
    limit: req.query.limit && parseInt(req.query.limit),
    sort: req.query.sort,
  });

  res.json(posts);
};

export const generatePosts = async (req, res): Promise<void> => {
  await generatePostsQuery();
  res.send("posts generated success");
};
