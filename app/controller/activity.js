'use strict';

const Controller = require('egg').Controller;
const { cb, filterQuery } = require('../utils/index');

class ActivityController extends Controller {

    // 查询活动资讯列表
    async queryRealTimeInfo() {
        const { ctx } = this;
        const isPass = {
            string: ['title']
        };
        let params = filterQuery(ctx.query, isPass);
        const result = await ctx.service.activity.queryRealTimeInfo(params);
        if (result) {
            ctx.body = cb({ data: result });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

    // 查询活动资讯详情
    async getRealTimeDateils() {
        const { ctx } = this;
        const params = ctx.query.id;
        const result = await ctx.service.activity.getRealTimeDateils(params);
        if (result) {
            ctx.body = cb({ data: result });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

    // 新增活动资讯
    async insertaddRealTimeInfo() {
        const { ctx } = this;
        const isPass = {
            number: [],
            string: ['picture', 'title', 'star_time', 'end_time', 'content']
        }
        const query = filterQuery(ctx.request.body, isPass);
        const { title, star_time, introduce, end_time, content } = query.column;
        if (!title) {
            ctx.body = cb({
                code: 1000,
                msg: '活动标题不能为空',
            });
            return;
        }
        if (!introduce) {
            ctx.body = cb({
                code: 1000,
                msg: '活动介绍不能为空',
            });
            return;
        }
        if (!star_time || !end_time) {
            ctx.body = cb({
                code: 1000,
                msg: '活动时间不能为空',
            });
            return;
        }
        let result = {
            title: title,
            introduce: introduce,
            star_time: star_time,
            end_time: end_time,
            content: content,
        }
        const insertReuslt = await ctx.service.activity.insertaddRealTimeInfo(result);
        if (insertReuslt && insertReuslt.affectedRows === 1) {
            ctx.body = cb({ data: '新增成功' });
            return;
        } else {
            ctx.body = cb({ code: 500, msg: '新增失败' });
            return;
        }
    }

    // 更改活动资讯
    async updateRealTimeInfo() {
        const { ctx } = this;
        const isPass = {
            number: ['id'],
            string: ['picture', 'title', 'star_time', 'end_time', 'content']
        }
        const query = filterQuery(ctx.request.body, isPass);
        const { id, title, introduce, star_time, end_time, content } = query.column;
        if (!id) {
            ctx.body = cb({
                code: 1000,
                msg: '活动ID不能为空',
            });
            return;
        }
        if (!title) {
            ctx.body = cb({
                code: 1000,
                msg: '活动标题不能为空',
            });
            return;
        }
        if (!introduce) {
            ctx.body = cb({
                code: 1000,
                msg: '活动介绍不能为空',
            });
            return;
        }
        if (!star_time || !end_time) {
            ctx.body = cb({
                code: 1000,
                msg: '活动时间不能为空',
            });
            return;
        }
        let result = {
            id: id,
            title: title,
            introduce: introduce,
            star_time: star_time,
            end_time: end_time,
            content: content,
        }
        const insertReuslt = await ctx.service.activity.updateRealTimeInfo(result);
        if (insertReuslt && insertReuslt.affectedRows === 1) {
            ctx.body = cb({ data: '编辑成功' });
            return;
        } else {
            ctx.body = cb({ code: 500, msg: '编辑失败' });
            return;
        }
    }

    // 删除活动资讯
    async deleteRealTimeInfo() {
        const { ctx } = this;
        const { id } = ctx.request.body;
        const result = await ctx.service.activity.deleteRealTimeInfo(id);
        if (result) {
            ctx.body = cb({ data: '删除成功' });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

}

module.exports = ActivityController;