package com.web.mvc.validator;

import com.web.mvc.beans.Product;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ProductValidator implements Validator {

    @Override
    public boolean supports(Class<?> klass) {
        return Product.class.isAssignableFrom(klass);
    }

    @Override
    public void validate(Object object, Errors errors) {
        Product product = (Product)object;
        ValidationUtils.rejectIfEmpty(errors, "name", "product.name.required");
        
    }
    
}