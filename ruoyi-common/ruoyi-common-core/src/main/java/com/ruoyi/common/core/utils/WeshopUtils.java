package com.ruoyi.common.core.utils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
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
    private static final String BASE_URL = "https://openapi.weshop.com/openapi/v1/agent";
    private static final String UPLOAD_MODEL_URL = "https://openapi.weshop.com/openapi/v1/agent/myFashionModel/create";
    private static final String QUERY_MODEL_URL = "https://openapi.weshop.com/openapi/v1/agent/myFashionModel/query";
    private static final String UPLOAD_LOCATION_URL = "https://openapi.weshop.com/openapi/v1/agent/myLocation/create";

    // 模拟Cookie，实际使用中应该从配置文件或安全存储中获取
    private static String COOKIE = "Bvrrnc4lOI6MgUiGQyxwuUCKc3uQCZT9";

    /**
     * 获取Cookie（预留扩展接口，后续应实现动态获取）
     *
     * @return 当前有效的Cookie字符串
     */
    private static String getCookie() {
        // TODO: 实现从配置中心或安全存储中动态获取Cookie
        return COOKIE;
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
            String url = BASE_URL + "/task/create";
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
            String url = BASE_URL + "/task/create";
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
            String url = BASE_URL + "/task/execute";
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
            String url = BASE_URL + "/task/execute";
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
            String url = BASE_URL + "/task/query";
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
            String url = BASE_URL + "/task/query";
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
        String prompt1 = "使用上面这张图片，根据文字描述，生成1张高分辨率图片，不要改变背景，如果背景中有不明线条需要去掉，不要袜套,不要包,不要帽子,如果有手套需要和衣服颜色匹配，鞋子为纯色高帮户外鞋，鞋子正常踩在地上,不要悬空，鞋子要完整，不要脚印，衣服有领儿的，不要改变领儿，衣服袖口不要改变，不要改变上衣尺寸，搭配个浅色小裙子，针织紧身裤，材质看起来厚实且有纹理，紧密贴合腿部，既保暖又能勾勒出腿部线条，搭配的是一双'UGG'品牌冬季靴，靴口处有大面积的白色毛绒装饰，既增加了温暖感，又提升了整体造型的可爱与时尚度。厚底设计还能在雪地行走时提供一定的防滑和增高效果。白色针织紧身裤恰好被塞进雪地靴的毛绒靴口内，这种搭配方式不仅让整体造型显得利落整洁，还能更好地发挥裤子和鞋子的保暖功能，同时在视觉上形成和谐的衔接，凸显出穿搭的层次感与时尚感，非常适合雪地的寒冷环境。人物面带笑容，人物的手更像欧洲人的手，人物姿势更有型。将图片中人物的体型缩小，使其在画面中的占比更小，视觉上符合身高不超过180cm 的比例，同时保持人物与背景的相对位置和整体画面的协调性，就像把人物按比例缩小，让其看起来更小巧精致，与周围环境更适配。人体、衣服、环境更加和谐，尤其是人体、衣服、环境中的光线和阴影要契合。专业摄影，整体拍摄风格呈现高清细节质感，类似时尚杂志封面设计。";

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

    public static String uploadPic(String upLoadType,String picUrl){
        String url="model".equals(upLoadType)?UPLOAD_MODEL_URL:UPLOAD_LOCATION_URL;
        HashMap<String, Object> data = new HashMap<>();
        data.put("image", Arrays.asList(picUrl));
        data.put("name",picUrl.substring(picUrl.lastIndexOf("/")+1,picUrl.lastIndexOf(".")));
        data.put("agentName","aimodel");
        data.put("agentVersion","v1.0");
        String response = sendPostRequest(url,data);
        log.info("上传图片任务请求参数: {}", JSON.toJSONString(data));
        log.info("上传图片任务响应: {}", response);
        JSONObject jsonObject = JSON.parseObject(response);
        String fashionModelId = jsonObject.getJSONObject("data").get("fashionModelId").toString();

        String getResponse = sendGetRequest(QUERY_MODEL_URL, "fashionModelId=" + fashionModelId);
        JSONObject jsonObject1 = JSON.parseObject(getResponse);
        return null;
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
     * send get request
     *
     * @param url   url
     * @param param param
     * @return {@link String }
     */
    private static String sendGetRequest(String url, String param) {
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", getCookie());

        return HttpUtils.sendGet(url, param, headers);
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
