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
      <el-form-item label="外观名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入外观名称"
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
      <el-form-item label="外观类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择外观类型" clearable>
          <el-option
            v-for="dict in dict.type.brand_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="关联we_model表的主键" prop="modelId">
        <el-input
          v-model="queryParams.modelId"
          placeholder="请输入关联we_model表的主键"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模特ID" prop="modelWeId">
        <el-input
          v-model="queryParams.modelWeId"
          placeholder="请输入模特ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联we_back表的主键" prop="backId">
        <el-input
          v-model="queryParams.backId"
          placeholder="请输入关联we_back表的主键"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="背景ID" prop="backWeId">
        <el-input
          v-model="queryParams.backWeId"
          placeholder="请输入背景ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联we_cloth表的主键" prop="clothId">
        <el-input
          v-model="queryParams.clothId"
          placeholder="请输入关联we_cloth表的主键"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['system:look:add']"
        >新增</el-button>
      </el-col>-->
<!--      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:look:edit']"
        >修改</el-button>
      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:look:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:look:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-refresh"
          size="mini"
          @click="handleGenerateData"
          v-hasPermi="['system:look:add']"
        >生成数据</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-video-play"
          size="mini"
          :disabled="multiple"
          @click="handleGenerateLooks"
          v-hasPermi="['system:look:add']"
        >生成look</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-picture"
          size="mini"
          :disabled="multiple"
          @click="handleGenerateAiImage"

        >生成AI图</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="lookList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="外观名称" align="center" prop="name" />
      <el-table-column label="外观图片URL" align="center" prop="lookUrl">
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
      <el-table-column label="任务ID" align="center" prop="taskId" />
      <el-table-column label="执行ID" align="center" prop="executeId" />
      <el-table-column label="外观类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.brand_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="关联we_model表的主键" align="center" prop="modelId" />
      <el-table-column label="模特ID" align="center" prop="modelWeId" />
      <el-table-column label="模特文件URL" align="center" prop="modelUrl">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.modelUrl"
            :preview-src-list="[scope.row.modelUrl]"
            fit="cover"
            style="width: 80px; height: 80px"
            lazy
          />
        </template>
      </el-table-column>
      <el-table-column label="关联we_back表的主键" align="center" prop="backId" />
      <el-table-column label="背景ID" align="center" prop="backWeId" />
      <el-table-column label="背景图片URL" align="center" prop="backUrl">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.backUrl"
            :preview-src-list="[scope.row.backUrl]"
            fit="cover"
            style="width: 80px; height: 80px"
            lazy
          />
        </template>
      </el-table-column>
      <el-table-column label="关联we_cloth表的主键" align="center" prop="clothId" />
      <el-table-column label="服装图片URL" align="center" prop="clothUrl">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.clothUrl"
            :preview-src-list="[scope.row.clothUrl]"
            fit="cover"
            style="width: 80px; height: 80px"
            lazy
          />
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
<!--          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:look:edit']"
          >修改</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:look:remove']"
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

    <!-- 添加或修改外观对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="外观名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入外观名称" />
        </el-form-item>
        <el-form-item label="外观图片URL" prop="lookUrl">
          <el-input v-model="form.lookUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="任务ID" prop="taskId">
          <el-input v-model="form.taskId" placeholder="请输入任务ID" />
        </el-form-item>
        <el-form-item label="执行ID" prop="executeId">
          <el-input v-model="form.executeId" placeholder="请输入执行ID" />
        </el-form-item>
        <el-form-item label="外观类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择外观类型">
            <el-option
              v-for="dict in dict.type.brand_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="关联we_model表的主键" prop="modelId">
          <el-input v-model="form.modelId" placeholder="请输入关联we_model表的主键" />
        </el-form-item>
        <el-form-item label="模特ID" prop="modelWeId">
          <el-input v-model="form.modelWeId" placeholder="请输入模特ID" />
        </el-form-item>
        <el-form-item label="模特文件URL" prop="modelUrl">
          <el-input v-model="form.modelUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="关联we_back表的主键" prop="backId">
          <el-input v-model="form.backId" placeholder="请输入关联we_back表的主键" />
        </el-form-item>
        <el-form-item label="背景ID" prop="backWeId">
          <el-input v-model="form.backWeId" placeholder="请输入背景ID" />
        </el-form-item>
        <el-form-item label="背景图片URL" prop="backUrl">
          <el-input v-model="form.backUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="关联we_cloth表的主键" prop="clothId">
          <el-input v-model="form.clothId" placeholder="请输入关联we_cloth表的主键" />
        </el-form-item>
        <el-form-item label="服装图片URL" prop="clothUrl">
          <el-input v-model="form.clothUrl" type="textarea" placeholder="请输入内容" />
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
import { listLook, getLook, delLook, addLook, updateLook, generateLookData, generateLooks, generateAiImage } from "@/api/system/look"

export default {
  name: "Look",
  dicts: ['brand_type'],
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
      // 外观表格数据
      lookList: [],
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
        lookUrl: null,
        taskId: null,
        executeId: null,
        type: null,
        modelId: null,
        modelWeId: null,
        modelUrl: null,
        backId: null,
        backWeId: null,
        backUrl: null,
        clothId: null,
        clothUrl: null,
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
    /** 查询外观列表 */
    getList() {
      this.loading = true
      listLook(this.queryParams).then(response => {
        this.lookList = response.rows
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
        lookUrl: null,
        taskId: null,
        executeId: null,
        type: null,
        modelId: null,
        modelWeId: null,
        modelUrl: null,
        backId: null,
        backWeId: null,
        backUrl: null,
        clothId: null,
        clothUrl: null,
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
      this.title = "添加外观"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getLook(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改外观"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLook(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addLook(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除外观编号为"' + ids + '"的数据项？').then(function() {
        return delLook(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/look/export', {
        ...this.queryParams
      }, `look_${new Date().getTime()}.xlsx`)
    },
    /** 生成数据按钮操作 */
    handleGenerateData() {
      this.$modal.confirm('是否确认生成数据？').then(() => {
        return generateLookData()
      }).then(response => {
        this.getList()
        this.$modal.msgSuccess(response.msg)
      }).catch(() => {})
    },
    /** 生成look按钮操作 */
    handleGenerateLooks() {
      const lookIds = this.ids;
      this.$modal.confirm('是否确认生成look？').then(() => {
        return generateLooks(lookIds)
      }).then(response => {
        this.getList()
        this.$modal.msgSuccess("生成成功")
      }).catch(() => {})
    },

    /** 生成AI图按钮操作 */
    handleGenerateAiImage() {
      const lookIds = this.ids;
      this.$modal.confirm('是否确认为选中的LOOK生成AI图?').then(() => {
        return generateAiImage(lookIds)
      }).then(response => {
        this.getList()
        this.$modal.msgSuccess("生成AI图任务已提交")
      }).catch(() => {})
    }
  }
}
</script>
