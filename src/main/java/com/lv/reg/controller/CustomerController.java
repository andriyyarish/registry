package com.lv.reg.controller;

import com.lv.reg.dao.CountryDAO;
import com.lv.reg.dao.CustomerRepository;
import com.lv.reg.entities.Customer;
import com.lv.reg.formBean.CustomerUserForm;
import com.lv.reg.formBean.CustomerUserFormValidator;
import com.lv.reg.model.Country;
import com.lv.reg.service.DictionaryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@Controller
@RequestMapping(path = "/customer")
public class CustomerController {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private CustomerUserFormValidator customerUserFormValidator;
    @Autowired
    private DictionaryService dictionaryService;

    @InitBinder
    protected void initBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        if (target.getClass() == CustomerUserForm.class) {
            dataBinder.setValidator(customerUserFormValidator);
        }
    }

    @GetMapping(path = "/all")
    public String getAllCustomers(Model model) {
        Iterable<Customer> all = customerRepository.findAll();
//        CustomerUserForm form = new CustomerUserForm();
//        CustomerUserForm customerUserForm = new CustomerUserForm();
//        model.addAttribute("appUserForm", customerUserForm);
        model.addAttribute("customers", all);
//        model.addAttribute("appUserForm", form);
        return "customersPage";
    }

    @GetMapping(path = "/register")
    public String showRegisterForm(Model model){
        CustomerUserForm customerUserForm = new CustomerUserForm();
        model.addAttribute("customerForm", customerUserForm);
        model.addAttribute("ac_region", dictionaryService.regions());
        model.addAttribute("ac_district", dictionaryService.districts());
        model.addAttribute("ac_village", dictionaryService.villages());
        return "customerRegister";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String saveRegister(Model model, //
                               @ModelAttribute("customerForm") @Validated CustomerUserForm customerUserForm, //
                               BindingResult result, //
                               final RedirectAttributes redirectAttributes) {
        // Validate result
        if (result.hasErrors()) {
            model.addAttribute("errorMessage", "Error occured on form validation. Customer was not created.");
            return "customerRegister";
        }
        Customer customer = null;

        try {
            customer = customerRepository.save(new Customer(customerUserForm));
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error: " + e.getMessage());
            return "customerRegister";
        }
        redirectAttributes.addFlashAttribute("customer", customer);
        return "redirect:/customer/all";
    }
}
