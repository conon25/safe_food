package com.ssafy.foodproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.foodproject.model.Board;
import com.ssafy.foodproject.model.Eat;
import com.ssafy.foodproject.model.Food;
import com.ssafy.foodproject.model.User;
import com.ssafy.foodproject.service.BoardService;
import com.ssafy.foodproject.service.FoodService;
import com.ssafy.foodproject.service.MyeatService;
import com.ssafy.foodproject.service.ProductService;
import com.ssafy.foodproject.service.UserService;
import com.ssafy.foodproject.util.AllergyData;
import com.ssafy.foodproject.util.BoardInfo;
import com.ssafy.foodproject.util.EatData;
import com.ssafy.foodproject.util.FoodDetailData;
import com.ssafy.foodproject.util.FoodInfo;
import com.ssafy.foodproject.util.FoodPageData;
import com.ssafy.foodproject.util.Profile;
import com.ssafy.foodproject.util.UserInfo;

//@Controller
@RestController
//@CrossOrigin(origins = { "http://localhost:8081" }, maxAge = 6000)
public class FoodController {
	@Autowired
	private ProductService productService;

	@Autowired
	private FoodService foodService;

	@Autowired
	private UserService userService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private MyeatService myeatService;

	@RequestMapping(value = "/addMyFood/{foodCode}", method = RequestMethod.POST)
	public ResponseEntity<String> addMyFood(HttpSession session, @PathVariable int foodCode) {

		User user = (User) session.getAttribute("login");
		if (user != null) {

			if (myeatService.cntFood(foodCode, user.getId()) > 0) {
				myeatService.updtFoodCnt(foodCode, user.getId());
				return new ResponseEntity<String>("SUCS", HttpStatus.OK);
			} else {
				if (myeatService.addFood(foodCode, user.getId()))
					return new ResponseEntity<String>("SUCS", HttpStatus.OK);
			}
		}

		return new ResponseEntity<String>("Fail", HttpStatus.OK);

	}

	@RequestMapping(value = "/getProfileUserPage/{page}", method = RequestMethod.GET)
	public ResponseEntity<UserInfo> getProfileUserPage(@PathVariable int page, HttpSession session) {

		User u = (User) session.getAttribute("login");

		int totalSize = userService.countAll() - 1;
		List<User> arr = userService.getPageUser(u.getId(), page);
		return new ResponseEntity<UserInfo>(new UserInfo(arr, (totalSize - 1) / 6 + 1), HttpStatus.OK);

	}

	@RequestMapping(value = "/getProfileFoodPageNum", method = RequestMethod.GET)
	public ResponseEntity<Integer> getProfileFoodPageNum(HttpSession session) {

		User user = (User) session.getAttribute("login");
		int size = (myeatService.getAllMyeats(user.getId()).size() - 1) / 6 + 1;
		return new ResponseEntity<Integer>(size, HttpStatus.OK);
	}

	@RequestMapping(value = "/getProfileFoodPage/{page}", method = RequestMethod.GET)
	public ResponseEntity<List<EatData>> getProfileFoodPage(@PathVariable int page, HttpSession session) {

		User user = (User) session.getAttribute("login");
		List<EatData> foods = myeatService.getPageMyeats(user.getId(), page);
		System.out.println();
		return new ResponseEntity<List<EatData>>(foods, HttpStatus.OK);

	}

	@RequestMapping(value = "/getFoods/{page}", method = RequestMethod.GET)
	public ResponseEntity<FoodInfo> getAllFoods(@PathVariable int page) {

		int size = foodService.selectAll().size();
		List<Food> foods = foodService.pagination(page);
		FoodInfo foodInfo = new FoodInfo(foods, (size - 1) / 6 + 1);
		return new ResponseEntity<FoodInfo>(foodInfo, HttpStatus.OK);
	}

