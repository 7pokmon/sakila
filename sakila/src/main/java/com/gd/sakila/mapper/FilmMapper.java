package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.FilmForm;
import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

@Mapper
public interface FilmMapper {
	//List<FilmList> selectFilmList(Page page);
	List<Map<String, Object>> selectFilmList(Map<String, Object> map);	// 영화리스트
	Map<String, Object> selectFilmOneByFID(int FID);					// 상세보기
	int selectFilmTotal(Map<String, Object> map);						// 전체페이지수
	List<Integer> selectFilmInStock(Map<String, Object> map);			// 프로시저
	
	List<String> selectRatingList(); 									// 등급리스트
	List<String> selectPriceList(); 									// 가격리스트
	
	List<Map<String, Object>> selectActorList(int FID);
	int deleteCheckActor(int FID);
	int insertCheckActor(int ck, int FID);
	
	int insertFilm(Film film);
	int insertFilmCategory(Map<String, Object> map);
	
	int updateFilm(Film film);
	int updateFilmCategory(Map<String, Object> map);
	
	int deleteFilmActor(int filmId);
	int deleteFilmCategory(int filmId);
	int deleteFilm(int filmId);
}
