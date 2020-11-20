'use strict';

const Controller = require('egg').Controller;
const { cb } = require('../utils/index');
const pump = require('mz-modules/pump');
const path = require('path');
const fs = require('fs');

class CommonController extends Controller {

    // 查询用户协议
    async queryuserAgreement() {
        const { ctx } = this;
        const result = await ctx.service.common.queryuserAgreement(1);
        if (result) {
            ctx.body = cb({ data: result });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

    // 更改用户协议
    async updateuserAgreement() {
        const { ctx } = this;
        const { agreement = '' } = ctx.request.body;
        const result = await ctx.service.common.updateuserAgreement(agreement);
        if (result) {
            ctx.body = cb({ data: '保存成功！' });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

    // 上传组件
    async uploadImage() {
        const { ctx, app } = this;

        const parts = ctx.multipart({ autoFields: true });
        let files = {};
        // 文件流
        let stream;
        while ((stream = await parts()) != null) {
            if (!stream.filename) {
                break;
            }
            // 上传图片的目录
            const dir = await ctx.service.common.getUploadFileDirname(stream);
            const target = dir.systemPath;
            // 将图片存进库
            const writeStream = fs.createWriteStream(target);
            // 结束
            await pump(stream, writeStream);

            files = {
                image: dir.image,
                url: `${app.config.uploadOrgin}/public${dir.image}`,
                orgin: dir.imageUrl,
                system: dir.systemPath
            }
            
        }
        if(files.url){
            ctx.body = cb({ data: files });
        }else{
            ctx.body = cb({ msg:'上传失败' });
        }
    }

    // 查询首页轮播
    async queryHomeRotation() {
        const { ctx } = this;
        const result = await ctx.service.common.queryHomeRotation(ctx.query);
        if (result) {
            ctx.body = cb({ data: result });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

    // 启用 or 禁用 首页轮播
    async changeRotationStatus() {
        const { ctx } = this;
        const result = await ctx.service.common.changeRotationStatus(ctx.request.body);
        ctx.body = cb(result ? { msg: '修改成功' } : { code: 500, msg: '修改失败' });
    }

}

module.exports = CommonController;