	@RequestMapping(value = "/searchByAsync/{page}/{sinfo}/{items1}", method = RequestMethod.GET)
	public ResponseEntity<FoodInfo> getFoodByNameAsync(@PathVariable int page, @PathVariable String sinfo,
			@PathVariable String items1) {

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
		FoodInfo foodInfo = new FoodInfo(foods, (size - 1) / 6 + 1);
		System.out.println(foodInfo);
		return new ResponseEntity<FoodInfo>(foodInfo, HttpStatus.OK);
	}

	@RequestMapping(value = "/fooddetail/{code}", method = RequestMethod.GET)
	public ResponseEntity<FoodDetailData> fooddetail(HttpSession session, @PathVariable int code) {
		System.out.println(code);
		foodService.foodClick(code);
		Food f = (Food) foodService.searchByCode(code);
		System.out.println(f);
		User user = (User) session.getAttribute("login");
		List<String> warnMaterials = foodService.getWarnMaterial(user, code);
		System.out.println(warnMaterials);
		FoodDetailData foodDetailData = new FoodDetailData(f, warnMaterials);

		return new ResponseEntity<FoodDetailData>(foodDetailData, HttpStatus.OK);
	}

	@RequestMapping(value = "/boardList/{page}", method = RequestMethod.GET)
	public ResponseEntity<BoardInfo> getAllBoards(@PathVariable int page) throws Exception {
		System.out.println("get req");
		int size = boardService.getAllBoardCnt();
		List<Board> boardList = boardService.getPage(page);
		BoardInfo boardInfo = new BoardInfo(boardList, (size - 1) / 10 + 1);
		return new ResponseEntity<BoardInfo>(boardInfo, HttpStatus.OK);
	}

	@RequestMapping(value = "/boardDetail/{num}", method = RequestMethod.GET)
	public ResponseEntity<Board> getBoard(@PathVariable int num) {
		Board board = boardService.getBoard(num);
		System.out.println(board.toString());
		return new ResponseEntity<Board>(board, HttpStatus.OK);
	}

	@RequestMapping(value = "/addBoard", method = RequestMethod.POST)
	public ResponseEntity<String> addBoard(@RequestBody Board board) {
		System.out.println("post sucs");
		System.out.println(board.toString());
		String res = "";
		if (boardService.insertBoard(board)) {
			res = "SUCS";
		} else {
			res = "FAIL";
		}

		return new ResponseEntity<String>(res, HttpStatus.OK);
	}

