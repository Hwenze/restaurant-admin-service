'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  require('./router/index')(app);
  require('./router/user')(app);
};
