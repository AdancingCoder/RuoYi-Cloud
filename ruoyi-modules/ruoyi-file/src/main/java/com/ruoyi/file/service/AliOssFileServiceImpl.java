package com.ruoyi.file.service;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.ObjectMetadata;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.core.utils.file.FileUtils;
import com.ruoyi.file.utils.FileUploadUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Objects;
import java.util.UUID;


/**
 * ali oss file service impl
 *
 * @author Deshen Zhang
 * @date 2025/09/22
 */
@Service
@Primary
@Slf4j
public class AliOssFileServiceImpl implements ISysFileService {
    @Value("${aliyun.oss.endpoint}")
    private String endpoint;

    @Value("${aliyun.oss.accessKeyId}")
    private String accessKeyId;

    @Value("${aliyun.oss.accessKeySecret}")
    private String accessKeySecret;

    @Value("${aliyun.oss.bucketName}")
    private String bucketName;


    /**
     * 上传文件到阿里云 OSS
     * @param file 本地文件
     * @return 文件的访问 URL
     */
    @Override
    public String uploadFile(MultipartFile file) {
        String fileKey = FileUploadUtils.rename(Objects.requireNonNull(file.getOriginalFilename()));
        String directoryPath = "default";
        try {
            InputStream inputStream = file.getInputStream();
            //上传至第三方云服务或服务器
            fileKey =  directoryPath + "/" + fileKey;
            OSS ossClient = new OSSClientBuilder().build(
                    endpoint,
                    accessKeyId,
                    accessKeySecret);
            try {
                ObjectMetadata meta = new ObjectMetadata();
                meta.setContentType("image/jpg");
                ossClient.putObject(bucketName, fileKey, inputStream, meta);
            } catch (OSSException oe) {
                log.error("Caught an OSSException, which means your request made it to OSS, "
                        + "but was rejected with an error response for some reason.");
                log.error("Error Message: " + oe.getErrorMessage());
                log.error("Error Code:       " + oe.getErrorCode());
                log.error("Request ID:      " + oe.getRequestId());
                log.error("Host ID:           " + oe.getHostId());
                throw new RuntimeException("AliOSS Failed to upload file",oe);
            } catch (ClientException ce) {
                log.error("Caught an ClientException, which means the client encountered "
                        + "a serious internal problem while trying to communicate with OSS, "
                        + "such as not being able to access the network.");
                log.error("Error Message: " + ce.getMessage());
                throw new RuntimeException("AliOSS Failed to upload file",ce);
            } finally {
                ossClient.shutdown();
            }
            ossClient.shutdown();
            return getUrlPrefix() + fileKey;
        } catch (Exception e) {
            log.error("文件上传失败", e);
            throw new RuntimeException("AliOSS Failed to upload file",e);
        }

    }
    private String getUrlPrefix() {
        return "https://" + bucketName + "." + endpoint + "/";
    }
    @Override
    public void deleteFile(String fileUrl) {
        if (StringUtils.isEmpty(fileUrl)) {
            throw new ServiceException("文件URL不能为空");
        }
        String urlPrefix = getUrlPrefix();
        if (!fileUrl.startsWith(urlPrefix)) {
            throw new ServiceException("非法的文件URL: " + fileUrl);
        }
        String objectKey = fileUrl.substring(urlPrefix.length());

        OSS ossClient = null;
        try {
            ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
            ossClient.deleteObject(bucketName, objectKey);
            log.info("删除 OSS 文件成功，objectKey={}", objectKey);
        } catch (OSSException oe) {
            log.error("OSS 删除失败: {}", oe.getErrorMessage(), oe);
            throw new RuntimeException("AliOSS Failed to delete file", oe);
        } catch (ClientException ce) {
            log.error("OSS 客户端异常: {}", ce.getMessage(), ce);
            throw new RuntimeException("AliOSS Failed to delete file", ce);
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
    }
}
