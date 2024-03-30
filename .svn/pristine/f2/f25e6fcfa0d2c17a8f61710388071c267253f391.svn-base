package mypage.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;
import mypage.vo.ProfileImgVO;
import mypage.vo.ReviewImgVO;
import restaurant.vo.RestaurantVO;

/**
	 * Description : 이미지 파일 저장을 위한 유틸 클래스
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
public class FileUtil {

	public static int prfileImgUpload(Part part, String myId) throws IOException {
		
		IMypageService mypageSerivce = MypageServiceImple.getInstance();
		String ImgCours = "D:\\D_setting\\A_TeachingMaterial\\04_MiddelProject\\workspace\\TasteMap\\WebContent\\";
		String profileImgCours = "imgsource/profile/"+myId;
		File uploadDir = new File(ImgCours + profileImgCours);
		
		
		if(!uploadDir.exists()) {
			System.out.println(uploadDir);
		    System.out.println("폴더가 없어서 생성합니다: " + uploadDir.getAbsolutePath());
		    boolean created = uploadDir.mkdir();
		    System.out.println("폴더 생성 성공 여부: " + created);
//			uploadDir.mkdir();
		}
		
		
		// Part에서 파일 이름 추출
		
			String profileImgName = getSubmittedFileName(part);
			
			String profileImgExstn = profileImgName.substring(profileImgName.lastIndexOf("."),profileImgName.length());
			// 이미지를 지정된 경로에 저장
			part.write(ImgCours+profileImgCours + File.separator + profileImgName);
			
			
			ProfileImgVO img = new ProfileImgVO(profileImgName, profileImgCours, profileImgExstn);
			
			mypageSerivce.cstmrProfileImgInsert(img);
			int profileImgNo = mypageSerivce.cstmrProfileImgGet(img);
			
			
			return profileImgNo;
		
	}
	
	public static int reviewImgUpload(Part part, RestaurantVO rv, int reviewNo) throws IOException {
		IMypageService mypageSerivce = MypageServiceImple.getInstance();
		String ImgCours = "D:/D_setting/A_TeachingMaterial/04_MiddelProject/workspace/TasteMap/WebContent/";
		String addr = rv.getRstrntAddr();
		String name = rv.getRstrntName();
		String ctgry = mypageSerivce.getCategory(rv.getRstrntCode());
		
		
		String reviewFilePath = "imgsource/rstimg/"+addr.substring(0, 2)+"/"+ctgry+"/"+name;
		File uploadDir = new File(ImgCours + reviewFilePath);
		
		
		if(!uploadDir.exists()) {
			System.out.println(uploadDir);
		    System.out.println("폴더가 없어서 생성합니다: " + uploadDir.getAbsolutePath());
		    boolean created = uploadDir.mkdir();
		    System.out.println("폴더 생성 성공 여부: " + created);
//			uploadDir.mkdir();
		}
		
		
		// Part에서 파일 이름 추출
		
			String reviewFileName = getSubmittedFileName(part);
			
			String reviewFileExtsn = reviewFileName.substring(reviewFileName.lastIndexOf("."),reviewFileName.length());
			// 이미지를 지정된 경로에 저장
			part.write(ImgCours+reviewFilePath + File.separator + reviewFileName);
			
			reviewFileName = reviewFileName.replace(".jpg", "");
			
			ReviewImgVO img = new ReviewImgVO();
			img.setReviewFileName(reviewFileName);
			img.setReviewFilePath(reviewFilePath);
			img.setReviewFileExtsn(reviewFileExtsn);
			img.setReviewNo(reviewNo);
			
			int profileImgNo = mypageSerivce.insertReviewImg(img);
			
			
			return profileImgNo;
		
		
	}
	
	public static String getSubmittedFileName(Part part) {
        // Part에서 파일 이름 추출
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
