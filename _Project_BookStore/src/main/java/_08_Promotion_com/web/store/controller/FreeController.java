package _08_Promotion_com.web.store.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import _08_Promotion_com.web.store.model.FreeBiesBean;
import _08_Promotion_com.web.store.service.FreeService;
import _09_Book.model.CompanyBean;

@Controller
public class FreeController {
	FreeService service;

	@Autowired 
	public void setService(FreeService service) {
		this.service = service;
	}
	
	//=====img context
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	//==user search===
	@RequestMapping("/Free")
	public String list(Model model) {
		List<FreeBiesBean>  list = service.getAllFrees();
		model.addAttribute("frees", list);
		return "Free";
	}
	
	
	//Add=======
	@GetMapping(value = "/FreeAdd")
	public String getAddNewFreeForm(Model model) {
		FreeBiesBean fbb = new FreeBiesBean();
	    model.addAttribute("freeBiesBean", fbb); 
	    return "FreeAdd";
	}
	
	//Add From,Img
//	@PostMapping(value = "/addFree")
	@PostMapping(value = "/FreeAdd")
	public String processAddNewFreeForm(@ModelAttribute("freeBiesBean") FreeBiesBean fbb) { 
		
		MultipartFile freeImage = fbb.getFreeImage();
		String originalFilename = freeImage.getOriginalFilename();
		fbb.setFilename(originalFilename);
		
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (freeImage != null && !freeImage.isEmpty() ) {
			try {
				byte[] b = freeImage.getBytes();
				Blob blob = new SerialBlob(b);
				fbb.setFreeBiesImg(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
	    service.addFree(fbb);
	    
	    //  將上傳的檔案移到指定的資料夾
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists()) imageFolder.mkdirs();
			File file = new File(imageFolder, fbb.getFreeBieEventId() + ext);
			freeImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
	    return "redirect:/Free";
	}
	
	//===出版社
	@ModelAttribute("companyList")
	public Map<Integer, String> getCompanyList() {
	    Map<Integer, String> companyMap = new HashMap<>();
	    List<CompanyBean> list = service.getCompanyList();
	    for (CompanyBean cb : list) {
	        companyMap.put(cb.getId(), cb.getName());
	    }
	    return companyMap;
	}	
	
	//========img
	@RequestMapping(value = "/getPicture2/{FreeBieEventId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture2(HttpServletResponse resp, @PathVariable Integer FreeBieEventId) {
	    String filePath = "/resources/images/NoImage.jpg";
	    byte[] media = null;
	    HttpHeaders headers = new HttpHeaders();
	    String filename = "";
	    int len = 0;
	    FreeBiesBean bean = service.getFreeById(FreeBieEventId);
	    if (bean != null) {
	        Blob blob = bean.getFreeBiesImg();
	        filename = bean.getFilename();
	        if (blob != null) {
	            try {
	                len = (int) blob.length();
	                media = blob.getBytes(1, len); //  blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
	            } catch (SQLException e) {
	                throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
	            }
	        } else {
	            media = toByteArray(filePath);    
	            filename = filePath;            
	        }
	    } else {
	    	media = toByteArray(filePath);    
	        filename = filePath;            
	    }
	       headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	       String mimeType = context.getMimeType(filename);
	    MediaType mediaType = MediaType.valueOf(mimeType);
	    System.out.println("mediaType =" + mediaType);
	    headers.setContentType(mediaType);
	    ResponseEntity<byte[]> responseEntity = 
	                new ResponseEntity<>(media, headers, HttpStatus.OK);
	    return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
	    byte[] b = null;
	    String realPath = context.getRealPath(filepath);
	    try {
	          File file = new File(realPath);
	          long size = file.length();
	          b = new byte[(int)size];
	          InputStream fis = context.getResourceAsStream(filepath);
	          fis.read(b);
	    } catch (FileNotFoundException e) {
	          e.printStackTrace();
	    } catch (IOException e) {
	          e.printStackTrace();
	    }
	    return b;
	}

	
	
	
	//==Manager search==
	@GetMapping("/FreeSearch")
	public String FreeSearchList(Model model) {
		List<FreeBiesBean>  list = service.getAllFrees();
		model.addAttribute("frees", list);
		return "/FreeSearch";
	}
	
		
	//======modify--read data---
	@GetMapping("/modifyFreeBies/{id}")
	public String editFreeBiesForm(Model model, @PathVariable Integer id) {
		FreeBiesBean bean = service.getFreeById(id);
		model.addAttribute("freeBiesBean", bean);
		return "/FreeModify";
	}
	
	//=====modify--check not error,write in SQL
	@PostMapping("/modifyFreeBies/{id}")
	
	
	public String modifyFreeBiesData(@ModelAttribute("freeBiesBean") FreeBiesBean bean) {
		
		MultipartFile picture = bean.getFreeImage();
		if (picture.getSize() == 0) {
			// Manager not pick picture
			
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setFilename(originalFilename);
			}

			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setFreeBiesImg(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		
		service.updateFreeBies(bean);	
		return "redirect:/FreeSearch";
	}
	

}