package com.JSHblog.jangtjdgns.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.JSHblog.jangtjdgns.Service.ArticleService;
import com.JSHblog.jangtjdgns.Vo.Article;

@Controller
public class ArticleController {

	private ArticleService articleService;

	public ArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}

	// 게시판 목록
	@RequestMapping("/article/list")
	public String showList(Model model
			, @RequestParam(defaultValue = "1") int searchType
			, @RequestParam(defaultValue = "") String searchKeyword
			) {

		List<Article> articles = articleService.getArticles(searchType, searchKeyword);

		model.addAttribute("articles", articles);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);

		return "article/list";
	}

	// 게시판 상세보기
	@RequestMapping("/article/detail")
	public String showDetaol(Model model, int id) {

		Article article = articleService.getArticleById(id);

		model.addAttribute("article", article);

		return "article/detail";
	}

	// 게시판 작성 페이지
	@RequestMapping("/article/write")
	public String write() {

		return "article/write";
	}

	// 게시판 작성
	@RequestMapping("/article/doWrite")
	public String doWrtie(String title, String body) {

		articleService.doWrite(title, body);

		return "redirect:/article/list";
	}

	// 게시판 삭제
	@RequestMapping("/article/doDelete")
	public String doDelete(int id) {

		articleService.doDeleteById(id);

		return "redirect:/article/list";
	}

	// 게시판 수정 페이지
	@RequestMapping("/article/modify")
	public String modify(Model model, int id) {

		Article article = articleService.getArticleById(id);

		model.addAttribute("article", article);

		return "article/modify";
	}

	@RequestMapping("/article/doModify")
	public String modify(int id, String title, String body) {

		articleService.doModify(id, title, body);

		return "redirect:/article/detail?id=" + id;
	}
}
