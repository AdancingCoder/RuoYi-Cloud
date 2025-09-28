package com.ruoyi.system.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.api.domain.SysFile;
import com.ruoyi.system.api.RemoteFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.WeCloth;
import com.ruoyi.system.service.IWeClothService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.core.domain.R;

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

    @Autowired
    private RemoteFileService remoteFileService;

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

    /**
     * 上传look图
     */
    @RequiresPermissions("system:cloth:add")
    @Log(title = "服装", businessType = BusinessType.INSERT)
    @PostMapping("/uploadLook")
    public AjaxResult uploadLook(@RequestParam("lookFile") MultipartFile lookFile, @RequestParam("type") String type) throws IOException {
        // 检查文件大小 (限制为20MB)
        if (lookFile.getSize() > 20 * 1024 * 1024) {
            return AjaxResult.error("文件大小不能超过20MB");
        }
        
        // 上传文件到文件服务
        R<SysFile> fileResult = remoteFileService.upload(lookFile);
        // 修复：使用R类的isSuccess静态方法检查结果
        if (!R.isSuccess(fileResult)) {
            return AjaxResult.error("文件上传失败");
        }

        String url = fileResult.getData().getUrl();

        // 根据类型确定前缀
        String prefix = "";
        switch (type) {
            case "1":
                prefix = "bsd";
                break;
            case "2":
                prefix = "tan";
                break;
            case "3":
                prefix = "auto";
                break;
            default:
                return AjaxResult.error("不支持的服装类型");
        }

        // 查询当前类型的最大编号
        String clothName = weClothService.generateClothName(prefix);

        // 创建服装对象
        WeCloth cloth = new WeCloth();
        cloth.setName(clothName);
        cloth.setClothUrl(url);
        cloth.setType(type);

        // 保存到数据库
        return toAjax(weClothService.insertWeCloth(cloth));
    }
}