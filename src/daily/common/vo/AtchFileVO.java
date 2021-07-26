package daily.common.vo;

import java.util.Date;

public class AtchFileVO {
		private long atchFileId = -1; 		// 첨부파일ID
		private int fileSn = 1; 			// 파일순번
		private Date atchCreatDate; 				// 생성 일자
		private String fileStreCours;		// 파일저장경로
		private String fileName;  			// 저장파일명
		private String fileOriginalName;	// 원본파일명
		private String fileExtsn; 			// 파일확장자
		private String fileContent; 		// 파일내용
		private long fileSize = 0; 			 // 파일크기
		
		public long getAtchFileId() {
			return atchFileId;
		}
		public void setAtchFileId(long atchFileId) {
			this.atchFileId = atchFileId;
		}
		public int getFileSn() {
			return fileSn;
		}
		public void setFileSn(int fileSn) {
			this.fileSn = fileSn;
		}
		
		public Date getAtchCreatDate() {
			return atchCreatDate;
		}
		public void setAtchCreatDate(Date atchCreatDate) {
			this.atchCreatDate = atchCreatDate;
		}
		public String getFileStreCours() {
			return fileStreCours;
		}
		public void setFileStreCours(String fileStreCours) {
			this.fileStreCours = fileStreCours;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public String getFileOriginalName() {
			return fileOriginalName;
		}
		public void setFileOriginalName(String fileOriginalName) {
			this.fileOriginalName = fileOriginalName;
		}
		public String getFileExtsn() {
			return fileExtsn;
		}
		public void setFileExtsn(String fileExtsn) {
			this.fileExtsn = fileExtsn;
		}
		public String getFileContent() {
			return fileContent;
		}
		public void setFileContent(String fileContent) {
			this.fileContent = fileContent;
		}
		public long getFileSize() {
			return fileSize;
		}
		public void setFileSize(long fileSize) {
			this.fileSize = fileSize;
		}
		
    
    
    
}