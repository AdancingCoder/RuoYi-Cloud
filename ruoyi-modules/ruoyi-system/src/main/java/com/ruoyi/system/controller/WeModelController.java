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
import com.ruoyi.system.domain.WeModel;
import com.ruoyi.system.service.IWeModelService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 模特Controller
 * 
 * @author ruoyi
 * @date 2025-09-13
 */
@RestController
@RequestMapping("/model")
public class WeModelController extends BaseController
{
    @Autowired
    private IWeModelService weModelService;

    /**
     * 查询模特列表
     */
    @RequiresPermissions("system:model:list")
    @GetMapping("/list")
    public TableDataInfo list(WeModel weModel)
    {
        startPage();
        List<WeModel> list = weModelService.selectWeModelList(weModel);
        return getDataTable(list);
    }

    /**
     * 导出模特列表
     */
    @RequiresPermissions("system:model:export")
    @Log(title = "模特", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WeModel weModel)
    {
        List<WeModel> list = weModelService.selectWeModelList(weModel);
        ExcelUtil<WeModel> util = new ExcelUtil<WeModel>(WeModel.class);
        util.exportExcel(response, list, "模特数据");
    }

    /**
     * 获取模特详细信息
     */
    @RequiresPermissions("system:model:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(weModelService.selectWeModelById(id));
    }

    /**
     * 新增模特
     */
    @RequiresPermissions("system:model:add")
    @Log(title = "模特", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeModel weModel)
    {
        return toAjax(weModelService.insertWeModel(weModel));
    }

    /**
     * 修改模特
     */
    @RequiresPermissions("system:model:edit")
    @Log(title = "模特", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WeModel weModel)
    {
        return toAjax(weModelService.updateWeModel(weModel));
    }

    /**
     * 删除模特
     */
    @RequiresPermissions("system:model:remove")
    @Log(title = "模特", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(weModelService.deleteWeModelByIds(ids));
    }
}
