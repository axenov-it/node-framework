export interface MongoPostInterface {
  id: number;
  name: string;
  description: string;
  order: number;
  date: Date;
}

export interface ProjectPostInterface {
  _id: 0;
  id: 1;
  name: 1;
  description: 1;
  order: 1;
  date: 1;
}
