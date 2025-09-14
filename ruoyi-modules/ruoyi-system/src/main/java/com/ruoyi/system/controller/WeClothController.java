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
import com.ruoyi.system.domain.WeCloth;
import com.ruoyi.system.service.IWeClothService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 服装Controller
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
@RestController
@RequestMapping("/cloth")
public class WeClothController extends BaseController
{
    @Autowired
    private IWeClothService weClothService;

    /**
     * 查询服装列表
     */
    @RequiresPermissions("system:cloth:list")
    @GetMapping("/list")
    public TableDataInfo list(WeCloth weCloth)
    {
        startPage();
        List<WeCloth> list = weClothService.selectWeClothList(weCloth);
        return getDataTable(list);
    }

    /**
     * 导出服装列表
     */
    @RequiresPermissions("system:cloth:export")
    @Log(title = "服装", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WeCloth weCloth)
    {
        List<WeCloth> list = weClothService.selectWeClothList(weCloth);
        ExcelUtil<WeCloth> util = new ExcelUtil<WeCloth>(WeCloth.class);
        util.exportExcel(response, list, "服装数据");
    }

    /**
     * 获取服装详细信息
     */
    @RequiresPermissions("system:cloth:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(weClothService.selectWeClothById(id));
    }

    /**
     * 新增服装
     */
    @RequiresPermissions("system:cloth:add")
    @Log(title = "服装", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeCloth weCloth)
    {
        return toAjax(weClothService.insertWeCloth(weCloth));
    }

    /**
     * 修改服装
     */
    @RequiresPermissions("system:cloth:edit")
    @Log(title = "服装", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WeCloth weCloth)
    {
        return toAjax(weClothService.updateWeCloth(weCloth));
    }

    /**
     * 删除服装
     */
    @RequiresPermissions("system:cloth:remove")
    @Log(title = "服装", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(weClothService.deleteWeClothByIds(ids));
    }
}
