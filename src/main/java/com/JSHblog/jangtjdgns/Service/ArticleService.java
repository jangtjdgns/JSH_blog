package com.JSHblog.jangtjdgns.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.JSHblog.jangtjdgns.Dao.ArticleDao;
import com.JSHblog.jangtjdgns.Vo.Article;

@Service
public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	public List<Article> getArticles() {
		return articleDao.getArticles();
	}
	
	public Article getArticleById(int id) {
		
		return articleDao.getArticleById(id);
	}
	
	public void doWrite(String title, String body) {
		articleDao.doWrite(title, body);
	}
	
	public void doDeleteById(int id) {
		articleDao.doDeleteById(id);
	}
	
	public void doModify(int id, String title, String body) {
		articleDao.doModify(id, title, body);
	}
}
