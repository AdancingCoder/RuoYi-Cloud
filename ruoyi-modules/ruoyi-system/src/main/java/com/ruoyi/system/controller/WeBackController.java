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
import com.ruoyi.system.domain.WeBack;
import com.ruoyi.system.service.IWeBackService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 背景Controller
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
@RestController
@RequestMapping("/back")
public class WeBackController extends BaseController
{
    @Autowired
    private IWeBackService weBackService;

    /**
     * 查询背景列表
     */
    @RequiresPermissions("system:back:list")
    @GetMapping("/list")
    public TableDataInfo list(WeBack weBack)
    {
        startPage();
        List<WeBack> list = weBackService.selectWeBackList(weBack);
        return getDataTable(list);
    }

    /**
     * 导出背景列表
     */
    @RequiresPermissions("system:back:export")
    @Log(title = "背景", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WeBack weBack)
    {
        List<WeBack> list = weBackService.selectWeBackList(weBack);
        ExcelUtil<WeBack> util = new ExcelUtil<WeBack>(WeBack.class);
        util.exportExcel(response, list, "背景数据");
    }

    /**
     * 获取背景详细信息
     */
    @RequiresPermissions("system:back:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(weBackService.selectWeBackById(id));
    }

    /**
     * 新增背景
     */
    @RequiresPermissions("system:back:add")
    @Log(title = "背景", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeBack weBack)
    {
        return toAjax(weBackService.insertWeBack(weBack));
    }

    /**
     * 修改背景
     */
    @RequiresPermissions("system:back:edit")
    @Log(title = "背景", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WeBack weBack)
    {
        return toAjax(weBackService.updateWeBack(weBack));
    }

    /**
     * 删除背景
     */
    @RequiresPermissions("system:back:remove")
    @Log(title = "背景", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(weBackService.deleteWeBackByIds(ids));
    }
}
