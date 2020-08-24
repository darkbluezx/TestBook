package _09_Book.model;

public class BookBeanWithImageData{
	
		BookBean bean;
		String imageData;
		
		public BookBeanWithImageData() {
		}
		public BookBeanWithImageData(BookBean bean, String iamgeData) {
			this.bean = bean;
			this.imageData = iamgeData;
		}
		public BookBean getBean() {
			return bean;
		}
		public void setBean(BookBean bean) {
			this.bean = bean;
		}
		public String getImageData() {
			return imageData;
		}
		public void setImageData(String imageData) {
			this.imageData = imageData;
		}
		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("BookBeanWithImageData [bean=");
			builder.append(bean);
			builder.append(", imageData=");
			builder.append(imageData);
			builder.append("]");
			return builder.toString();
		}
		
		
		
}