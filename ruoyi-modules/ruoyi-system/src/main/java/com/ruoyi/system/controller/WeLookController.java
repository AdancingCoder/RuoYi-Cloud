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
import com.ruoyi.system.domain.WeLook;
import com.ruoyi.system.domain.WeCloth;
import com.ruoyi.system.domain.WeModel;
import com.ruoyi.system.domain.WeBack;
import com.ruoyi.system.service.IWeLookService;
import com.ruoyi.system.service.IWeClothService;
import com.ruoyi.system.service.IWeModelService;
import com.ruoyi.system.service.IWeBackService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 外观Controller
 *
 * @author ruoyi
 * @date 2025-09-14
 */
@RestController
@RequestMapping("/look")
public class WeLookController extends BaseController
{
    @Autowired
    private IWeLookService weLookService;

    @Autowired
    private IWeClothService weClothService;

    @Autowired
    private IWeModelService weModelService;

    @Autowired
    private IWeBackService weBackService;

    /**
     * 查询外观列表
     */
    @RequiresPermissions("system:look:list")
    @GetMapping("/list")
    public TableDataInfo list(WeLook weLook)
    {
        startPage();
        List<WeLook> list = weLookService.selectWeLookList(weLook);
        return getDataTable(list);
    }

    /**
     * 导出外观列表
     */
    @RequiresPermissions("system:look:export")
    @Log(title = "外观", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WeLook weLook)
    {
        List<WeLook> list = weLookService.selectWeLookList(weLook);
        ExcelUtil<WeLook> util = new ExcelUtil<WeLook>(WeLook.class);
        util.exportExcel(response, list, "外观数据");
    }

    /**
     * 获取外观详细信息
     */
    @RequiresPermissions("system:look:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(weLookService.selectWeLookById(id));
    }

    /**
     * 新增外观
     */
    @RequiresPermissions("system:look:add")
    @Log(title = "外观", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeLook weLook)
    {
        return toAjax(weLookService.insertWeLook(weLook));
    }

    /**
     * 修改外观
     */
    @RequiresPermissions("system:look:edit")
    @Log(title = "外观", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WeLook weLook)
    {
        return toAjax(weLookService.updateWeLook(weLook));
    }

    /**
     * 删除外观
     */
    @RequiresPermissions("system:look:remove")
    @Log(title = "外观", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(weLookService.deleteWeLookByIds(ids));
    }

    /**
     * 生成外观数据
     */
    @RequiresPermissions("system:look:add")
    @Log(title = "外观", businessType = BusinessType.INSERT)
    @PostMapping("/generateData")
    public AjaxResult generateData()
    {
        // 查询所有服装数据
        List<WeCloth> clothList = weClothService.selectWeClothList(new WeCloth());
        // 查询所有模特数据
        List<WeModel> modelList = weModelService.selectWeModelList(new WeModel());
        // 查询所有背景数据
        List<WeBack> backList = weBackService.selectWeBackList(new WeBack());

        // 组合生成外观数据
        int count = 0;
        for (WeCloth cloth : clothList) {
            for (WeModel model : modelList) {
                for (WeBack back : backList) {
                    // 检查是否已存在相同组合的外观数据
                    WeLook checkLook = new WeLook();
                    checkLook.setClothId(cloth.getId());
                    checkLook.setModelId(model.getId());
                    checkLook.setBackId(back.getId());

                    // 如果不存在相同组合，则创建新的外观数据
                    if (weLookService.selectWeLookList(checkLook).isEmpty()) {
                        WeLook look = new WeLook();
                        look.setClothId(cloth.getId());
                        look.setClothUrl(cloth.getClothUrl());
                        look.setModelId(model.getId());
                        look.setModelWeId(model.getModelWeId());
                        look.setModelUrl(model.getModelUrl());
                        look.setBackId(back.getId());
                        look.setBackWeId(back.getBackWeId());
                        look.setBackUrl(back.getBackUrl());
                        // 设置默认名称为"服装+模特+背景"组合
                        look.setName(cloth.getName() + "+" + model.getName() + "+" + back.getName());
                        // 设置外观类型与服装类型一致
                        look.setType(cloth.getType());
                        weLookService.insertWeLook(look);
                        count++;
                    }
                }
            }
        }
        return AjaxResult.success("生成成功，共新增" + count + "条数据");
    }
}
