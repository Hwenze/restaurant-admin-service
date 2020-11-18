'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller, middleware } = app;
  const jwt = middleware.tokenHandler(app.config.jwt);
  router.get('/operate/getUserList', jwt, controller.operate.queryUserListByAdminId);
  router.post('/operate/changeUserStatus', jwt, controller.user.changeUserStatus);
  router.post('/operate/addUser', jwt, controller.operate.insertUserByAminId);
  router.post('/operate/deleteUser', jwt, controller.user.deleteUserById);


  //权限

  router.get('/operate/getRoleList', jwt, controller.operate.queryRoleListByAdminId);
  router.post('/operate/deleRole', jwt, controller.operate.deleteRoleById);
  router.post('/operate/changeRoleStatus', jwt, controller.operate.changeRoleStatus);
  router.get('/operate/getRoleInfo',jwt,controller.operate.queryRoleInfoById);
};

