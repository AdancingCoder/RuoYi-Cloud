package com.ruoyi.system.controller;

import java.util.List;
import java.io.IOException;
import java.util.Map;
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
import com.ruoyi.system.domain.WeModel;
import com.ruoyi.system.service.IWeBackService;
import com.ruoyi.system.service.IWeModelService;
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
    
    @Autowired
    private IWeModelService weModelService;

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
    
    /**
     * 生成模特及背景数据。
     * 从请求数据中提取locations和fashionModels信息，
     * 根据名称包含"bsd"或"tan"的条件筛选数据，
     * 分别生成背景和模特数据并保存到数据库。
     */
    @RequiresPermissions("system:back:generate")
    @Log(title = "背景", businessType = BusinessType.INSERT)
    @PostMapping("/generate")
    public AjaxResult generateModelAndBack(@RequestBody Map<String, Object> jsonData)
    {
        try {
            // 获取data数据，添加空值检查
            Map<String, Object> data = (Map<String, Object>) jsonData.get("data");
            if (data == null) {
                return error("生成失败：缺少'data'数据");
            }
            
            // 获取locations和fashionModels数据
            List<Map<String, Object>> locations = (List<Map<String, Object>>) data.get("locations");
            List<Map<String, Object>> fashionModels = (List<Map<String, Object>>) data.get("fashionModels");
            
            int backCount = processLocations(locations);
            int modelCount = processFashionModels(fashionModels);
            
            return success("生成成功，新增背景" + backCount + "条，新增模特" + modelCount + "条");
        } catch (Exception e) {
            return error("生成失败：" + e.getMessage());
        }
    }
    
    /**
     * 处理locations数据，生成背景信息
     */
    private int processLocations(List<Map<String, Object>> locations) {
        int backCount = 0;
        
        if (locations != null) {
            for (Map<String, Object> location : locations) {
                String name = (String) location.get("name");
                // 筛选name模糊匹配"bsd"和"tan"的数据
                if (name != null && (name.contains("bsd") || name.contains("tan"))) {
                    String type = name.contains("bsd") ? "1" : "2";
                    String id = String.valueOf(location.get("id"));
                    String image = (String) location.get("image");
                    
                    // 检查背景数据是否已存在
                    WeBack existBack = weBackService.selectWeBackByWeId(id);
                    if (existBack == null) {
                        // 新增背景数据
                        WeBack back = new WeBack();
                        back.setName(name);
                        back.setBackUrl(image);
                        back.setBackWeId(id);
                        back.setType(type);
                        weBackService.insertWeBack(back);
                        backCount++;
                    }
                }
            }
        }
        
        return backCount;
    }
    
    /**
     * 处理fashionModels数据，生成模特信息
     */
    private int processFashionModels(List<Map<String, Object>> fashionModels) {
        int modelCount = 0;
        
        if (fashionModels != null) {
            for (Map<String, Object> model : fashionModels) {
                String name = (String) model.get("name");
                // 筛选name模糊匹配"bsd"和"tan"的数据
                if (name != null && (name.contains("bsd") || name.contains("tan"))) {
                    String type = name.contains("bsd") ? "1" : "2";
                    String id = String.valueOf(model.get("id"));
                    String image = (String) model.get("image");
                    
                    // 检查模特数据是否已存在
                    WeModel existModel = weModelService.selectWeModelByWeId(id);
                    if (existModel == null) {
                        // 新增模特数据
                        WeModel mod = new WeModel();
                        mod.setName(name);
                        mod.setModelUrl(image);
                        mod.setModelWeId(id);
                        mod.setType(type);
                        weModelService.insertWeModel(mod);
                        modelCount++;
                    }
                }
            }
        }
        
        return modelCount;
    }
}