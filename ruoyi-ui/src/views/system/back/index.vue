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
      <el-form-item label="背景名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入背景名称"
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
      <el-form-item label="背景类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择背景类型" clearable>
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
          v-hasPermi="['system:back:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:back:edit']"
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
          v-hasPermi="['system:back:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:back:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload"
          size="mini"
          @click="handleGenerateModelAndBack"
          v-hasPermi="['system:back:generate']"
        >生成模特及背景</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload"
          size="mini"
          @click="handleUpdatePrompts"
          v-hasPermi="['system:back:updatePrompts']"
        >更新提示词</el-button>
<!--        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="importTemplate"
          v-hasPermi="['system:back:updatePrompts']"
        >下载模板</el-button>-->
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="backList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="背景名称" align="center" prop="name" />
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
      <el-table-column label="背景ID" align="center" prop="backWeId" />
      <el-table-column label="背景描述" align="center" prop="promot" >
        <template slot-scope="scope">
          <el-tooltip :content="scope.row.promot" placement="top" v-if="scope.row.promot && scope.row.promot.length > 20">
            <span>{{ scope.row.promot.substring(0, 20) }}...</span>
          </el-tooltip>
          <span v-else>{{ scope.row.promot }}</span>
        </template>
      </el-table-column>
      <el-table-column label="背景类型" align="center" prop="type">
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
            v-hasPermi="['system:back:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:back:remove']"
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

    <!-- 添加或修改背景对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="背景名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入背景名称" />
        </el-form-item>
        <el-form-item label="背景图片URL" prop="backUrl">
          <el-input v-model="form.backUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="背景ID" prop="backWeId">
          <el-input v-model="form.backWeId" placeholder="请输入背景ID" />
        </el-form-item>
        <el-form-item label="背景描述" prop="promot">
          <el-input v-model="form.promot" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="背景类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择背景类型">
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

    <!-- 更新提示词对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :on-error="handleFileError"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <div class="el-upload__tip" slot="tip">
            *.xlsx、*.xls格式文件
          </div>
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button @click="upload.open = false">取 消</el-button>
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listBack, getBack, delBack, addBack, updateBack, generateModelAndBack, updatePrompts } from "@/api/system/back"
import { parseTime } from "@/utils"

export default {
  name: "Back",
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
      // 背景表格数据
      backList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 上传参数
      upload: {
        // 是否显示弹出层（更新提示词）
        open: false,
        // 弹出层标题（更新提示词）
        title: "更新提示词",
        // 是否禁用上传
        isUploading: false,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + this.$store.getters.token },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/system/back/updatePrompts"
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: null,
        name: null,
        backUrl: null,
        backWeId: null,
        promot: null,
        type: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "背景名称不能为空", trigger: "blur" }
        ],
        backUrl: [
          { required: true, message: "背景图片URL不能为空", trigger: "blur" }
        ],
        backWeId: [
          { required: true, message: "背景ID不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "背景类型不能为空", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询背景列表 */
    getList() {
      this.loading = true
      listBack(this.queryParams).then(response => {
        this.backList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 取消生成按钮
    cancelGenerate() {
      this.generateOpen = false
      this.resetGenerate()
    },
    // 取消更新提示词按钮
    cancelUpdatePrompts() {
      this.updatePromptsOpen = false
      this.resetUpdatePrompts()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        backUrl: null,
        backWeId: null,
        promot: null,
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
    // 生成表单重置
    resetGenerate() {
      this.generateForm = {}
      this.fileList = []
      this.jsonFile = null
      this.resetForm("generateForm")
    },
    // 更新提示词表单重置
    resetUpdatePrompts() {
      this.updatePromptsForm = {}
      this.promptFileList = []
      this.excelFile = null
      this.resetForm("updatePromptsForm")
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
      this.title = "添加背景"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getBack(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改背景"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBack(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addBack(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除背景编号为"' + ids + '"的数据项？').then(function() {
        return delBack(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/back/export', {
        ...this.queryParams
      }, `back_${new Date().getTime()}.xlsx`)
    },
    /** 生成模特及背景 */
    handleGenerateModelAndBack() {
      this.$modal.confirm('是否确认生成模特及背景数据？').then(function() {
        return generateModelAndBack();
      }).then((response) => {
        this.$modal.msgSuccess(response.msg);
        this.getList();
      }).catch(() => {});
    },
    /** 更新提示词 */
    handleUpdatePrompts() {
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download('system/back/importTemplate', {
      }, `back_template_${parseTime(Date.now(), '{y}{m}{d}')}.xlsx`)
    },
    // 文件提交处理
    submitFileForm() {
      this.$refs.upload.submit();
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
      this.getList();
    },
    // 文件上传失败处理
    handleFileError(error, file, fileList) {
      this.upload.isUploading = false;
      this.$modal.msgError("上传失败，请重试");
    }
  }
}
</script>