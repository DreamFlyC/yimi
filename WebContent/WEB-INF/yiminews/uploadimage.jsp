<%@ page contentType="text/html;charset=gb2312" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<%
SmartUpload mySmartUpload =new SmartUpload();
long file_size_max=4000000;
String fileName2=" ",ext="",testvar="";
String url="images/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ��ڣ�Ҳ����˵��Ҫ�Լ�������Ӧ���ļ��У�
//��ʼ��
mySmartUpload.initialize(pageContext);
//ֻ�������ش����ļ�
try {
mySmartUpload.setAllowedFilesList("jpg,gif,png");//�˴����ļ���ʽ���Ը�����Ҫ�Լ��޸�
//�����ļ�
mySmartUpload.upload();
} catch (Exception e){
%>
<SCRIPT language=javascript>
LW.message.show("ֻ�����ϴ�.jpg��.gif,png����ͼƬ�ļ�");
window.location='post';
</script>
<%
}
try{

com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
if (myFile.isMissing()){%>
<SCRIPT language=javascript>
LW.message.show("����ѡ��Ҫ�ϴ����ļ�");
window.location='post';
</script>
<%}
else{
//String myFileName=myFile.getFileName(); //ȡ�����ص��ļ����ļ���
ext= myFile.getFileExt(); //ȡ�ú�׺��
int file_size=myFile.getSize(); //ȡ���ļ��Ĵ�С
String saveurl="";
if(file_size<file_size_max){
//�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis());
saveurl=application.getRealPath("/")+url;
saveurl+=filename+"."+ext; //����·��
myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
{%>
<SCRIPT language=javascript>
window.onload=function(){
	window.location.href="addimg?filename=<%=filename%>&title=${yimiNews.title}&url=${yimiNews.url}&content=${yimiNews.content}&seoDescribe=${yimiNews.seoDescribe}&seoKeywords=${yimiNews.seoKeywords}";
}
out.print(saveurl+123)
</script>
<%}

String ret = "parent.HtmlEdit.focus();";
ret += "var range = parent.HtmlEdit.document.selection.createRange();" ;
ret += "range.pasteHTML('<img src=\"" + request.getContextPath() + "/images/" + filename + "." + ext + "\">');" ;
ret += "LW.message.show('�ϴ��ɹ���');";
ret += "window.location='addpost';";
out.print("<script language=javascript>" + ret + "</script>");
	}
}
}catch (Exception e){
out.print(e.toString());
}
%>