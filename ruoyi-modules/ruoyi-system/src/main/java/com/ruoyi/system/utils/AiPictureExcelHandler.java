package com.ruoyi.system.utils;

import com.ruoyi.common.core.utils.poi.ExcelHandlerAdapter;
import org.apache.poi.common.usermodel.HyperlinkType;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Hyperlink;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * AI图片Excel处理类
 * 用于将AI图片URL设置为超链接
 *
 * @author ruoyi
 * @date 2025-09-16
 */
public class AiPictureExcelHandler implements ExcelHandlerAdapter {

    /**
     * 将AI图片URL设置为超链接
     *
     * @param value 数据值
     * @param args  注解参数
     * @param cell  单元格对象
     * @param wb    工作簿对象
     * @return 处理后的值
     */
    @Override
    public Object format(Object value, String[] args, Cell cell, Workbook wb) {
        if (value == null) {
            return "";
        }

        String url = value.toString();
        if (url.isEmpty()) {
            return value;
        }

        // 创建超链接
        CreationHelper createHelper = wb.getCreationHelper();
        Hyperlink hyperlink = createHelper.createHyperlink(HyperlinkType.URL);
        hyperlink.setAddress(url);

        // 应用超链接到单元格
        cell.setHyperlink(hyperlink);

        // 返回原始URL作为显示文本
        return url;
    }
}
