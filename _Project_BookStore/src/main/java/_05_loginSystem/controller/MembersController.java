package _05_loginSystem.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import _05_loginSystem.model.LoginBean;
import _05_loginSystem.model.Members;
import _05_loginSystem.model.MembersHistory;
import _05_loginSystem.service.MembersService;

@Controller
@SessionAttributes({"LoginOK","members","delivery","allDelivery"})
public class MembersController {
	@Autowired
	MembersService membersService;
	@Autowired
	ServletContext ctx;
	
	@GetMapping(value = "Dashboard_PersonInfo" , produces= {"text/html"}) //新增
	public String queryMembersByPhone(Model model, Members m, LoginBean bean) {
		Members mb = (Members) model.getAttribute("LoginOK");
		if (mb == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}

		model.addAttribute("members", mb);
		return "/LoginSystem/Dashboard_PersonInfo";
	}
	
	@RequestMapping(value = "membersSave", method=RequestMethod.POST)//新增
	public String address(HttpServletRequest request, Model model, Members m, MembersHistory mH, LoginBean bean, BindingResult bindingResult,
			@RequestParam("name") String name,
			@RequestParam("mail") String mail,
			@RequestParam("gender") String gender,
			@RequestParam("birthday") String birthday,
			@RequestParam("productImage") MultipartFile productImage) throws ParseException{
		
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (birthday == null) {
			errorMsg.put("errormembersBirthday", "請輸入你的生日");
		}
		if (gender == null ||gender.trim().length() == 0) {
			errorMsg.put("errormembersGender", "請輸入你的性別");
		}
		if (mail == null ||mail.trim().length() == 0) {
			errorMsg.put("errormembersMailEmpty", "無效的Email");
		}
		if (name == null ||name.trim().length() == 0) {
			errorMsg.put("errormembersName", "請輸你的姓名");
		}
		if (productImage == null) {
			errorMsg.put("errormembersName", "請選擇圖片");
		}

		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/Dashboard_PersonInfo";
		} 

		Members mb = (Members) model.getAttribute("LoginOK");
		if (mb == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}
		if("".equals(mb.getPhone()) || mb.getPhone() == null) 
		{
			m = membersService.queryMembersGoogleId(mb.getGoogleId());
		}
		else
		{
			m = membersService.queryMembers(mb.getPhone());
		}
		MultipartFile picture = productImage;

		if (picture.getSize() == 0) {
			// 表示使用者並未挑選圖片

			m.setPhoto(m.getPhoto());
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				m.setFileName(originalFilename);
			}

			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					m.setPhoto(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}

		m.setBirthday(birthday);
		m.setGender(gender);
		m.setMail(mail);
		m.setName(name);

		mH.setBirthday(birthday);
		mH.setGender(gender);
		mH.setMail(mail);
		mH.setName(name);
		
		Set<MembersHistory> mHSet = new LinkedHashSet<>();
		mHSet.add(mH);
		mH.setMembers(m);
		membersService.updateMembers(m);

		return "redirect:/Dashboard_PersonInfo";
			
	}
	
	@GetMapping("/getMemberImage")
	public ResponseEntity<byte[]>  getMemberImage(Model model) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			Members bean;
			Members mb = (Members) model.getAttribute("LoginOK");
			if("".equals(mb.getPhone()) || mb.getPhone() == null) 
			{
				bean = membersService.queryMembersGoogleId(mb.getGoogleId());
			}
			else
			{
				bean = membersService.queryMembers(mb.getPhone());
			}

			if (bean != null) {
				blob = bean.getPhoto();
				if (blob != null) {
					is = blob.getBinaryStream();
					System.out.println(is != null);
				}
				fileName = bean.getFileName();
				System.out.println("fileName = "+fileName);
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
			if (is == null) {
				
				fileName = "img-1.jpg" ; 
				is = ctx.getResourceAsStream(
						"/images/" + fileName);
				System.out.println(is != null);
			}
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = ctx.getMimeType(fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];
			
			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveBookImageServlet#doGet()發生Exception: " + ex.getMessage());
		} finally{
			try {
				if (is != null) is.close();
			} catch(IOException e) {
				;
			}
			try {
				if (os != null) os.close();
			} catch(IOException e) {
				;
			}
		}
		return responseEntity;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	@SuppressWarnings("unused")
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = ctx.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
}
