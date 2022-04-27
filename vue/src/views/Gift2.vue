<template>
  <div>
    <div style="margin: 10px 0">
      <el-input
        style="width: 200px"
        placeholder="请输入礼品名称"
        suffix-icon="el-icon-search"
        v-model="name"
      ></el-input>
      <el-input
        style="width: 200px"
        placeholder="请输入积分价格"
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
        prop="name"
        label="礼品名称"
        width="100"
      ></el-table-column>
      <el-table-column
        prop="price"
        label="所需积分"
        width="120"
      ></el-table-column>
      <el-table-column label="操作" width="100" align="center">
        <template slot-scope="scope">
          <el-popconfirm
            class="ml-5"
            confirm-button-text="确定"
            cancel-button-text="我再想想"
            icon="el-icon-info"
            icon-color="red"
            title="您确定兑换吗？"
            @confirm="buys(scope.row)"
          >
            <el-button type="success" slot="reference"
              >兑换 <i class="el-icon-remove-outline"></i
            ></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
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
// import { buy } from "../../api/index";

export default {
  name: "Gift2",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      price: "",
      form: {username:"",spend:"",name:""},
      dialogFormVisible: false,
      multipleSelection: [],
      roles: [],
    };
  },
  created() {
    this.load();
    this.getuser();
  },
  methods: {
    load() {
      this.request
        .get("/gift/page", {
          params: {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            name: this.name,
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
    getuser(){
    let username = localStorage.getItem("user")? JSON.parse(localStorage.getItem("user")).username: "";
      if (username) {
        // 从后台获取User数据
        this.request.get("/user/username/" + username).then((res) => {
          // 重新赋值后台的最新User数据
          this.user = res.data; 
        })
      }
      
    },
    buys(row) {
      this.getuser();
      let spend=row.price
      let name = row.name 
      let username = this.user.username
    //  console.log(name)
    // this.form.username=username
    // this.form.spend=spend
    // this.form.name =name
      var params={
          username:username,
          spend:spend,
          name:name,
        }
        console.log(params)
      //用户，消费积分，消费名称
      this.request.post("/record/save",params).then((res) => {
        if (res.code === "200") {
          //这里不返回数据
          this.$message.success("兑换成功");
          this.load();
        } else {
          this.$message.error("兑换失败！");
        }
      });
    },
    reset() {
      this.name = "";
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
  },
};
</script>


<style>
.headerBg {
  background: #eee !important;
}
</style>
