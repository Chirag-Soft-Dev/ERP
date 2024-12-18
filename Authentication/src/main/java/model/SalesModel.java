package model;


public class SalesModel {
    private int salesID;
    private String salesPersonName;
    private int target;
    private int numberOfUnits;
    private int numberOfUnitsSold;
    private String completionStatus;

    public SalesModel() {}

    public SalesModel(int salesID, String salesPersonName, int target, int numberOfUnits, int numberOfUnitsSold, String completionStatus) {
        this.salesID = salesID;
        this.salesPersonName = salesPersonName;
        this.target = target;
        this.numberOfUnits = numberOfUnits;
        this.numberOfUnitsSold = numberOfUnitsSold;
        this.completionStatus = completionStatus;
    }

    // Getters and Setters
    public int getSalesID() {
        return salesID;
    }

    public void setSalesID(int salesID) {
        this.salesID = salesID;
    }

    public String getSalesPersonName() {
        return salesPersonName;
    }

    public void setSalesPersonName(String salesPersonName) {
        this.salesPersonName = salesPersonName;
    }

    public int getTarget() {
        return target;
    }

    public void setTarget(int target) {
        this.target = target;
    }

    public int getNumberOfUnits() {
        return numberOfUnits;
    }

    public void setNumberOfUnits(int numberOfUnits) {
        this.numberOfUnits = numberOfUnits;
    }

    public int getNumberOfUnitsSold() {
        return numberOfUnitsSold;
    }

    public void setNumberOfUnitsSold(int numberOfUnitsSold) {
        this.numberOfUnitsSold = numberOfUnitsSold;
    }

    public String getCompletionStatus() {
        return completionStatus;
    }

    public void setCompletionStatus(String completionStatus) {
        this.completionStatus = completionStatus;
    }
}
