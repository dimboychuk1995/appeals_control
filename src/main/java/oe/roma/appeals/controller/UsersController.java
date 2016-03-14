/**
 *
 */
package oe.roma.appeals.controller;

import oe.roma.appeals.domain.Appeal;
import oe.roma.appeals.domain.User;
import oe.roma.appeals.service.AppealsService;
import oe.roma.appeals.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Handles CRUD requests for users
 */
@Controller
@RequestMapping("/users")
public class UsersController {

    protected static Logger logger = Logger.getLogger("controller");

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
    }


    @Resource(name = "userService")
    private IUserService userService;

    @Resource(name = "appealsService")
    private AppealsService appealsService;


    /**
     * Реєстрація
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
        public String add(ModelMap model) {

        logger.debug("Вікно реєстрації");
        model.addAttribute("user",new User());

        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String add(@ModelAttribute("user") User user) {

        logger.debug("Реєстрація нового користувача");
        userService.add(user);

        return "redirect:/";
    }


    /**
     * Редагування звернення
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(ModelMap model, @PathVariable("id") Integer id) {

        logger.debug("Редагую запис id=" + id);

        model.addAttribute("appeal", appealsService.get(id));
        model.addAttribute("type_appeals", appealsService.getTypeAppeals());
        return "editLetter";
    }

    /**
     * Збереження звернення
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String editDo(@ModelAttribute("appeal") Appeal appeal, @PathVariable("id") String id) {

        logger.debug("Зберігаю запис id=" + id);

        appealsService.edit(appeal);

        return "redirect:/";
    }

    /**
     * Delete an existing user
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable("id") Integer id) {

        logger.debug("Видалення запису з бази");

        appealsService.delete(id);

        return "index";

    }

}