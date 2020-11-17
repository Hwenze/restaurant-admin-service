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
};

