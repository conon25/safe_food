package com.ssafy.foodproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.foodproject.model.Board;
import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;
import com.ssafy.foodproject.service.BoardService;
import com.ssafy.foodproject.service.FoodService;
import com.ssafy.foodproject.service.UserService;
import com.ssafy.foodproject.util.AllergyData;
import com.ssafy.foodproject.util.FoodPageData;

@Controller
public class FoodController {

	@Autowired
	private FoodService foodService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goMain() {
		return "index";
	}

	@RequestMapping(value = "/allFoods.do", method = RequestMethod.GET)
	public String getAllFood(int page, Model model) {

		int size = foodService.selectAll().size();
		List<Food> foods = foodService.pagination(page);
		model.addAttribute("page_size", (size - 1) / 6 + 1);
		model.addAttribute("foodselectall", foods);

		return "main";
	}

	@ResponseBody
	@RequestMapping(value = "/searchByAsync.do", method = RequestMethod.POST)
	public FoodPageData getFoodByNameAsync(int page, String sinfo, String items1, Model model) {

		System.out.println(page + " " + sinfo + " " + items1);
		List<Food> foods = null;
		int size = 0;

		if (items1.equals("name")) {
			foods = foodService.paginationByName(sinfo, page);
			size = foodService.searchByName(sinfo).size();
		} else if (items1.equals("maker")) {
			foods = foodService.paginationByMaker(sinfo, page);
			size = foodService.searchByMaker(sinfo).size();
		} else if (items1.equals("matarial")) {
			foods = foodService.paginationByMaterial(sinfo, page);
			size = foodService.searchByMaterial(sinfo).size();
		}

		return new FoodPageData((size - 1) / 6 + 1, foods);
	}

