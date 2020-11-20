'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller, middleware } = app;
  const jwt = middleware.tokenHandler(app.config.jwt);

  router.get('/api/getAgreement', jwt, controller.common.queryuserAgreement);
  router.post('/api/setAgreement', jwt, controller.common.updateuserAgreement);
  router.get('/api/getHomeRotation', jwt, controller.common.queryHomeRotation);
  router.post('/api/changeRotationStatus', jwt, controller.common.changeRotationStatus);
};

