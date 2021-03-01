package kr.co.doogle.file;

import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doogle.storage.FileSystemStorageService;
import kr.co.doogle.storage.StorageFileNotFoundException;
import kr.co.doogle.storage.StorageProperties;
import kr.co.doogle.storage.StorageService;

@Service
@EnableConfigurationProperties(StorageProperties.class)
public class File {

	private final StorageService storageService;
	@Inject
	private FileSystemStorageService fileSystemStorageService;
	@Inject
	public File(StorageService storageService) {
		this.storageService = storageService;
	}
	private Map<String, String> loc = new HashMap(); 

	{
		loc.put("product", "src/main/resources/static/upload/img/shop/product");
		loc.put("event", "src/main/resources/static/upload/img/shop/event");
		loc.put("product", "src/main/resources/static/upload/img/shop/product");
		loc.put("product", "src/main/resources/static/upload/img/shop/product");
		loc.put("product", "src/main/resources/static/upload/img/shop/product");
	}

	public void setLocation(String loc) {
		fileSystemStorageService.setRootLocation(Paths.get(loc));
		storageService.init();
	}

	public void fileUpload(MultipartFile[] files) {
		for (MultipartFile f : files) {
			if (f.getOriginalFilename() != "")
				storageService.store(f);
		}
	}

	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

	public Map<String, String> getLoc() {
		return loc;
	}

	public String getRealLoc(String loc) {
		return this.loc.get(loc).replace("src/main/resources/", "") + "/";
	}

}