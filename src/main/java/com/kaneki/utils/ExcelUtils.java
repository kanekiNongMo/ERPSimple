package com.kaneki.utils;

import java.io.IOException;
import java.net.URLEncoder;

import sun.misc.BASE64Encoder;


public class ExcelUtils {
	public static String encodeDownloadFilename(String filename, String agent) throws IOException {
		if (agent.contains("Firefox")) {
			filename = "=?UTF-8?B?" + new BASE64Encoder().encode(filename.getBytes("utf-8")) + "?=";
			filename = filename.replaceAll("\r\n", "");
		} else {
			filename = URLEncoder.encode(filename, "utf-8");
			filename = filename.replace("+", " ");
		}
		return filename;
	}

}
