/**
 *
 */
package oe.roma.appeals.controller;

import oe.roma.appeals.domain.Appeal;
import oe.roma.appeals.json.JQGridResponse;
import oe.roma.appeals.service.AppealsService;
import oe.roma.appeals.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Handles CRUD requests for users
 */
@Controller
@RequestMapping("/appeal")
public class AppealsController {

    protected static Logger logger = Logger.getLogger("controller");

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }


    @Resource(name = "userService")
    private IUserService userService;

    @Resource(name = "appealsService")
    private AppealsService appealsService;

    /**
     * Показати всі записи
     */
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public @ResponseBody JQGridResponse getAll(
            @RequestParam("_search") Boolean search,
            @RequestParam(value="filters", required=false) String filters,
            @RequestParam(value="page", required=false) String page,
            @RequestParam(value="rows", required=false) Integer limit,
            @RequestParam(value="sidx", required=false) String sidx,
            @RequestParam(value="sord", required=false) String sord) {
        logger.debug("Показую всі звернення");

        System.out.println("search={"+ search+"} filters={"+filters+"} page={"+page+"} rows={"+ limit +"} sidx={"+sidx+"} +sord={"+sord+")" );
        List<Appeal> appeals = appealsService.getAll(limit,Integer.valueOf(page),sidx,sord,filters,String.valueOf(search));
        JQGridResponse response = new JQGridResponse();
        response.setRows(appeals);
        int count = appealsService.getCountAppeals();
        response.setRecords(String.valueOf(count));
        response.setPage(page);

        int total = 0;

        if (count > 0) total = (int) Math.ceil(count/limit)+1;
        System.out.println("{Records="+appeals.size()+"}, {Page="+page+"}, {TotalPages="+total+"},{count="+count+"}");
        response.setTotal(String.valueOf(total));

        return response;
    }


    /**
     * Додати новий запис
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {

        logger.debug("Додавання нового запису");

        model.addAttribute("appeal",new Appeal());
        model.addAttribute("type_appeals", appealsService.getTypeAppeals());
        model.addAttribute("signatures", appealsService.getSignatures());
        model.addAttribute("active", "addAppeal");

        return "addLetter";
    }

    /**
     * Додати новий запис
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addDO(@ModelAttribute("appeal") Appeal appeal) {


        appealsService.add(appeal);

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
        model.addAttribute("signatures", appealsService.getSignatures());

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
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id) {

        logger.debug("Видалення запису з бази");

        appealsService.delete(id);

        return "redirect:/";

    }

    /**
     * Пошук звернення
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(ModelMap model) {
        model.addAttribute("appeal", new Appeal());
        return "search";
    }

    /**
     * Показати всі записи
     */
    @RequestMapping(value = "/getTermToAnswer", method = RequestMethod.POST)
    public @ResponseBody Integer getTermToAnswer (@RequestParam Integer id) {
        Integer count = appealsService.getTermToAnswer(id);
        return count;
    }
    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    public @ResponseBody String sendEmail(@RequestBody Appeal appeal, HttpServletRequest request) {

        String executor = appeal.getExecutor();
        Integer dateDiff = appealsService.getResponseTerm(appeal.getDeadline_term(),new Date());
        String in_number = appeal.getIn_number();
        Date in_date = appeal.getIn_date();
        String text_appeal = appeal.getText_appeal();
        String customer = appeal.getCustomer();
        Date deadline_term = appeal.getDeadline_term();
        String email = appeal.getEmail();

        appealsService.sendEmail(executor,dateDiff,in_number,in_date,text_appeal,customer,deadline_term,email);

        return appealsService.convertDate(new Date());


    }

}