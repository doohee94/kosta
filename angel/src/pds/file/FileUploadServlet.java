package pds.file;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import pds.model.PdsPhoto;
import pds.service.AddPdsPhotoService;

public class FileUploadServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");

		String contentType = req.getContentType();
		if (contentType != null
				&& contentType.toLowerCase().startsWith("multipart/")) {
			PdsPhoto uploadedPhoto = saveUploadFile(req);
			req.setAttribute("uploadedPhoto", uploadedPhoto);
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("/picture/uploaded.jsp");
			dispatcher.forward(req, resp);
		} else {
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("/picture/invalid.jsp");
			dispatcher.forward(req, resp);
		}
	}

	private PdsPhoto saveUploadFile(HttpServletRequest req) throws IOException,
			ServletException {
		Part descPart = req.getPart("description");
		String description = readParameterValue(descPart);
		Part filePart = req.getPart("file");
		String fileName = getFileName(filePart);
		String realPath = FileSaveHelper.save("C:\\Users\\kosta\\workspace\\workspace2\\web\\angel\\WebContent\\fileupload\\",
				filePart.getInputStream());

		PdsPhoto addRequest = new PdsPhoto();
		addRequest.setPhoto_name(fileName);
		addRequest.setPhoto_size(filePart.getSize());
		addRequest.setPhoto_content(description);
		addRequest.setPhoto_path(realPath);

		PdsPhoto PdsPhoto = AddPdsPhotoService.getInstance().add(addRequest);
		return PdsPhoto;
	}

	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	private String readParameterValue(Part part) throws IOException {
		InputStreamReader reader = new InputStreamReader(part.getInputStream(),"euc-kr");
		char[] data = new char[512];
		int len = -1;
		StringBuilder builder = new StringBuilder();
		while ((len = reader.read(data)) != -1) {
			builder.append(data, 0, len);
		}
		return builder.toString();
	}

}
