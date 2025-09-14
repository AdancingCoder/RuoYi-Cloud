package com.ruoyi.system.controller;

import java.util.List;
import java.io.IOException;
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
}
