package com.ruoyi.common.core.utils;

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
    
    // 模拟Cookie，实际使用中应该从配置文件或安全存储中获取
    private static String COOKIE = "_ga=GA1.1.1220826162.1757506666; weshopaitoken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NjI2OTA2ODgsInBob25lTnVtYmVyIjoiMTg0MDE1Mzg4NzYiLCJwbGF0Zm9ybSI6IndlYiIsInN1YiI6IjY4YWQ2ZjRhN2M5YWZiMGFhMGI4MDkwNyJ9.bnNW2-ycKq5ey3MP8T0l5OrqIwXiTEkV5k79IgqfbcA; _ga_VV0L43VV4W=GS2.1.s1757844501$o7$g1$t1757844505$j56$l0$h0";

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
            params.put("locationId", backWeId);
            params.put("fashionModelId", modelWeId);
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
        headers.put("Cookie", getCookie());
        
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
}