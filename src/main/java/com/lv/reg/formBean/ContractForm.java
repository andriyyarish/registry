package com.lv.reg.formBean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContractForm {
    private Long customerId;
    private String region;
    private String district;
    private String type;
    private String status;
    private String stage;
    private double totalPrice;
    private double payedAmount;
    private String comment;
}
