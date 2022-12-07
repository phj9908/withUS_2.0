package com.example.withus.Controller;

import com.example.withus.service.MapServiceImpl;
import com.example.withus.vo.MapVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MapController {

    @Autowired
    private MapServiceImpl mapServiceImpl;

    @GetMapping("/map")
    public String toMap() {  //회원가입 페이지
        return "map";
    }

    @PostMapping("/map")
    public String mapUpload(MapVo mapVo) {
        try {
            mapServiceImpl.upload(mapVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/main";
    }

      // 테이블 조회
//    @RequestMapping("/main") // main페이지에서 조회가 필요해서 main
//    public String mapList(Model model) {
//        Integer mapListGroup = 1;
//        List<MapVo> mapList = mapServiceImpl.getMapList(mapListGroup);
//        model.addAttribute("maplist", mapList);
//        return "main";
//    }
}
