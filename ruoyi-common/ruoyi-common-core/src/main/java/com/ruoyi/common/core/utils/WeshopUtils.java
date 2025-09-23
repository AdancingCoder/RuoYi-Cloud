package com.ruoyi.common.core.utils;

import java.util.HashMap;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.DataOutputStream;
import java.io.DataInputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.HttpURLConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

/**
 * Weshop工具类
 * 提供与Weshop AI服务交互的方法
 *
 * @author ruoyi
 */
public class WeshopUtils {
    private static final Logger log = LoggerFactory.getLogger(WeshopUtils.class);

    // Weshop API基础URL
    private static final String BASE_URL = "https://openapi.weshop.com/openapi/v1";
    
    // API密钥
    private static final String API_KEY = "Bvrrnc4lOI6MgUiGQyxwuUCKc3uQCZT9";

    /**
     * 获取API密钥（预留扩展接口，后续应实现动态获取）
     *
     * @return 当前有效的API密钥字符串
     */
    private static String getApiKey() {
        // TODO: 实现从配置中心或安全存储中动态获取API密钥
        return API_KEY;
    }

    /**
     * 上传图片到Weshop
     *
     * @param imageFile 图片文件
     * @return 上传后的图片URL
     */
    public static String uploadImage(File imageFile) {
        try {
            String boundary = "----" + System.currentTimeMillis();
            String urlStr = BASE_URL + "/asset/upload/image";
            
            URL url = new URL(urlStr);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            
            // 设置请求属性
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            connection.setRequestProperty("Authorization", getApiKey());
            
            // 获取文件扩展名以确定Content-Type
            String fileName = imageFile.getName();
            String fileExtension = "jpeg"; // 默认
            if (fileName.contains(".")) {
                fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            }
            String contentType = "image/" + fileExtension;
            if (!"image/jpeg".equals(contentType) && !"image/png".equals(contentType) && !"image/gif".equals(contentType)) {
                contentType = "image/jpeg"; // 默认
            }
            
            // 准备请求体
            try (DataOutputStream dos = new DataOutputStream(connection.getOutputStream())) {
                // 写入文件参数
                dos.writeBytes("--" + boundary + "\r\n");
                dos.writeBytes("Content-Disposition: form-data; name=\"image\"; filename=\"" + fileName + "\"\r\n");
                dos.writeBytes("Content-Type: " + contentType + "\r\n\r\n");
                
                // 写入文件内容
                byte[] fileBytes = Files.readAllBytes(imageFile.toPath());
                dos.write(fileBytes);
                dos.writeBytes("\r\n");
                
                // 结束边界
                dos.writeBytes("--" + boundary + "--\r\n");
                dos.flush();
            }
            
            // 获取响应
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                StringBuilder response = new StringBuilder();
                try (DataInputStream dis = new DataInputStream(connection.getInputStream())) {
                    String line;
                    while ((line = dis.readLine()) != null) {
                        response.append(line);
                    }
                }
                
                log.info("上传图片请求URL: {}", urlStr);
                log.info("上传图片响应: {}", response.toString());
                
                // 解析响应
                JSONObject jsonResponse = JSON.parseObject(response.toString());
                if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                    JSONObject data = jsonResponse.getJSONObject("data");
                    return data.getString("image");
                } else {
                    log.error("上传图片失败: {}", jsonResponse != null ? jsonResponse.getString("msg") : "响应为空");
                    return null;
                }
            } else {
                log.error("上传图片HTTP错误，响应码: {}", responseCode);
                return null;
            }
        } catch (Exception e) {
            log.error("上传图片异常", e);
            return null;
        }
    }

    /**
     * 创建时尚模型
     *
     * @param imageUrl 图片URL
     * @param name 模型名称
     * @return 时尚模型ID
     */
    public static String createFashionModel(String imageUrl, String name) {
        try {
            String url = BASE_URL + "/agent/myFashionModel/create";
            
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("images", new String[]{imageUrl});
            requestData.put("name", name);
            requestData.put("agentName", "aimodel");
            requestData.put("agentVersion", "v1.0");
            
            Map<String, String> headers = new HashMap<>();
            headers.put("Authorization", getApiKey());
            headers.put("Content-Type", "application/json");
            
            String jsonData = JSON.toJSONString(requestData);
            String response = HttpUtils.sendPost(url, jsonData, headers);
            
            log.info("创建时尚模型请求URL: {}", url);
            log.info("创建时尚模型请求参数: {}", jsonData);
            log.info("创建时尚模型响应: {}", response);
            
            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");
                return data.getString("fashionModelId");
            } else {
                log.error("创建时尚模型失败: {}", jsonResponse != null ? jsonResponse.getString("msg") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("创建时尚模型异常", e);
            return null;
        }
    }

    /**
     * 查询时尚模型
     *
     * @param fashionModelId 时尚模型ID
     * @return 时尚模型信息
     */
    public static JSONObject queryFashionModel(String fashionModelId) {
        try {
            String url = BASE_URL + "/agent/myFashionModel/query?fashionModelId=" + fashionModelId;
            
            Map<String, String> headers = new HashMap<>();
            headers.put("Authorization", getApiKey());
            
            String response = HttpUtils.sendGet(url, headers);
            
            log.info("查询时尚模型请求URL: {}", url);
            log.info("查询时尚模型响应: {}", response);
            
            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                return jsonResponse.getJSONObject("data");
            } else {
                log.error("查询时尚模型失败: {}", jsonResponse != null ? jsonResponse.getString("msg") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("查询时尚模型异常", e);
            return null;
        }
    }

    /**
     * 创建背景位置
     *
     * @param imageUrl 图片URL
     * @param name 背景名称
     * @return 背景位置ID
     */
    public static String createLocation(String imageUrl, String name) {
        try {
            String url = BASE_URL + "/agent/myLocation/create";
            
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("image", imageUrl);
            requestData.put("name", name);
            requestData.put("agentName", "aimodel");
            requestData.put("agentVersion", "v1.0");
            
            Map<String, String> headers = new HashMap<>();
            headers.put("Authorization", getApiKey());
            headers.put("Content-Type", "application/json");
            
            String jsonData = JSON.toJSONString(requestData);
            String response = HttpUtils.sendPost(url, jsonData, headers);
            
            log.info("创建背景位置请求URL: {}", url);
            log.info("创建背景位置请求参数: {}", jsonData);
            log.info("创建背景位置响应: {}", response);
            
            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");
                return data.getString("locationId");
            } else {
                log.error("创建背景位置失败: {}", jsonResponse != null ? jsonResponse.getString("msg") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("创建背景位置异常", e);
            return null;
        }
    }

    /**
     * 查询背景位置
     *
     * @param locationId 背景位置ID
     * @return 背景位置信息
     */
    public static JSONObject queryLocation(String locationId) {
        try {
            String url = BASE_URL + "/agent/myLocation/query?locationId=" + locationId;
            
            Map<String, String> headers = new HashMap<>();
            headers.put("Authorization", getApiKey());
            
            String response = HttpUtils.sendGet(url, headers);
            
            log.info("查询背景位置请求URL: {}", url);
            log.info("查询背景位置响应: {}", response);
            
            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                return jsonResponse.getJSONObject("data");
            } else {
                log.error("查询背景位置失败: {}", jsonResponse != null ? jsonResponse.getString("msg") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("查询背景位置异常", e);
            return null;
        }
    }

    /**
     * 获取Cookie（预留扩展接口，后续应实现动态获取）
     *
     * @return 当前有效的Cookie字符串
     */
    private static String getCookie() {
        // TODO: 实现从配置中心或安全存储中动态获取Cookie
        return API_KEY;
    }

    /**
     * 创建任务
     *
     * @param name 任务名称
     * @param clothUrl 服装图片URL
     * @return 任务ID
     */
    public static String createTask(String name, String clothUrl) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("agentName", "aimodel");
            requestData.put("agentVersion", "v1.0");

            Map<String, Object> initParams = new HashMap<>();
            initParams.put("taskName", name);
            initParams.put("originalImage", clothUrl);
            requestData.put("initParams", initParams);

            // 发送请求
            String url = BASE_URL + "/agent/task/create";
            String response = sendPostRequest(url, requestData);

            log.info("创建任务请求参数: {}", JSON.toJSONString(requestData));
            log.info("创建任务响应: {}", response);

            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");
                return data.getString("taskId");
            } else {
                log.error("创建任务失败: {}", jsonResponse != null ? jsonResponse.getString("message") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("创建任务异常", e);
            return null;
        }
    }

    /**
     * 创建AI图片任务
     *
     * @param name 任务名称
     * @param lookUrl 外观图片URL
     * @return 任务ID
     */
    public static String createAiImageTask(String name, String lookUrl) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("agentName", "aipose");
            requestData.put("agentVersion", "v1.0");

            Map<String, Object> initParams = new HashMap<>();
            initParams.put("taskName", name);
            initParams.put("originalImage", lookUrl);
            requestData.put("initParams", initParams);

            // 发送请求
            String url = BASE_URL + "/agent/task/create";
            String response = sendPostRequest(url, requestData);

            log.info("创建AI图片任务请求参数: {}", JSON.toJSONString(requestData));
            log.info("创建AI图片任务响应: {}", response);

            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");
                return data.getString("taskId");
            } else {
                log.error("创建AI图片任务失败: {}", jsonResponse != null ? jsonResponse.getString("message") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("创建AI图片任务异常", e);
            return null;
        }
    }

    /**
     * 执行任务
     *
     * @param taskId 任务ID
     * @param modelWeId 模特ID
     * @param backWeId 背景ID
     * @return 执行ID
     */
    public static String executeTask(String taskId, String modelWeId, String backWeId) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("taskId", taskId);

            Map<String, Object> params = new HashMap<>();
            params.put("pose", "originalImagePose");
            params.put("generatedContent", "freeCreation");
            params.put("maskType", "autoApparelSegment");
            // 修复：使用Long.valueOf替换Integer.valueOf以支持更大的数值
            params.put("locationId", Long.valueOf(backWeId));
            params.put("fashionModelId", Long.valueOf(modelWeId));
            //params.put("resizeToOriginalImage", true);
            params.put("batchCount", 1);
            requestData.put("params", params);

            // 发送请求
            String url = BASE_URL + "/agent/task/execute";
            String response = sendPostRequest(url, requestData);

            log.info("执行任务请求参数: {}", JSON.toJSONString(requestData));
            log.info("执行任务响应: {}", response);

            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");
                return data.getString("executionId");
            } else {
                log.error("执行任务失败: {}", jsonResponse != null ? jsonResponse.getString("message") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("执行任务异常", e);
            return null;
        }
    }

    /**
     * 执行AI图片任务
     *
     * @param taskId 任务ID
     * @param prompt 提示词
     * @return 执行ID
     */
    public static String executeAiImageTask(String taskId, String prompt) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("taskId", taskId);

            Map<String, Object> params = new HashMap<>();
            params.put("textDescription", prompt);
            requestData.put("params", params);

            // 发送请求
            String url = BASE_URL + "/agent/task/execute";
            String response = sendPostRequest(url, requestData);

            log.info("执行AI图片任务请求参数: {}", JSON.toJSONString(requestData));
            log.info("执行AI图片任务响应: {}", response);

            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");
                return data.getString("executionId");
            } else {
                log.error("执行AI图片任务失败: {}", jsonResponse != null ? jsonResponse.getString("message") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("执行AI图片任务异常", e);
            return null;
        }
    }

    /**
     * 查询任务执行状态
     *
     * @param taskId 任务ID
     * @param executionId 执行ID
     * @return 任务执行结果，包含状态和图片URL
     */
    public static TaskResult queryTask(String taskId, String executionId) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("taskId", taskId);
            requestData.put("executionId", executionId);

            // 发送请求
            String url = BASE_URL + "/agent/task/query";
            String response = sendPostRequest(url, requestData);

            log.info("查询任务请求参数: {}", JSON.toJSONString(requestData));
            log.info("查询任务响应: {}", response);

            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");
                JSONObject executions = data.getJSONArray("executions").getJSONObject(0);
                String status = executions.getString("status");

                TaskResult result = new TaskResult();
                result.setStatus(status);

                // 如果执行成功，获取图片URL
                if ("Success".equals(status)) {
                    JSONObject resultObj = executions.getJSONArray("result").getJSONObject(0);
                    result.setImageUrl(resultObj.getString("image"));
                } else if ("Failed".equals(status)) {
                    result.setImageUrl("失败");
                }

                return result;
            } else {
                log.error("查询任务失败: {}", jsonResponse != null ? jsonResponse.getString("message") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("查询任务异常", e);
            return null;
        }
    }

    /**
     * 查询AI图片任务执行状态
     *
     * @param taskId 任务ID
     * @param executionId 执行ID
     * @return AI图片任务执行结果，包含状态和图片URL列表
     */
    public static AiImageTaskResult queryAiImageTask(String taskId, String executionId) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("taskId", taskId);
            requestData.put("executionId", executionId);

            // 发送请求
            String url = BASE_URL + "/agent/task/query";
            String response = sendPostRequest(url, requestData);

            log.info("查询AI图片任务请求参数: {}", JSON.toJSONString(requestData));
            log.info("查询AI图片任务响应: {}", response);

            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response);
            if (jsonResponse != null && jsonResponse.getBoolean("success")) {
                JSONObject data = jsonResponse.getJSONObject("data");

                //需要选择executionTime距离当前时间最近的executions中的数据
                JSONObject executions = data.getJSONArray("executions").getJSONObject(0);
                String status = executions.getString("status");

                AiImageTaskResult result = new AiImageTaskResult();
                result.setStatus(status);

                // 如果执行成功，获取图片URL列表
                if ("Success".equals(status)) {
                    // 获取结果数组
                    com.alibaba.fastjson2.JSONArray resultArray = executions.getJSONArray("result");
                    if (resultArray != null && !resultArray.isEmpty()) {
                        for (int i = 0; i < resultArray.size(); i++) {
                            JSONObject resultObj = resultArray.getJSONObject(i);
                            String image = resultObj.getString("image");
                            if (image != null && !image.isEmpty()) {
                                result.addImageUrl(image);
                            }
                        }
                    }
                } else if ("Failed".equals(status)) {
                    // 获取错误信息
                    com.alibaba.fastjson2.JSONArray resultArray = executions.getJSONArray("result");
                    if (resultArray != null && !resultArray.isEmpty()) {
                        JSONObject resultObj = resultArray.getJSONObject(0);
                        String error = resultObj.getString("error");
                        result.setError(error);
                    }
                }

                return result;
            } else {
                log.error("查询AI图片任务失败: {}", jsonResponse != null ? jsonResponse.getString("message") : "响应为空");
                return null;
            }
        } catch (Exception e) {
            log.error("查询AI图片任务异常", e);
            return null;
        }
    }

    /**
     * 根据look类型生成对应的prompt
     *
     * @param type look类型
     * @param basePrompt 基础prompt
     * @return 完整的prompt
     */
    public static String generatePromptByType(String type, String basePrompt) {
        String prompt1 = "使用上面这张图片，根据文字描述，生成1张高分辨率图片，不要改变背景，如果背景中有不明线条需要去掉，不要袜套,不要包,不要帽子,如果有手套需要和衣服颜色匹配，搭配个浅色小裙子，针织紧身裤，材质看起来厚实且有纹理，紧密贴合腿部，既保暖又能勾勒出腿部线条，搭配的是一双'UGG'品牌冬季靴，靴口处有大面积的白色毛绒装饰，既增加了温暖感，又提升了整体造型的可爱与时尚度。厚底设计还能在雪地行走时提供一定的防滑和增高效果。白色针织紧身裤恰好被塞进雪地靴的毛绒靴口内，这种搭配方式不仅让整体造型显得利落整洁，还能更好地发挥裤子和鞋子的保暖功能，同时在视觉上形成和谐的衔接，凸显出穿搭的层次感与时尚感，非常适合雪地的寒冷环境。人物面带笑容，人物的手更像欧洲人的手，人物姿势更有型。将图片中人物的体型缩小，使其在画面中的占比更小，视觉上符合身高不超过180cm 的比例，同时保持人物与背景的相对位置和整体画面的协调性，就像把人物按比例缩小，让其看起来更小巧精致，与周围环境更适配。人体、衣服、环境更加和谐，尤其是人体、衣服、环境中的光线和阴影要契合。专业摄影，整体拍摄风格呈现高清细节质感，类似时尚杂志封面设计。";

        String prompt2 = "使用上面这张图片，根据文字描述，生成1张高分辨率图片，不要改变背景，不要帽子，鞋子为高级感轻薄凉鞋，鞋子正常踩在地上,不要悬空，鞋子要完整，衣服有领儿的，不要改变领儿，不要改变衣服尺寸,不要改变衣服长短宽窄，因衣服无口袋，人物手部不要做插兜动作，人物姿势更灵动，人物的手更像亚洲人的手，人物面带笑容，人物为长发，人物腿为180模特的腿长。将图片中人物的体型缩小，使其在画面中的占比更小，视觉上符合身高不超过180cm 的比例，同时保持人物与背景的相对位置和整体画面的协调性，就像把人物按比例缩小，让其看起来更小巧精致，与周围环境更适配。人体、衣服、环境更加和谐，尤其是人体、衣服、环境中的光线和阴影要契合。专业摄影，整体拍摄风格呈现高清细节质感，类似时尚杂志封面设计。";

        if (type == null) {
            return basePrompt != null ? basePrompt : "";
        }

        switch (type) {
            case "1":
                return (basePrompt != null ? basePrompt : "") + prompt1;
            case "2":
                return (basePrompt != null ? basePrompt : "") + prompt2;
            default:
                return basePrompt != null ? basePrompt : "";
        }
    }

    /**
     * 发送POST请求
     *
     * @param url 请求URL
     * @param data 请求数据
     * @return 响应结果
     */
    private static String sendPostRequest(String url, Map<String, Object> data) {
        String jsonData = JSON.toJSONString(data);
        Map<String, String> headers = new HashMap<>();
        headers.put("Content-Type", "application/json");
        headers.put("Authorization", getCookie());

        return HttpUtils.sendPost(url, jsonData, headers);
    }

    /**
     * 任务执行结果类
     */
    public static class TaskResult {
        private String status;
        private String imageUrl;

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getImageUrl() {
            return imageUrl;
        }

        public void setImageUrl(String imageUrl) {
            this.imageUrl = imageUrl;
        }
    }

    /**
     * AI图片任务执行结果类
     */
    public static class AiImageTaskResult {
        private String status;
        private java.util.List<String> imageUrls = new java.util.ArrayList<>();
        private String error;

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public java.util.List<String> getImageUrls() {
            return imageUrls;
        }

        public void addImageUrl(String imageUrl) {
            this.imageUrls.add(imageUrl);
        }

        public String getError() {
            return error;
        }

        public void setError(String error) {
            this.error = error;
        }
    }
}