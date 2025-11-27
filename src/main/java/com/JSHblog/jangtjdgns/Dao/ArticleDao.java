package com.JSHblog.jangtjdgns.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.JSHblog.jangtjdgns.Vo.Article;

@Mapper
public interface ArticleDao {

	@Select("""
			<script>
				SELECT * FROM article A
				WHERE 1 = 1
					<choose>
						<when test="searchType == '1'">
							AND A.title LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchType == '2'">
							AND A.body LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							AND (
								A.title LIKE CONCAT('%', #{searchKeyword}, '%')
								OR A.body LIKE CONCAT('%', #{searchKeyword}, '%')
							)
						</otherwise>
					</choose>
				ORDER BY id DESC;
			</script>
			""")
	public List<Article> getArticles(int searchType, String searchKeyword);

	@Select("""
			SELECT * FROM article
			WHERE id = #{id}
			""")
	public Article getArticleById(int id);

	@Insert("""
			INSERT INTO article
			SET regDate = NOW()
				, updateDate = NOW()
				, title = #{title}
				, `body` = #{body};
			""")
	public void doWrite(String title, String body);

	@Delete("""
			DELETE FROM article
			WHERE id = #{id}
			""")
	public void doDeleteById(int id);

	@Update("""
			UPDATE article
			SET title = #{title}
				, `body` = #{body}
				, updateDate = NOW()
			WHERE id = #{id}
			""")
	public void doModify(int id, String title, String body);
}
