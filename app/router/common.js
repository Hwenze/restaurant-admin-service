'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/api/getAgreement', controller.common.queryuserAgreement);
  router.post('/api/setAgreement', controller.common.updateuserAgreement);
  router.post('/api/uploadImage', controller.common.uploadImage);
  router.get('/api/getHomeRotation', jwt, controller.common.queryHomeRotation);
  router.post('/api/changeRotationStatus', jwt, controller.common.changeRotationStatus);
};

