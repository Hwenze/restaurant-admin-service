'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  require('./router/common')(app);
  require('./router/index')(app);
  require('./router/user')(app);
  require('./router/operate')(app);
  require('./router/product')(app);
  require('./router/activity')(app);
};
