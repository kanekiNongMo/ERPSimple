package com.kaneki.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.OrderForm;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.Supplier;
import com.kaneki.service.OrderFormService;
import com.kaneki.service.SupplierService;
import com.kaneki.utils.ExcelUtils;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class OrderFormController {
	@Autowired
	private OrderFormService orderFormService;

	@Autowired
	private SupplierService supplierService;

	// 分页查询所有订单信息，可以根据供应商名称，订单类型，订单状态分页查询
	@RequestMapping(value = "/orderFormList.action")
	public String findOrder(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer pageRows, OrderForm orderForm, Model model) {
		Page<OrderForm> pageOrders = orderFormService.findOrderForm(page, pageRows, orderForm);
		List<Supplier> supList = supplierService.getSup();
		if (orderForm.getSupplier() != null) {
			model.addAttribute("SID", orderForm.getSupplier().getSupplierId());
		}
		model.addAttribute("TYPE", orderForm.getOrderType());
		model.addAttribute("STATUS", orderForm.getOrderStatus());
		model.addAttribute("SUP", supList);
		model.addAttribute("page", pageOrders);
		return "OrderFormList";
	}

	// 删除订单信息
	@RequestMapping(value = "/deleteOrder.action")
	@ResponseBody
	public String deleteOrderForm(int orderId) {
		int i = orderFormService.deleteOrderForm(orderId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

	// 修改订单信息
	@RequestMapping(value = "/updateOrder.action")
	@ResponseBody
	public String updateOrderForm(OrderForm orderForm) {
		int i = orderFormService.updateOrderForm(orderForm);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

	// 添加订单信息
	@RequestMapping(value = "/addOrder.action")
	@ResponseBody
	public String addOrder(OrderForm orderForm) {
		int i = orderFormService.addOrder(orderForm);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

	// 根据订单编号获取订单信息
	@RequestMapping(value = "/getOrderById.action")
	@ResponseBody
	public OrderForm getOrderById(int orderId) {
		return orderFormService.getOrderById(orderId);
	}
	
	@RequestMapping(value="/export.action")
	public void export(HttpServletResponse response, HttpServletRequest request,OrderForm order) {
		List<OrderForm> orderForms=orderFormService.findOrderForm(order);
		// 生成Excel文件
				HSSFWorkbook workbook = new HSSFWorkbook();
				HSSFSheet sheet = workbook.createSheet("订单数据");
				// 表头
				HSSFRow headRow = sheet.createRow(0);
				// 第四步，创建单元格，并设置值表头 设置表头居中
				HSSFCellStyle style = workbook.createCellStyle();
				
				//列名，
				headRow.createCell(0).setCellValue("订单编号");
				headRow.createCell(1).setCellValue("供应商名称");
				headRow.createCell(2).setCellValue("创建人");
				headRow.createCell(3).setCellValue("创建时间");
				headRow.createCell(4).setCellValue("审核人");
				headRow.createCell(5).setCellValue("审核时间");
				headRow.createCell(6).setCellValue("跟单人");
				headRow.createCell(7).setCellValue("结束时间");
				headRow.createCell(8).setCellValue("订单类型");
				headRow.createCell(9).setCellValue("订单状态");
				headRow.createCell(10).setCellValue("总数量");
				headRow.createCell(11).setCellValue("总金额");
				// 表格数据
				for (OrderForm orderForm : orderForms) {
					HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
					dataRow.createCell(0).setCellValue(orderForm.getOrderId());
					dataRow.createCell(1).setCellValue(orderForm.getSupplier().getSupplierName());
					dataRow.createCell(2).setCellValue(orderForm.getCreater());
					dataRow.createCell(3).setCellValue(orderForm.getcTime());
					dataRow.createCell(4).setCellValue(orderForm.getAuditor());
					dataRow.createCell(5).setCellValue(orderForm.getaTime());
					dataRow.createCell(6).setCellValue(orderForm.getDocumentary());
					dataRow.createCell(7).setCellValue(orderForm.geteTime());
					dataRow.createCell(8).setCellValue(orderForm.getOrderType());
					dataRow.createCell(9).setCellValue(orderForm.getOrderStatus());
					dataRow.createCell(10).setCellValue(orderForm.getTotalQuantity());
					dataRow.createCell(11).setCellValue(orderForm.getAggregateAmount());
				}

				// 下载导出
				String filename = "订单数据-" + UUID.randomUUID().toString() + ".xls";// 设置下载时客户端Excel的名称
				// 设置头信息
				response.setContentType("application/vnd.ms-excel");
				// 设置浏览器编码
				String agent = request.getHeader("user-agent");
				try {
					// 设置文件头以下载形式打开
					filename = ExcelUtils.encodeDownloadFilename(filename, agent);
					response.setHeader("Content-disposition", "attachment;filename=" + filename);
					OutputStream ouputStream;
					ouputStream = response.getOutputStream();
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();
					workbook.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	}

}
