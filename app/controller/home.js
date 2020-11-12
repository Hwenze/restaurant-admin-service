'use strict';


const Controller = require('egg').Controller;
const md5 = require('md5');
const { cb } = require('../utils/index');
class HomeController extends Controller {
  async index() {
    const { ctx, app } = this;
    const { uid = null } = ctx.query;
    const result = await ctx.service.user.queryInfoByUserId(uid);
    if (result) {
      ctx.body = result;
    } else {
      ctx.body = {
        code: '该用户不存在'
      }
    }
  }


  // 登陆
  async login() {
    const { ctx, app } = this;
    const { username = null, password = null } = ctx.query;
    if (!username) {
      ctx.body = cb({ code: 1000, msg: '参数[username]不能空' });
      return;
    }
    if (!password) {
      ctx.body = cb({ code: 1000, msg: '参数[password]不能空' });
      return;
    }
    // 查询用户信息
    const result = await ctx.service.user.queryInfoByUserId(username);
    if (result) {
      if (md5(password) === result.password) {
        // 用户信息
        let userinfo = {
          username: result.username,
          avatar: result.avatar,
          nickname: result.nickname
        }
        // 生成token
        const token = app.jwt.sign(userinfo, app.config.jwt.secret, { expiresIn: '2m' }); // 2分钟token过期
        userinfo.token = token;
        // 存进session
        ctx.session.userinfo = userinfo;
        ctx.body = cb({ msg: '登陆成功', data: userinfo });
      } else {
        ctx.body = cb({ msg: '密码错误' });
      }
    } else {
      ctx.body = cb({ msg: '该用户不存在' });
    }
  }




}

module.exports = HomeController;
