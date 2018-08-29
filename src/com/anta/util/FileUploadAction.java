package com.anta.util;

import java.io.ByteArrayInputStream;
import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileOutputStream;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.util.List;  
  



import org.apache.struts2.ServletActionContext;  
  
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;  
  
/** 
 * 多文件上传，用集合的方式 
 * @author Administrator 
 * 
 */  
@Component
public class FileUploadAction extends ActionSupport {  
      
    private String usename ;  
    private List<File> file ;  
    private List<String> fileFileName ;  
    private List<String> fileContentType ;  
    private String uploadPath;
	private InputStream inputStream;
	String pathNames = "";
    public String getUsename() {  
        return usename;  
    }  
    public void setUsename(String usename) {  
        this.usename = usename;  
    }  
    public List<File> getFile() {  
        return file;  
    }  
    public void setFile(List<File> file) {  
        this.file = file;  
    }  
    public List<String> getFileFileName() {  
        return fileFileName;  
    }  
    public void setFileFileName(List<String> fileFileName) {  
        this.fileFileName = fileFileName;  
    }  
    public List<String> getFileContentType() {  
        return fileContentType;  
    }  
    public void setFileContentType(List<String> fileContentType) {  
        this.fileContentType = fileContentType;  
    }  
      
    public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	@Override  
    public String execute() throws Exception {  
          
        //获取文件存储路径  
        String path = ServletActionContext.getRequest().getServletContext().getRealPath("/upload/"+uploadPath);  
        File directory = new File(path);
        if(!directory.exists()&&!directory.isDirectory()){
        	directory.mkdir();
        }
        System.out.println(path);
        for(int i = 0 ; i < file.size() ; i++ )  
        {  
        	File f = new File(path,fileFileName.get(i));
        	//如果文件不存在，那么就创建，如果存在，那么不用理会
        	if(!f.exists()){
	            OutputStream os = new FileOutputStream(f);  
	              
	            InputStream is = new FileInputStream(file.get(i));  
	              
	            byte[] buf = new byte[1024];  
	            int length = 0 ;  
	              
	            while(-1 != (length = is.read(buf) ) )  
	            {  
	                os.write(buf, 0, length) ;  
	            }  
	            is.close();  
	            os.close();  
        	}
            pathNames+= ServletActionContext.getRequest().getContextPath()+"/upload/"+uploadPath+"/"+fileFileName.get(i)+"`";
              
        }  
        System.out.println(pathNames);
        ActionContext.getContext().getSession().put("pathNames", pathNames);
        inputStream = new ByteArrayInputStream(JSON.toJSONString(pathNames).getBytes("utf-8"));
        pathNames="";
        return "ajaxSuccess";  
    }  
  
}  