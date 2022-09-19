package com.renguangli.rainy.dmplatfrom;

import com.renguangli.rainy.dmplatfrom.entity.DataDirectory;
import com.renguangli.rainy.dmplatfrom.service.DataDirectoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:59
 */
@RestController
@RequiredArgsConstructor
public class DataDirectoryController {

    private final DataDirectoryService dataDirectoryService;

    @GetMapping("/dataDirectories")
    public List<DataDirectory> list(){
        return dataDirectoryService.tree();
    }

}
