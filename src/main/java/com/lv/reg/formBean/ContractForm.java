package com.lv.reg.formBean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContractForm {
    private Long customerId;
    private String region;
    private String district;
    private String villageCouncil;
    private double square;
    private String type;
    private String status;
    private String stage;
    private Boolean isMeasurementDone = false;
    private double totalPrice;
    private double payedAmount;
    private double totalCosts;
    private String comment;
    private boolean isFinished;
    private String assignedTo;

    //quick register customer
    private String customerFirstName;
    private String customerLastName;
    private String customerPhone;

    private Boolean isPaidToGeodez = false;
    private Boolean isPaidToPerformer = false;

    private List<MultipartFile> customerDocument;


}
