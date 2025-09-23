<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!-- 上传look -->
      <el-col :span="6">
        <el-card class="upload-card">
          <div slot="header" class="clearfix">
            <span>上传look</span>
          </div>
          <el-upload
            class="upload-demo"
            drag
            :auto-upload="false"
            :on-change="handleLookChange"
            action=""
          >
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过10MB</div>
          </el-upload>
          <div v-if="lookImageUrl" class="image-preview">
            <img :src="lookImageUrl" class="preview-image" />
          </div>
        </el-card>
      </el-col>

      <!-- 上传模特 -->
      <el-col :span="6">
        <el-card class="upload-card">
          <div slot="header" class="clearfix">
            <span>上传模特</span>
          </div>
          <el-upload
            class="upload-demo"
            drag
            :auto-upload="false"
            :on-change="handleModelChange"
            action=""
          >
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过10MB</div>
          </el-upload>
          <div v-if="modelImageUrl" class="image-preview">
            <img :src="modelImageUrl" class="preview-image" />
          </div>
        </el-card>
      </el-col>

      <!-- 上传背景 -->
      <el-col :span="6">
        <el-card class="upload-card">
          <div slot="header" class="clearfix">
            <span>上传背景</span>
          </div>
          <el-upload
            class="upload-demo"
            drag
            :auto-upload="false"
            :on-change="handleBackgroundChange"
            action=""
          >
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过10MB</div>
          </el-upload>
          <div v-if="backgroundImageUrl" class="image-preview">
            <img :src="backgroundImageUrl" class="preview-image" />
          </div>
        </el-card>
      </el-col>

      <!-- 生成按钮 -->
      <el-col :span="6">
        <el-card class="generate-card">
          <div slot="header" class="clearfix">
            <span>操作</span>
          </div>
          <el-button
            type="primary"
            @click="generateImage"
            :loading="generateLoading"
            :disabled="!lookFile || !modelFile || !backgroundFile"
            size="large"
          >
            点击生成
          </el-button>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { autoGenerateAiImage } from "@/api/system/look"

export default {
  data() {
    return {
      lookFile: null,
      modelFile: null,
      backgroundFile: null,
      lookImageUrl: '',
      modelImageUrl: '',
      backgroundImageUrl: '',
      generateLoading: false
    }
  },
  created() {

  },
  methods: {
    handleLookChange(file) {
      // 检查文件大小(10MB)
      const maxSize = 10 * 1024 * 1024;
      if (file.raw.size > maxSize) {
        this.$message.error('文件大小不能超过10MB');
        return;
      }
      
      this.lookFile = file.raw;
      this.lookImageUrl = URL.createObjectURL(file.raw);
    },
    handleModelChange(file) {
      // 检查文件大小(10MB)
      const maxSize = 10 * 1024 * 1024;
      if (file.raw.size > maxSize) {
        this.$message.error('文件大小不能超过10MB');
        return;
      }
      
      this.modelFile = file.raw;
      this.modelImageUrl = URL.createObjectURL(file.raw);
    },
    handleBackgroundChange(file) {
      // 检查文件大小(10MB)
      const maxSize = 10 * 1024 * 1024;
      if (file.raw.size > maxSize) {
        this.$message.error('文件大小不能超过10MB');
        return;
      }
      
      this.backgroundFile = file.raw;
      this.backgroundImageUrl = URL.createObjectURL(file.raw);
    },
    async generateImage() {
      // 检查是否所有文件都已选择
      if (!this.lookFile || !this.modelFile || !this.backgroundFile) {
        this.$message.error('请先选择所有文件');
        return;
      }
      
      this.generateLoading = true;
      try {
        // 创建FormData对象
        const formData = new FormData();
        formData.append('lookFile', this.lookFile);
        formData.append('modelFile', this.modelFile);
        formData.append('backgroundFile', this.backgroundFile);

        // 调用后端接口
        const response = await autoGenerateAiImage(formData);
        this.$message.success('生成成功');
        console.log('生成结果:', response);
      } catch (error) {
        this.$message.error('生成失败: ' + error.message);
        console.error('生成失败:', error);
      } finally {
        this.generateLoading = false;
      }
    }
  }
}
</script>

<style scoped>
.upload-card,
.generate-card {
  height: 100%;
}

.image-preview {
  margin-top: 10px;
  text-align: center;
}

.preview-image {
  max-width: 100%;
  max-height: 150px;
}

.upload-demo {
  text-align: center;
}
</style>