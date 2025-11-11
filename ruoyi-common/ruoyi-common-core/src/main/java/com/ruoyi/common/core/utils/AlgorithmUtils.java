package com.ruoyi.common.core.utils;

import com.alibaba.fastjson2.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * 算法工具类
 * 提供各种算法相关的工具方法
 *
 * @author ruoyi
 */
public class AlgorithmUtils {
    private static final Logger log = LoggerFactory.getLogger(AlgorithmUtils.class);

    // 服务基础URL
    private static final String BASE_URL = "http://192.168.0.152:8000";
    // 服装信息接口路径
    private static final String CLOTH_INFO_URL = BASE_URL + "/api/clothJson";
    // 图片放大接口路径
    private static final String UPSCALE_URL = BASE_URL + "/api/upscale";
    // 图片修复接口路径
    private static final String REPAIR_URL = BASE_URL + "/api/repair";

    private static final String CLOTH_INFO_ADD = "以下是服装描述的json结构，不要改变衣服细节/r/n";
    // nano图片接口
    private static final String NANO_URL = BASE_URL + "/api/get-nano-pic";
    /**
     * 获取服装信息
     * 通过服装图片URL获取详细的服装描述信息
     *
     * @param clothUrl 服装图片的完整URL地址
     * @return 包含服装详细信息的JSON对象
     */
    public static String getClothInfo(String clothUrl) {
        try {
            // 构造请求参数
            String param = "clothUrl=" + clothUrl;

            // 发送GET请求获取服装信息
            String response = HttpUtils.sendGet(CLOTH_INFO_URL, param, new HashMap<>());

            // 将响应转换为JSONObject并返回
            return CLOTH_INFO_ADD + response;
        } catch (Exception e) {
            log.error("获取服装信息失败，clothUrl: {}", clothUrl, e);
            return null;
        }
    }

    /**
     * 图片放大处理
     * 通过图片URL对图片进行放大处理
     *
     * @param imageUrl 需要放大的图片URL地址
     * @return 包含任务ID和结果图片URL的JSON对象
     */
    public static JSONObject upscaleImage(String imageUrl) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("image", imageUrl);
            String jsonData = com.alibaba.fastjson2.JSON.toJSONString(requestData);

            // 设置请求头
            Map<String, String> headers = new HashMap<>();
            headers.put("Content-Type", "application/json");

            // 发送POST请求进行图片放大处理
            String response = HttpUtils.sendPost(UPSCALE_URL, jsonData, headers);

            // 将响应转换为JSONObject并返回
            return com.alibaba.fastjson2.JSON.parseObject(response);
        } catch (Exception e) {
            log.error("图片放大处理失败，imageUrl: {}", imageUrl, e);
            return null;
        }
    }

    /**
     * 图片修复处理
     * 通过待修复图片和清晰图片进行修复处理
     *
     * @param image 待修复服装URL
     * @param detailedImage 清晰服装URL（包含image中待修复的所有标）
     * @param taskName 任务名
     * @param maskMode 模式（manual->手动模式，auto->自动模式）
     * @param imageMaskBase64 待修复服装logo的mask的base64（仅支持一个logo，manual模式时必填）
     * @param detailedMaskBase64 清晰服装logo的mask的base64（仅支持一个logo，manual模式时必填）
     * @return 包含处理结果和消息的JSON对象
     */
    public static JSONObject repairImage(String image, String detailedImage, String taskName,
                                       String maskMode, String imageMaskBase64, String detailedMaskBase64) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("image", image);
            requestData.put("detailed_image", detailedImage);
            requestData.put("task_name", taskName);

            // 根据模式设置参数
            if (maskMode != null) {
                requestData.put("mask_mode", maskMode);
                // manual模式下需要提供mask_base64参数
                if ("manual".equals(maskMode)) {
                    requestData.put("image_mask_base64", imageMaskBase64);
                    requestData.put("detailed_mask_base64", detailedMaskBase64);
                }
            } else {
                // 默认使用auto模式
                requestData.put("mask_mode", "auto");
            }

            String jsonData = com.alibaba.fastjson2.JSON.toJSONString(requestData);

            // 设置请求头
            Map<String, String> headers = new HashMap<>();
            headers.put("Content-Type", "application/json");

            // 发送POST请求进行图片修复处理
            String response = HttpUtils.sendPost(REPAIR_URL, jsonData, headers);

            // 将响应转换为JSONObject并返回
            return com.alibaba.fastjson2.JSON.parseObject(response);
        } catch (Exception e) {
            log.error("图片修复处理失败，image: {}, detailedImage: {}", image, detailedImage, e);
            return null;
        }
    }

    /**
     * 图片修复处理（简化版，使用默认auto模式）
     *
     * @param image 待修复服装URL
     * @param detailedImage 清晰服装URL（包含image中待修复的所有标）
     * @param taskName 任务名
     * @return 包含处理结果和消息的JSON对象
     */
    public static JSONObject repairImage(String image, String detailedImage, String taskName) {
        return repairImage(image, detailedImage, taskName, null, null, null);
    }

    public static JSONObject getNanoImage(String faceImageUrl,String lookImageUrl,String sceneImageUrl,String stylePrompt) {
        try {
            // 构造请求参数
            Map<String, Object> requestData = new HashMap<>();
            requestData.put("face_image_url", faceImageUrl);
            requestData.put("look_image_url", lookImageUrl);
            requestData.put("scene_image_url", sceneImageUrl);
            requestData.put("style_prompt", stylePrompt);
            String jsonData = com.alibaba.fastjson2.JSON.toJSONString(requestData);

            // 设置请求头
            Map<String, String> headers = new HashMap<>();
            headers.put("Content-Type", "application/json");

            // 发送POST请求进行图片放大处理
            String response = HttpUtils.sendPost(NANO_URL, jsonData, headers);

            // 将响应转换为JSONObject并返回
            return com.alibaba.fastjson2.JSON.parseObject(response);
        } catch (Exception e) {
            log.error("getNanoImage处理失败 ", e);
            return null;
        }
    }
}
