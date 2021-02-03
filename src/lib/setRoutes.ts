import routes from "config/routes";

export default async function (Router) {
  for (const route of routes) {
    const controller = await import(`controllers/${route.name}`);

    if (!controller)
      console.log("\x1b[31m", `CONTROLLER ${route.name} IS NOT EXISTS`);

    for (const action of route.actions) {
      if (!controller[action.name])
        console.log(
          "\x1b[31m",
          `ACTION ${action.name} IS NOT EXISTS IN CONTROLLER ${route.name}`
        );
      Router[action.type](action.path, controller[action.name]);
    }
  }
  return Router;
}