	@RequestMapping(value = "/searchBy.do", method = RequestMethod.GET)
	public String getFoodByName(int page, String sinfo, String items1, Model model) {

		System.out.println(page + " " + sinfo + " " + items1);
		List<Food> foods = null;
		int size = 0;

		if (items1.equals("name")) {
			foods = foodService.paginationByName(sinfo, page);
			size = foodService.searchByName(sinfo).size();
		} else if (items1.equals("maker")) {
			foods = foodService.paginationByMaker(sinfo, page);
			size = foodService.searchByMaker(sinfo).size();
		} else if (items1.equals("matarial")) {
			foods = foodService.paginationByMaterial(sinfo, page);
			size = foodService.searchByMaterial(sinfo).size();
		}

		model.addAttribute("page_size", (size - 1) / 6 + 1);
		model.addAttribute("foodselectall", foods);

		return "main";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest req, String id, String pwd, Model model) {
		HttpSession session = req.getSession();
		if (userService.login(new User(id, pwd, null, null, null, 0))) {
			session.setAttribute("login", userService.getUserInfo(id));
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/goRegister.do", method = RequestMethod.GET)
	public String goRegister(HttpServletRequest req) {
		return "regi";
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(User user, AllergyData allergyData) {

		String allergy = "";
		if (!allergyData.getAl_1().equals(""))
			allergy += allergyData.getAl_1() + ",";
		if (!allergyData.getAl_2().equals(""))
			allergy += allergyData.getAl_2() + ",";
		if (!allergyData.getAl_3().equals(""))
			allergy += allergyData.getAl_3() + ",";
		if (!allergyData.getAl_4().equals(""))
			allergy += allergyData.getAl_4() + ",";
		if (!allergyData.getAl_5().equals(""))
			allergy += allergyData.getAl_5() + ",";
		if (!allergyData.getAl_6().equals(""))
			allergy += allergyData.getAl_6() + ",";
		if (!allergyData.getAl_7().equals(""))
			allergy += allergyData.getAl_7() + ",";
		if (!allergyData.getAl_8().equals(""))
			allergy += allergyData.getAl_8() + ",";
		if (!allergyData.getAl_9().equals(""))
			allergy += allergyData.getAl_9() + ",";
		if (!allergyData.getAl_10().equals(""))
			allergy += allergyData.getAl_10() + ",";
		if (!allergyData.getAl_11().equals(""))
			allergy += allergyData.getAl_11() + ",";
		if (!allergyData.getAl_12().equals(""))
			allergy += allergyData.getAl_12() + ",";
		if (!allergyData.getAl_13().equals(""))
			allergy += allergyData.getAl_13() + ",";

		System.out.println(user);
		System.out.println(allergyData);
		System.out.println(allergy);

		int length = allergy.toString().length();
		user.setAllergy(allergy.toString().length() > 0 ? allergy.toString().substring(0, length - 1) : "");
		userService.addUser(user);

		return "redirect:/";
	}

	@RequestMapping(value = "/fooddetail.do")
	public String fooddetail(HttpServletRequest req, int code, Model model) {

		foodService.foodClick(code);
		Food f = (Food) foodService.searchByCode(code);
		User user = (User) req.getSession().getAttribute("login");

		List<String> warnMaterials = foodService.getWarnMaterial(user, code);

		model.addAttribute("warnMaterials", warnMaterials);
		model.addAttribute("food", f);
		return "main";
	}

	@RequestMapping(value = "/infoUpdate.do")
	public String infoUpdate(HttpServletRequest req, User user, AllergyData allergyData) {

		User temp = (User) req.getSession().getAttribute("login");
		String t = userService.getPW(new User(temp.getId(), "", "", "", "", 0));
		if (user.getPw() == null || user.getPw().equals("")) {
			user.setPw(t);
		}
		user.setId(temp.getId());
		String allergy = "";
		if (!allergyData.getAl_1().equals(""))
			allergy += allergyData.getAl_1() + ",";
		if (!allergyData.getAl_2().equals(""))
			allergy += allergyData.getAl_2() + ",";
		if (!allergyData.getAl_3().equals(""))
			allergy += allergyData.getAl_3() + ",";
		if (!allergyData.getAl_4().equals(""))
			allergy += allergyData.getAl_4() + ",";
		if (!allergyData.getAl_5().equals(""))
			allergy += allergyData.getAl_5() + ",";
		if (!allergyData.getAl_6().equals(""))
			allergy += allergyData.getAl_6() + ",";
		if (!allergyData.getAl_7().equals(""))
			allergy += allergyData.getAl_7() + ",";
		if (!allergyData.getAl_8().equals(""))
			allergy += allergyData.getAl_8() + ",";
		if (!allergyData.getAl_9().equals(""))
			allergy += allergyData.getAl_9() + ",";
		if (!allergyData.getAl_10().equals(""))
			allergy += allergyData.getAl_10() + ",";
		if (!allergyData.getAl_11().equals(""))
			allergy += allergyData.getAl_11() + ",";
		if (!allergyData.getAl_12().equals(""))
			allergy += allergyData.getAl_12() + ",";
		if (!allergyData.getAl_13().equals(""))
			allergy += allergyData.getAl_13() + ",";

		int length = allergy.toString().length();
		user.setAllergy(allergy.toString().length() > 0 ? allergy.toString().substring(0, length - 1) : "");
		System.out.println(user.toString());
		userService.infoUpdate(user);
		user.setPw(null);
		req.getSession().setAttribute("login", user);
		return "index";
	}

	@RequestMapping(value = "/userDelete.do")
	public String userDelete(HttpServletRequest req) {
		HttpSession session = req.getSession();
		User u = (User) session.getAttribute("login");
		userService.userDelete(u);
		session.invalidate();
		return "index";

	}
	@RequestMapping(value = "/adminDelete.do")
	public String adminDelete(String id) {
		userService.adminDelete(id);
		return "redirect:/userList.do";
	}
	
	
	
	@RequestMapping(value = "userList.do")
	public String userList(Model model) {
		List<User> temp =  userService.userList();
		model.addAttribute("userList", temp);
		return "userlist";

	}
	
	@RequestMapping(value = "adminSearch.do")
	public String adminSearch(String select_option, String value, Model model) {
		List<User> temp = null;
		System.out.println("asdf");
		if(select_option.equals("1")) {
			temp = userService.userList();
		}else if(select_option.equals("2")) {
			temp = userService.userListbyId(value);
		}else if(select_option.equals("3")) {
			temp = userService.userListbyName(value);
		}

		model.addAttribute("userList", temp);
		return "userlist";

	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	public String idCheck(String id) {

		if (userService.chkId(id))
			return "SUCS";
		else
			return "FAIL";

	}
	
	@RequestMapping(value = "/allBoards.do", method = RequestMethod.GET)
	public String getAllBoards(int page, Model model) {

	int size = boardService.getAllBoardCnt();
	List<Board> boardList = boardService.getPage(page);
	System.out.println("board size : "+size);
	System.out.println("board" + boardList);

	model.addAttribute("page_size", (size - 1) / 10 + 1);
	model.addAttribute("boardList", boardList);
	return "boardList";
	}

	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public String getBoard(int num, Model model) {

	model.addAttribute("board", boardService.getBoard(num));

	return "boardDetail";
	}

	@RequestMapping(value = "/addBoardForm.do", method = RequestMethod.GET)
	public String addBoardForm() {

	return "addBoard";
	}

	@RequestMapping(value = "/addBoard.do", method = RequestMethod.POST)
	public String addBoard(Board board) {
	System.out.println("addBoard");
	System.out.println(board.toString());
	boardService.insertBoard(board);

	return "redirect:/allBoards.do?page=1";
	}

}