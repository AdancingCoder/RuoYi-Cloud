package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.WeAiPicture;
import com.ruoyi.system.service.IWeAiPictureService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.util.Map;
import java.util.HashMap;
import java.io.InputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * AI图片Controller
 *
 * @author ruoyi
 * @date 2025-09-14
 */
@RestController
@RequestMapping("/picture")
public class WeAiPictureController extends BaseController
{
    private static final Logger log = LoggerFactory.getLogger(WeAiPictureController.class);

    @Autowired
    private IWeAiPictureService weAiPictureService;

    /**
     * 查询AI图片列表
     */
    @RequiresPermissions("system:picture:list")
    @GetMapping("/list")
    public TableDataInfo list(WeAiPicture weAiPicture)
    {
        startPage();
        List<WeAiPicture> list = weAiPictureService.selectWeAiPictureList(weAiPicture);
        return getDataTable(list);
    }

    /**
     * 导出AI图片列表
     *
     * @param response HTTP响应对象
     * @param weAiPicture 查询条件
     */
    @RequiresPermissions("system:picture:export")
    @Log(title = "AI图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WeAiPicture weAiPicture)
    {
        List<WeAiPicture> list = weAiPictureService.selectWeAiPictureList(weAiPicture);
        ExcelUtil<WeAiPicture> util = new ExcelUtil<WeAiPicture>(WeAiPicture.class);
        util.exportExcel(response, list, "AI图片数据");
    }

    /**
     * 获取AI图片详细信息
     */
    @RequiresPermissions("system:picture:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(weAiPictureService.selectWeAiPictureById(id));
    }

    /**
     * 新增AI图片
     */
    @RequiresPermissions("system:picture:add")
    @Log(title = "AI图片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeAiPicture weAiPicture)
    {
        return toAjax(weAiPictureService.insertWeAiPicture(weAiPicture));
    }

    /**
     * 修改AI图片
     */
    @RequiresPermissions("system:picture:edit")
    @Log(title = "AI图片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WeAiPicture weAiPicture)
    {
        return toAjax(weAiPictureService.updateWeAiPicture(weAiPicture));
    }

    /**
     * 删除AI图片
     */
    @RequiresPermissions("system:picture:remove")
    @Log(title = "AI图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(weAiPictureService.deleteWeAiPictureByIds(ids));
    }

    /**
     * 批量更新审核状态
     * 通过上传Excel文件，解析其中的状态信息并更新对应的AI图片记录
     *
     * @param file 包含状态信息的Excel文件
     * @return 操作结果
     */
    @RequiresPermissions("system:picture:edit")
    @Log(title = "AI图片", businessType = BusinessType.UPDATE)
    @PostMapping("/updateAuditStatus")
    public AjaxResult updateAuditStatus(@RequestParam("file") MultipartFile file) {
        try {
            // 检查文件是否为空
            if (file == null || file.isEmpty()) {
                log.warn("收到空文件上传请求");
                return AjaxResult.error("上传的文件不能为空");
            }

            // 检查文件类型
            String originalFilename = file.getOriginalFilename();
            if (originalFilename == null ||
                (!originalFilename.toLowerCase().endsWith(".xlsx") &&
                 !originalFilename.toLowerCase().endsWith(".xls"))) {
                log.warn("收到非Excel文件上传: {}", originalFilename);
                return AjaxResult.error("请上传Excel文件（.xlsx或.xls格式）");
            }

            // 打印文件基本信息
            log.info("收到Excel文件上传: {}", originalFilename);
            log.info("文件大小: {} 字节", file.getSize());

            // 解析Excel文件并更新状态
            ExcelUtil<WeAiPicture> util = new ExcelUtil<>(WeAiPicture.class);
            List<WeAiPicture> pictureList = util.importExcel(file.getInputStream());

            // 检查解析结果
            if (pictureList == null || pictureList.isEmpty()) {
                log.warn("Excel文件中没有找到有效的数据");
                return AjaxResult.error("Excel文件中没有找到有效的数据");
            }

            log.info("开始处理{}条记录", pictureList.size());

            // 调试信息：打印导入的数据
            log.info("导入的Excel数据条数: {}", pictureList.size());
            for (int i = 0; i < pictureList.size(); i++) {
                WeAiPicture picture = pictureList.get(i);
                log.info("第{}条数据 - ID: {}, 名称: {}, 状态: {}", i+1, picture.getId(), picture.getName(), picture.getDataStatus());
            }

            // 批量更新审核状态
            int successCount = 0;
            int failCount = 0;

            for (WeAiPicture picture : pictureList) {
                try {
                    // 检查ID是否存在
                    if (picture.getId() != null) {
                        // 打印正在更新的记录详细信息
                        log.info("正在更新 - ID: {}, 名称: {}, 新状态: {}", picture.getId(), picture.getName(), picture.getDataStatus());

                        // 更新状态
                        weAiPictureService.updateWeAiPicture(picture);
                        successCount++;
                        // 打印单条记录更新完成信息
                        log.debug("成功更新记录 - ID: {}", picture.getId());
                    } else {
                        failCount++;
                    }
                } catch (Exception e) {
                    log.error("更新图片失败 - ID: {}, 名称: {}, 新状态: {}", picture.getId(), picture.getName(), picture.getDataStatus(), e);
                    failCount++;
                }
            }

            return AjaxResult.success("操作完成，成功更新 " + successCount + " 条记录，失败 " + failCount + " 条记录");
        } catch (Exception e) {
            log.error("批量更新审核状态时发生错误: ", e);
            return AjaxResult.error("操作失败: " + e.getMessage());
        }
    }

}
