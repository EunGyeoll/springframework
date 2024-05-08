package com.mycompany.springframework.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.springframework.dao.mybatis.Ch13BoardDao;
import com.mycompany.springframework.dto.Ch13Board;
import com.mycompany.springframework.dto.Ch13Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class Ch13Service {
   @Resource
   private Ch13BoardDao boardDao;
   
   public void writeBoard(Ch13Board board) {
      // 비지니스 로직 처리
      int rowNum = boardDao.insert(board);
      log.info("rowNum: " + rowNum + ", bno: " + board.getBno());
   }
   
   public List<Ch13Board> getBoardList(Ch13Pager pager) {
      List<Ch13Board> boardList = boardDao.selectByPage(pager);
      return boardList;
   }
   
   public int getTotalRows() { /*이건 왜 boardDao에서 가져오고 밑에건 왜 Dto에서 가져오지?*/
      int totalRows = boardDao.count();
      return totalRows;
   }

   public Ch13Board getBoard(int bno) { /*Ch13Board는 Dto*/
      Ch13Board board = boardDao.selectByBno(bno);
      return board; /*board라는걸 Ch13Board로 가져온다*/
   }

   public byte[] getAttachData(int bno) {
      Ch13Board board = boardDao.selectAttachData(bno);
      return board.getBattachdata();
   }

public void updateBoard(Ch13Board board) {
	// TODO Auto-generated method stub	
	boardDao.update(board);
}

public void removeBoard(int bno) {
	// TODO Auto-generated method stub
	boardDao.deleteByBno(bno);
}
}