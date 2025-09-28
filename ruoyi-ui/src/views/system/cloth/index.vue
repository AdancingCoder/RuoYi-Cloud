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
      <el-form-item label="服装名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入服装名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="服装类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择服装类型" clearable>
          <el-option
            v-for="dict in dict.type.brand_type"
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:cloth:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-upload"
          size="mini"
          @click="handleUploadLook"
          v-hasPermi="['system:cloth:add']"
        >上传look图</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:cloth:edit']"
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
          v-hasPermi="['system:cloth:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:cloth:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="clothList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="服装名称" align="center" prop="name" />
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
      <el-table-column label="服装类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.brand_type" :value="scope.row.type"/>
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
            v-hasPermi="['system:cloth:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:cloth:remove']"
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

    <!-- 添加或修改服装对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="服装名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入服装名称" />
        </el-form-item>
        <el-form-item label="服装图片URL" prop="clothUrl">
          <el-input v-model="form.clothUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="服装类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择服装类型">
            <el-option
              v-for="dict in dict.type.brand_type"
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

    <!-- 上传look图对话框 -->
    <el-dialog title="上传look图" :visible.sync="uploadLookOpen" width="500px" append-to-body>
      <el-form ref="uploadLookForm" :model="uploadLookForm" :rules="uploadLookRules" label-width="80px">
        <el-form-item label="选择图片" prop="lookFile">
          <el-upload
            class="avatar-uploader"
            action="#"
            :auto-upload="false"
            :show-file-list="true"
            :on-change="handleFileChange"
            accept="image/*"
          >
            <el-button size="small" type="primary">点击上传</el-button>
            <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过20MB</div>
          </el-upload>
        </el-form-item>
        <el-form-item label="服装类型" prop="type">
          <el-select v-model="uploadLookForm.type" placeholder="请选择服装类型">
            <el-option
              v-for="dict in dict.type.brand_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitUploadLook">确 定</el-button>
        <el-button @click="cancelUploadLook">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCloth, getCloth, delCloth, addCloth, updateCloth, uploadLook } from "@/api/system/cloth"

export default {
  name: "Cloth",
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
      // 服装表格数据
      clothList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示上传look图弹出层
      uploadLookOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: null,
        name: null,
        clothUrl: null,
        type: null,
      },
      // 表单参数
      form: {},
      // 上传look图表单参数
      uploadLookForm: {
        lookFile: null,
        type: null
      },
      // 表单校验
      rules: {
      },
      // 上传look图表单校验
      uploadLookRules: {
        lookFile: [{ required: true, message: "请选择图片文件", trigger: "change" }],
        type: [{ required: true, message: "请选择服装类型", trigger: "change" }]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询服装列表 */
    getList() {
      this.loading = true
      listCloth(this.queryParams).then(response => {
        this.clothList = response.rows
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
        clothUrl: null,
        type: null,
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
      this.title = "添加服装"
    },
    /** 上传look图按钮操作 */
    handleUploadLook() {
      this.uploadLookForm = {
        lookFile: null,
        type: null
      }
      this.uploadLookOpen = true
      this.resetForm("uploadLookForm")
    },
    /** 文件选择处理 */
    handleFileChange(file) {
      this.uploadLookForm.lookFile = file.raw
    },
    /** 取消上传look图 */
    cancelUploadLook() {
      this.uploadLookOpen = false
      this.resetForm("uploadLookForm")
    },
    /** 提交上传look图 */
    submitUploadLook() {
      this.$refs["uploadLookForm"].validate(valid => {
        if (valid) {
          uploadLook(this.uploadLookForm).then(response => {
            this.$modal.msgSuccess("上传成功")
            this.uploadLookOpen = false
            this.getList()
          })
        }
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getCloth(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改服装"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCloth(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addCloth(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除服装编号为"' + ids + '"的数据项？').then(function() {
        return delCloth(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/cloth/export', {
        ...this.queryParams
      }, `cloth_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
