import { LightningElement, wire, api } from 'lwc';
import returnAccountWrapper from "@salesforce/apex/AccountWrapperReturn.returnAccountWrapper";

const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name'},
    { label: 'Type', fieldName: 'Type'},
    { label: 'AnnualRevenue', fieldName: 'AnnualRevenue'}
];

export default class topFiveAccounts extends LightningElement {
    accounts = [];
    error;
    columns = columns;

    @wire(returnAccountWrapper)
    accountWrappers({error, data}) {
        if(data) {
            console.log(data);
            this.accounts = data;
        } else if (error) {
            this.error = error;
            this.accounts = undefined;
        }
    }
}
