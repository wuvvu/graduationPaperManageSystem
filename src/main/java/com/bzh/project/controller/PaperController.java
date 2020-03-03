package com.bzh.project.controller;

import com.bzh.project.mapper.PaperSearchMapper;
import com.bzh.project.model.paper.PaperSearchResult;
import com.bzh.project.service.FileService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class PaperController {

   /* @RequestMapping("/query_excellent_papers")
    public String query_page() {
        System.out.println("class MainController query_page method");
        return "student/query_excellent_papers_result";
    }*/

    private PaperSearchMapper paperSearchMapper;

    public PaperController(PaperSearchMapper paperSearchMapper, FileService fileService) {
        this.paperSearchMapper = paperSearchMapper;
        this.fileService = fileService;
    }

    @RequestMapping("/jsp/student/query_excellent_papers_result")
    public ModelAndView query(@RequestParam(value = "word") String word, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("student/query_excellent_papers_result");
        List<PaperSearchResult> paperSearchResults;
        PageHelper.startPage(pageNum, 10);
        if (word == null || word.equals("")) {
            paperSearchResults= paperSearchMapper.searchExcellentPapers();
        } else {
            paperSearchResults= paperSearchMapper.searchExcellentPapersByWord(word);
        }
//        for (PaperSearchResult paperSearchResult : paperSearchResults) {
//            System.out.println("searchResult.getStudentId() = " + paperSearchResult.getStudentId());
//        }
        mav.addObject("paperSearchResults", paperSearchResults);
        mav.addObject("pageInfo", new PageInfo<>(paperSearchResults));
        return mav;
    }

    @RequestMapping("/jsp/teacher/query_excellent_papers_result")
    public ModelAndView query_excellent(@RequestParam(value = "word") String word, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("teacher/query_excellent_papers_result");
        List<PaperSearchResult> paperSearchResults;
        PageHelper.startPage(pageNum, 10);
        if (word == null || word.equals("")) {
            paperSearchResults= paperSearchMapper.searchExcellentPapers();
        } else {
            paperSearchResults= paperSearchMapper.searchExcellentPapersByWord(word);
        }
        mav.addObject("paperSearchResults", paperSearchResults);
        mav.addObject("pageInfo", new PageInfo<>(paperSearchResults));
        return mav;
    }

    @RequestMapping("/jsp/teacher/query_anything_result")
    public ModelAndView query_anything(@RequestParam(value = "word") String word, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        ModelAndView mav = new ModelAndView("teacher/query_anything_result");
        List<PaperSearchResult> paperSearchResults;
        PageHelper.startPage(pageNum, 10);
        if (word == null || word.equals("")) {
            paperSearchResults = paperSearchMapper.searchAnything();
        } else {
            paperSearchResults = paperSearchMapper.searchAnythingByWord(word);
        }
        mav.addObject("paperSearchResults", paperSearchResults);
        mav.addObject("pageInfo", new PageInfo<>(paperSearchResults));
        return mav;
    }

    private final FileService fileService;

    @RequestMapping("/paper/download")
    @ResponseBody
    public String downloadFile(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        int downloadStatus = fileService.downloadFile(request, response);
        String responseResult;
        switch (downloadStatus) {
            case 0:
                System.out.println("下载成功");
                responseResult = "下载成功";
                break;
            case -1:
                System.out.println("fileName参数为空");
                responseResult = "fileName参数为空";
                break;
            case -2:
                System.out.println("文件不存在");
                responseResult = "文件不存在";
                break;
            default:
                responseResult = "";
                break;
        }
        return responseResult;
    }




}
