const { RETURN_CODE } = require('./enum');

// 接口统一回调
const cb = (option) => {
    const { code = 200, data = null, msg = RETURN_CODE[200] } = option;
    let result = {
        ...option,
        code,
        msg: msg || RETURN_CODE[code],
    };
    if (data) {
        result.data = data;
    }
    return result;
};

// 递归获取树状
// 结构
/**
 * {
 *   id:1
 *   parentId:0,
 *   children:[
 *     {
*        id:1
*        parentId:0,
*        children:[]
 *     }
 *   ]
 * }
 */
const TREE = (arr, parentId = 0) => {
    let temp = [];  // 输出模板
    let treeArr = arr;
    treeArr.forEach((item, index) => {
        item.parentId *= 1;
        if (item.parentId == parentId) {
            if (TREE(treeArr, treeArr[index].id).length > 0) {
                // 递归调用此函数
                treeArr[index].children = TREE(treeArr, treeArr[index].id);
            }
            temp.push({ ...treeArr[index] });
        }
    });
    return temp;
};
// 遍历分类树
const CATEGORYTREE = (arr, pid = 0) => {
    let temp = [];  // 输出模板
    let treeArr = arr;
    treeArr.forEach((item, index) => {
        item.isHide = item.isHide * 1 == 1 ? true : false;
        item.parentId *= 1;
        if (item.parentId == pid) {
            if (CATEGORYTREE(treeArr, treeArr[index].id).length > 0) {
                // 递归调用此函数
                if (item) {
                    treeArr[index].children = CATEGORYTREE(treeArr, treeArr[index].id);
                }
            }
            temp.push({ ...treeArr[index] });
        }
    });
    return temp;
};
const ID = () => {
    return Math.random().toString(32).slice(2)
}
// 四舍五入
const Price = (num) => {
    return (Math.round(num * 100) / 100);
}



module.exports = {
    cb,
    TREE,
    CATEGORYTREE
};