	//
	@RequestMapping(value = "/foodWorldcup", method = RequestMethod.GET)
	public ResponseEntity<List<Food>> foodWorldcup() {
		return new ResponseEntity<List<Food>>(HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/foodWorldcup", method = RequestMethod.POST)
	public ResponseEntity<List<Food>> foodWorldcup(HttpSession session) {
		ArrayList<Food> total = (ArrayList<Food>) foodService.selectAll();
		boolean[] v = new boolean[total.size()];
		List<Food> result = new ArrayList<Food>();
		int i = 0;
		while (i < 16) {
			int r = (int) (Math.random() * total.size());
			System.out.print(r + " ");
			if (!v[r]) {
				v[r] = true;
				result.add(total.get(r));
				i++;
			}
		}
		System.out.println();
		return new ResponseEntity<List<Food>>(result, HttpStatus.OK);
	}

	@RequestMapping(value = "/userDelete/{id}", method = RequestMethod.GET)
	public ResponseEntity userDelete(@PathVariable String id, HttpSession session) {
		userService.userDelete(new User(id, null));
		return new ResponseEntity(HttpStatus.OK);
	}

	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public ResponseEntity userUpdate(@RequestBody User user, HttpSession session) {
		User u = (User) session.getAttribute("login");
		u.setAllergy(user.getAllergy());
		u.setEmail(user.getEmail());
		u.setName(user.getName());
		if (user.getPw() == null || user.getPw().equals("")) {
			System.out.println("bbb " + userService.getPW(u));
			u.setPw(userService.getPW(u));
		} else {
			System.out.println("aaa " + user.getPw());
			u.setPw(user.getPw());
		}
		System.out.println(u.toString());
		userService.infoUpdate(u);
		session.setAttribute("login", u);
		return new ResponseEntity(HttpStatus.OK);
	}

	@RequestMapping(value = "/regi", method = RequestMethod.POST)
	public ResponseEntity regi(@RequestBody User user, HttpSession session) {

		if (userService.chkId(user.getId())) {

			userService.addUser(user);
			return new ResponseEntity(HttpStatus.OK);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}

	@RequestMapping(value = "/getProducts/{key}", method = RequestMethod.GET)
	public ResponseEntity<String> getNaverAPIRes(@PathVariable String key) {
		System.out.println(key);
		String res = productService.getProducts(key);
		System.out.println(res);
		return new ResponseEntity<String>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/foodDelete/{code}", method = RequestMethod.GET)
	public ResponseEntity foodDelete(@PathVariable int code, HttpSession session) {
		User u = (User) session.getAttribute("login");
		System.out.println(code + "delete " + u.getId());
		myeatService.deleteFood(u.getId(), code);
		return new ResponseEntity(HttpStatus.OK);
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ResponseEntity<Profile> profile(HttpSession session, HttpServletResponse res) {
		User user = userService.getUserInfo(((User) session.getAttribute("login")).getId());
		List<Eat> eat = myeatService.getAll(user.getId());
		List<EatData> temp = new ArrayList<>();
		for (int i = 0; i < eat.size(); i++) {
			temp.add(new EatData(foodService.searchByCode(eat.get(i).getCode()), eat.get(i).getCount()));
		}
		Profile profile = new Profile(user, temp);
		return new ResponseEntity<Profile>(profile, HttpStatus.OK);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ResponseEntity logout(HttpSession session, HttpServletResponse res) {
		System.out.println("logout  " + session.getId());
		session.invalidate();
		return new ResponseEntity(HttpStatus.OK);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ResponseEntity<User> login() {
		return new ResponseEntity(HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<User> login(@RequestBody User user, HttpSession session, HttpServletResponse res) {
		System.out.println(session.getId());

		if (userService.login(user)) {
			session.setAttribute("login", user);
			System.out.println(user.toString());
			return new ResponseEntity<User>(user, HttpStatus.OK);
		}
		return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
//	@RequestMapping(value = "/login/{id}/{pw}", method = RequestMethod.GET)
//	public ResponseEntity<User> login(@PathVariable String id, @PathVariable String pw, HttpSession session,
//			HttpServletResponse res) {
//		User u = new User(id, pw);
//		System.out.println(u.toString());
//		res.setHeader("Access-Control-Allow-Origin", "http://localhost:8081");
//		res.setHeader("Access-Control-Allow-Credentials", "true");
////		res.setHeader("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS");
////	    res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization, Content-Length, X-Requested-With");
//		System.out.println(session.getId());
//
//		if (userService.login(u)) {
//			session.setAttribute("login", u);
//			return new ResponseEntity<User>(u, HttpStatus.OK);
//		}
//		return new ResponseEntity(HttpStatus.NO_CONTENT);
//	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public ResponseEntity<User> loginCheck(HttpSession session, HttpServletResponse res) {
		System.out.println("logincheck: " + session.getId());
		User u = (User) session.getAttribute("login");
//		res.setHeader("Access-Control-Allow-Origin", "http://localhost:8081");
//		res.setHeader("Access-Control-Allow-Credentials", "true");
//		res.setHeader("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS");
//	    res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization, Content-Length, X-Requested-With");

		if (u == null) {
			return new ResponseEntity<User>(u, HttpStatus.NO_CONTENT);
		} else {
			u = userService.getUserInfo(u.getId());
			System.out.println(u.toString());
			return new ResponseEntity<User>(u, HttpStatus.OK);
		}
	}

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String goMain() {
//		return "index";
//	}

}