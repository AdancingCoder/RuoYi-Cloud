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

    <!-- 生成结果展示区域 -->
    <el-row v-if="generatedImages.length > 0" :gutter="20" style="margin-top: 20px;">
      <el-col :span="24">
        <el-card class="result-card">
          <div slot="header" class="clearfix">
            <span>生成结果 (共 {{ generatedImages.length }} 张图片)</span>
          </div>
          <el-row :gutter="20">
            <el-col v-for="(image, index) in generatedImages" :key="index" :span="6">
              <div class="image-result">
                <img :src="image" class="result-image" @error="handleImageError(index)" />
                <div class="image-actions">
                  <el-button type="primary" size="mini" @click="downloadImage(image, index)">查看</el-button>
                </div>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>

    <!-- 错误信息展示 -->
    <el-row v-if="errorMessage" :gutter="20" style="margin-top: 20px;">
      <el-col :span="24">
        <el-card class="error-card">
          <div slot="header" class="clearfix">
            <span>错误信息</span>
          </div>
          <el-alert
            :title="errorMessage"
            type="error"
            show-icon
            :closable="false">
          </el-alert>
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
      generateLoading: false,
      generatedImages: [], // 存储生成的图片URL
      errorMessage: '' // 存储错误信息
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
      this.generatedImages = []; // 清空之前的结果
      this.errorMessage = ''; // 清空之前的错误信息
      try {
        // 创建FormData对象
        const formData = new FormData();
        formData.append('lookFile', this.lookFile);
        formData.append('modelFile', this.modelFile);
        formData.append('backgroundFile', this.backgroundFile);

        // 调用后端接口
        const response = await autoGenerateAiImage(formData);
        console.log('生成结果:', response);

        // 处理返回的图片URL
        // 根据request.js的响应拦截器，response已经是res.data
        if (response.code === 200) {
          this.$message.success('生成成功');
          // 检查是否有imageUrls数据
          if (response.imageUrls && response.imageUrls.length > 0) {
            this.generatedImages = response.imageUrls;
          } else {
            this.$message.info('未生成图片或图片数据为空');
          }
        } else {
          this.errorMessage = response.msg || response.message || '未知错误';
          this.$message.error('生成失败: ' + this.errorMessage);
        }
      } catch (error) {
        this.errorMessage = error.message;
        this.$message.error('生成失败: ' + error.message);
        console.error('生成失败:', error);
      } finally {
        this.generateLoading = false;
      }
    },
    // 下载图片
    downloadImage(url, index) {
      // 打开新标签页显示图片
      const newWindow = window.open(url, '_blank');
      if (!newWindow) {
        this.$message.error('弹窗被阻止，请允许弹窗后重试');
      }
    },
    // 处理图片加载错误
    handleImageError(index) {
      this.$message.warning(`图片 ${index + 1} 加载失败`);
    }
  }
}
</script>

<style scoped>
.upload-card,
.generate-card,
.result-card,
.error-card {
  height: 100%;
}

.image-preview {
  margin-top: 10px;
  text-align: center;
}

.preview-image,
.result-image {
  max-width: 100%;
  max-height: 150px;
}

.upload-demo {
  text-align: center;
}

.image-result {
  text-align: center;
  margin-bottom: 20px;
}

.result-image {
  max-width: 100%;
  max-height: 200px;
  border: 1px solid #ebeef5;
  border-radius: 4px;
  padding: 5px;
}

.image-actions {
  margin-top: 10px;
}
</style>
