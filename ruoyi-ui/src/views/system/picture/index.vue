<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="主键" prop="id">
        <el-input
          v-model="queryParams.id"
          placeholder="请输入主键"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图片名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入图片名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务ID" prop="taskId">
        <el-input
          v-model="queryParams.taskId"
          placeholder="请输入任务ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="执行ID" prop="executeId">
        <el-input
          v-model="queryParams.executeId"
          placeholder="请输入执行ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图片类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择图片类型" clearable>
          <el-option
            v-for="dict in dict.type.brand_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="关联we_look表的主键" prop="lookId">
        <el-input
          v-model="queryParams.lookId"
          placeholder="请输入关联we_look表的主键"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="父id" prop="pid">
        <el-input
          v-model="queryParams.pid"
          placeholder="请输入父id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="dataStatus">
        <el-select v-model="queryParams.dataStatus" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.we_data_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:picture:add']"
        >新增</el-button>
      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:picture:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:picture:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:picture:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="pictureList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="图片名称" align="center" prop="name" />
      <el-table-column label="AI生成图片URL" align="center" prop="aiUrl">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.aiUrl"
            :preview-src-list="[scope.row.aiUrl]"
            fit="cover"
            style="width: 80px; height: 80px"
            lazy
          />
        </template>
      </el-table-column>
      <el-table-column label="任务ID" align="center" prop="taskId" />
      <el-table-column label="执行ID" align="center" prop="executeId" />
      <el-table-column label="图片类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.brand_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="关联we_look表的主键" align="center" prop="lookId" />
      <el-table-column label="look图片URL" align="center" prop="lookUrl">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.lookUrl"
            :preview-src-list="[scope.row.lookUrl]"
            fit="cover"
            style="width: 80px; height: 80px"
            lazy
          />
        </template>
      </el-table-column>
      <el-table-column label="父id" align="center" prop="pid" />
      <el-table-column label="状态" align="center" prop="dataStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.we_data_status" :value="scope.row.dataStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:picture:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:picture:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改AI图片对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="图片名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入图片名称" />
        </el-form-item>
        <el-form-item label="AI生成图片URL" prop="aiUrl">
          <el-input v-model="form.aiUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="任务ID" prop="taskId">
          <el-input v-model="form.taskId" placeholder="请输入任务ID" />
        </el-form-item>
        <el-form-item label="执行ID" prop="executeId">
          <el-input v-model="form.executeId" placeholder="请输入执行ID" />
        </el-form-item>
        <el-form-item label="图片类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择图片类型">
            <el-option
              v-for="dict in dict.type.brand_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="关联we_look表的主键" prop="lookId">
          <el-input v-model="form.lookId" placeholder="请输入关联we_look表的主键" />
        </el-form-item>
        <el-form-item label="外观图片URL" prop="lookUrl">
          <el-input v-model="form.lookUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="父id" prop="pid">
          <el-input v-model="form.pid" placeholder="请输入父id" />
        </el-form-item>
        <el-form-item label="状态" prop="dataStatus">
          <el-select v-model="form.dataStatus" placeholder="请选择状态">
            <el-option
              v-for="dict in dict.type.we_data_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPicture, getPicture, delPicture, addPicture, updatePicture } from "@/api/system/picture"

export default {
  name: "Picture",
  dicts: ['brand_type', 'we_data_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // AI图片表格数据
      pictureList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: null,
        name: null,
        aiUrl: null,
        taskId: null,
        executeId: null,
        type: null,
        lookId: null,
        lookUrl: null,
        pid: null,
        dataStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询AI图片列表 */
    getList() {
      this.loading = true
      listPicture(this.queryParams).then(response => {
        this.pictureList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        aiUrl: null,
        taskId: null,
        executeId: null,
        type: null,
        lookId: null,
        lookUrl: null,
        pid: null,
        dataStatus: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加AI图片"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getPicture(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改AI图片"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePicture(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addPicture(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除AI图片编号为"' + ids + '"的数据项？').then(function() {
        return delPicture(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/picture/export', {
        ...this.queryParams
      }, `picture_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
