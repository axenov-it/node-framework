module.exports = {
  apps: [
    {
      name: "api",
      script: "npm",
      args: "start",
      instances: 8,
      exec_mode: "cluster",
    },
  ],
};
