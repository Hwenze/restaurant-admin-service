'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller, middleware } = app;
  const jwt = middleware.tokenHandler(app.config.jwt);
  router.get('/operate/getUserList', jwt, controller.operate.queryUserListByAdminId);
  router.get('/operate/getRoleList', jwt, controller.operate.queryRoleListByAdminId);
  router.post('/operate/deleRoleById', jwt, controller.operate.deleteRoleById);
  router.post('/operate/changeUserStatus', jwt, controller.user.changeUserStatus);
  router.post('/operate/addUser', jwt, controller.operate.insertUserByAminId);
  router.post('/operate/deleteUser', jwt, controller.user.deleteUserById);
};

