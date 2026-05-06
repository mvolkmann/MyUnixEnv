"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/kill-listening-process.tsx
var kill_listening_process_exports = {};
__export(kill_listening_process_exports, {
  default: () => Command
});
module.exports = __toCommonJS(kill_listening_process_exports);
var import_api = require("@raycast/api");
var import_child_process = require("child_process");
function isInteger(str) {
  return Number.isInteger(parseInt(str, 10));
}
async function run(command) {
  return new Promise((resolve, reject) => {
    (0, import_child_process.exec)(command, (error, stdout, stderr) => {
      if (error) {
        reject(stderr.trimEnd());
      } else {
        resolve(stdout.trimEnd());
      }
    });
  });
}
async function Command(props) {
  const { port } = props.arguments;
  if (!isInteger(port)) {
    (0, import_api.showToast)({
      style: import_api.Toast.Style.Failure,
      title: "Bad Port",
      message: "The port must be an integer."
    });
    return;
  }
  const command = `/usr/sbin/lsof -n -iTCP:${port} -sTCP:LISTEN -t`;
  try {
    const pid = await run(command);
    await run("kill " + pid);
    (0, import_api.showToast)({
      style: import_api.Toast.Style.Success,
      title: "Success",
      message: `Process ${pid} was killed.`
    });
  } catch (error) {
    (0, import_api.showToast)({
      style: import_api.Toast.Style.Failure,
      title: "Error",
      message: `No process is listening on port ${port}.`
    });
  }
}
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vRG9jdW1lbnRzL2Rldi9yYXljYXN0L3JheWNhc3QtZXh0ZW5zaW9ucy9leHRlbnNpb25zL3BvcnQtbWFuYWdlci9zcmMva2lsbC1saXN0ZW5pbmctcHJvY2Vzcy50c3giXSwKICAic291cmNlc0NvbnRlbnQiOiBbImltcG9ydCB7IExhdW5jaFByb3BzLCBzaG93VG9hc3QsIFRvYXN0IH0gZnJvbSBcIkByYXljYXN0L2FwaVwiO1xuaW1wb3J0IHsgZXhlYyB9IGZyb20gXCJjaGlsZF9wcm9jZXNzXCI7XG5cbmZ1bmN0aW9uIGlzSW50ZWdlcihzdHI6IHN0cmluZyk6IGJvb2xlYW4ge1xuICByZXR1cm4gTnVtYmVyLmlzSW50ZWdlcihwYXJzZUludChzdHIsIDEwKSk7XG59XG5cbmFzeW5jIGZ1bmN0aW9uIHJ1bihjb21tYW5kOiBzdHJpbmcpOiBQcm9taXNlPHN0cmluZz4ge1xuICByZXR1cm4gbmV3IFByb21pc2UoKHJlc29sdmUsIHJlamVjdCkgPT4ge1xuICAgIGV4ZWMoY29tbWFuZCwgKGVycm9yLCBzdGRvdXQsIHN0ZGVycikgPT4ge1xuICAgICAgaWYgKGVycm9yKSB7XG4gICAgICAgIHJlamVjdChzdGRlcnIudHJpbUVuZCgpKTtcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIHJlc29sdmUoc3Rkb3V0LnRyaW1FbmQoKSk7XG4gICAgICB9XG4gICAgfSk7XG4gIH0pO1xufVxuXG5leHBvcnQgZGVmYXVsdCBhc3luYyBmdW5jdGlvbiBDb21tYW5kKFxuICAvLyBcIkluZGV4XCIgaGVyZSByZWZlcnMgdG8gdGhlIFwibmFtZVwiIHByb3BlcnR5IG9mIHRoaXMgY29tbWFuZFxuICAvLyBzcGVjaWZpZWQgaW4gcGFja2FnZS5qc29uIEFORCBtYXRjaGVzIHRoZSBuYW1lIG9mIHRoaXMgc291cmNlIGZpbGUuXG4gIHByb3BzOiBMYXVuY2hQcm9wczx7IGFyZ3VtZW50czogQXJndW1lbnRzLktpbGxMaXN0ZW5pbmdQcm9jZXNzIH0+XG4pIHtcbiAgY29uc3QgeyBwb3J0IH0gPSBwcm9wcy5hcmd1bWVudHM7XG4gIGlmICghaXNJbnRlZ2VyKHBvcnQpKSB7XG4gICAgc2hvd1RvYXN0KHtcbiAgICAgIHN0eWxlOiBUb2FzdC5TdHlsZS5GYWlsdXJlLFxuICAgICAgdGl0bGU6IFwiQmFkIFBvcnRcIixcbiAgICAgIG1lc3NhZ2U6IFwiVGhlIHBvcnQgbXVzdCBiZSBhbiBpbnRlZ2VyLlwiLFxuICAgIH0pO1xuICAgIHJldHVybjtcbiAgfVxuXG4gIGNvbnN0IGNvbW1hbmQgPSBgL3Vzci9zYmluL2xzb2YgLW4gLWlUQ1A6JHtwb3J0fSAtc1RDUDpMSVNURU4gLXRgO1xuXG4gIHRyeSB7XG4gICAgY29uc3QgcGlkID0gYXdhaXQgcnVuKGNvbW1hbmQpO1xuICAgIGF3YWl0IHJ1bihcImtpbGwgXCIgKyBwaWQpO1xuICAgIHNob3dUb2FzdCh7XG4gICAgICBzdHlsZTogVG9hc3QuU3R5bGUuU3VjY2VzcyxcbiAgICAgIHRpdGxlOiBcIlN1Y2Nlc3NcIixcbiAgICAgIG1lc3NhZ2U6IGBQcm9jZXNzICR7cGlkfSB3YXMga2lsbGVkLmAsXG4gICAgfSk7XG4gIH0gY2F0Y2ggKGVycm9yKSB7XG4gICAgc2hvd1RvYXN0KHtcbiAgICAgIHN0eWxlOiBUb2FzdC5TdHlsZS5GYWlsdXJlLFxuICAgICAgdGl0bGU6IFwiRXJyb3JcIixcbiAgICAgIG1lc3NhZ2U6IGBObyBwcm9jZXNzIGlzIGxpc3RlbmluZyBvbiBwb3J0ICR7cG9ydH0uYCxcbiAgICB9KTtcbiAgfVxufVxuIl0sCiAgIm1hcHBpbmdzIjogIjs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUEsaUJBQThDO0FBQzlDLDJCQUFxQjtBQUVyQixTQUFTLFVBQVUsS0FBc0I7QUFDdkMsU0FBTyxPQUFPLFVBQVUsU0FBUyxLQUFLLEVBQUUsQ0FBQztBQUMzQztBQUVBLGVBQWUsSUFBSSxTQUFrQztBQUNuRCxTQUFPLElBQUksUUFBUSxDQUFDLFNBQVMsV0FBVztBQUN0QyxtQ0FBSyxTQUFTLENBQUMsT0FBTyxRQUFRLFdBQVc7QUFDdkMsVUFBSSxPQUFPO0FBQ1QsZUFBTyxPQUFPLFFBQVEsQ0FBQztBQUFBLE1BQ3pCLE9BQU87QUFDTCxnQkFBUSxPQUFPLFFBQVEsQ0FBQztBQUFBLE1BQzFCO0FBQUEsSUFDRixDQUFDO0FBQUEsRUFDSCxDQUFDO0FBQ0g7QUFFQSxlQUFPLFFBR0wsT0FDQTtBQUNBLFFBQU0sRUFBRSxLQUFLLElBQUksTUFBTTtBQUN2QixNQUFJLENBQUMsVUFBVSxJQUFJLEdBQUc7QUFDcEIsOEJBQVU7QUFBQSxNQUNSLE9BQU8saUJBQU0sTUFBTTtBQUFBLE1BQ25CLE9BQU87QUFBQSxNQUNQLFNBQVM7QUFBQSxJQUNYLENBQUM7QUFDRDtBQUFBLEVBQ0Y7QUFFQSxRQUFNLFVBQVUsMkJBQTJCO0FBRTNDLE1BQUk7QUFDRixVQUFNLE1BQU0sTUFBTSxJQUFJLE9BQU87QUFDN0IsVUFBTSxJQUFJLFVBQVUsR0FBRztBQUN2Qiw4QkFBVTtBQUFBLE1BQ1IsT0FBTyxpQkFBTSxNQUFNO0FBQUEsTUFDbkIsT0FBTztBQUFBLE1BQ1AsU0FBUyxXQUFXO0FBQUEsSUFDdEIsQ0FBQztBQUFBLEVBQ0gsU0FBUyxPQUFQO0FBQ0EsOEJBQVU7QUFBQSxNQUNSLE9BQU8saUJBQU0sTUFBTTtBQUFBLE1BQ25CLE9BQU87QUFBQSxNQUNQLFNBQVMsbUNBQW1DO0FBQUEsSUFDOUMsQ0FBQztBQUFBLEVBQ0g7QUFDRjsiLAogICJuYW1lcyI6IFtdCn0K
