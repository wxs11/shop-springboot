<template>
  <div>
    <div style="margin: 10px 0">
      <el-input
        style="width: 200px"
        placeholder="请输入名称"
        suffix-icon="el-icon-search"
        v-model="username"
      ></el-input>
      <el-input
        style="width: 200px"
        placeholder="请输入消耗积分"
        suffix-icon="el-icon-search"
        class="ml-5"
        v-model="price"
      ></el-input>

      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <el-table
      :data="tableData"
      border
      stripe
      :header-cell-class-name="'headerBg'"
      @selection-change="handleSelectionChange"
    >
      <el-table-column prop="id" label="ID" width="40"></el-table-column>
      <el-table-column
        prop="username"
        label="用户"
        width="100"
      ></el-table-column>
      <el-table-column
        prop="name"
        label="兑换物品"
        width="100"
      ></el-table-column>
      <el-table-column
        prop="spend"
        label="消耗积分"
        width="120"
      ></el-table-column>
      <el-table-column
        prop="createTime"
        label="兑换时间"
        width="200"
        :formatter="formatDateTime"
      ></el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[2, 5, 10, 20]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { serverIp } from "../../public/config";

export default {
  name: "Record",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      username: "",
      price: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      roles: [],
    };
  },
  created() {
    this.load();
  },
  methods: {
    load() {
      this.request
        .get("/record/page", {
          params: {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            username: this.username,
            price: this.price,
          },
        })
        .then((res) => {
          this.tableData = res.data.records;
          this.total = res.data.total;
        });

      this.request.get("/role").then((res) => {
        this.roles = res.data;
      });
    },
    handleSelectionChange(val) {
      console.log(val);
      this.multipleSelection = val;
    },
    reset() {
      this.username = "";
      this.price = "";
      this.load();
    },
    handleSizeChange(pageSize) {
      console.log(pageSize);
      this.pageSize = pageSize;
      this.load();
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum);
      this.pageNum = pageNum;
      this.load();
    },
    // 时间戳转换日期格式方法
    formatDateTime(row,column) {
      if (row == null) {
        return "";
      } else {
        var date = new Date(row[column.property]);
        var y = date.getFullYear(); // 年
        let MM = date.getMonth() + 1; // 月
        MM = MM < 10 ? "0" + MM : MM;
        let d = date.getDate(); // 日
        d = d < 10 ? "0" + d : d;
        let h = date.getHours(); // 时
        h = h < 10 ? "0" + h : h;
        let m = date.getMinutes(); // 分
        m = m < 10 ? "0" + m : m;
        let s = date.getSeconds(); // 秒
        s = s < 10 ? "0" + s : s;
        return y + "-" + MM + "-" + d + " " + h + ":" + m + ":" + s;
      }
    },
  },
};
</script>


<style>
.headerBg {
  background: #eee !important;
}
</style>
