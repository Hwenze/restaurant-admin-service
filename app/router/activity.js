'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller, middleware } = app;
  const jwt = middleware.tokenHandler(app.config.jwt);

  // 活动资讯
  router.get('/activity/getRealTimeInfo', jwt, controller.activity.queryRealTimeInfo);
  router.get('/activity/getRealTimeDateils', jwt, controller.activity.getRealTimeDateils);
  router.post('/activity/updateRealTimeInfo', jwt, controller.activity.updateRealTimeInfo);
  router.post('/activity/addRealTimeInfo', jwt, controller.activity.insertaddRealTimeInfo);
  router.post('/activity/deleteRealTimeInfo', jwt, controller.activity.deleteRealTimeInfo);
};